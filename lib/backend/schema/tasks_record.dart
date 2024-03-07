import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "task" field.
  TaskStruct? _task;
  TaskStruct get task => _task ?? TaskStruct();
  bool hasTask() => _task != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _task = TaskStruct.maybeFromMap(snapshotData['task']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  DocumentReference? user,
  TaskStruct? task,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'task': TaskStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "task" field.
  addTaskStructData(firestoreData, task, 'task');

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.user == e2?.user && e1?.task == e2?.task;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([e?.user, e?.task]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
