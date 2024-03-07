// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskStruct extends FFFirebaseStruct {
  TaskStruct({
    String? name,
    DateTime? createdAt,
    bool? completed,
    DateTime? completedAt,
    Priority? priority,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _createdAt = createdAt,
        _completed = completed,
        _completedAt = completedAt,
        _priority = priority,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  set completed(bool? val) => _completed = val;
  bool hasCompleted() => _completed != null;

  // "completed_at" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  set completedAt(DateTime? val) => _completedAt = val;
  bool hasCompletedAt() => _completedAt != null;

  // "priority" field.
  Priority? _priority;
  Priority get priority => _priority ?? Priority.LOW;
  set priority(Priority? val) => _priority = val;
  bool hasPriority() => _priority != null;

  static TaskStruct fromMap(Map<String, dynamic> data) => TaskStruct(
        name: data['name'] as String?,
        createdAt: data['created_at'] as DateTime?,
        completed: data['completed'] as bool?,
        completedAt: data['completed_at'] as DateTime?,
        priority: deserializeEnum<Priority>(data['priority']),
      );

  static TaskStruct? maybeFromMap(dynamic data) =>
      data is Map ? TaskStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'created_at': _createdAt,
        'completed': _completed,
        'completed_at': _completedAt,
        'priority': _priority?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'completed': serializeParam(
          _completed,
          ParamType.bool,
        ),
        'completed_at': serializeParam(
          _completedAt,
          ParamType.DateTime,
        ),
        'priority': serializeParam(
          _priority,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static TaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        completed: deserializeParam(
          data['completed'],
          ParamType.bool,
          false,
        ),
        completedAt: deserializeParam(
          data['completed_at'],
          ParamType.DateTime,
          false,
        ),
        priority: deserializeParam<Priority>(
          data['priority'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'TaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskStruct &&
        name == other.name &&
        createdAt == other.createdAt &&
        completed == other.completed &&
        completedAt == other.completedAt &&
        priority == other.priority;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, createdAt, completed, completedAt, priority]);
}

TaskStruct createTaskStruct({
  String? name,
  DateTime? createdAt,
  bool? completed,
  DateTime? completedAt,
  Priority? priority,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TaskStruct(
      name: name,
      createdAt: createdAt,
      completed: completed,
      completedAt: completedAt,
      priority: priority,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TaskStruct? updateTaskStruct(
  TaskStruct? task, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    task
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTaskStructData(
  Map<String, dynamic> firestoreData,
  TaskStruct? task,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (task == null) {
    return;
  }
  if (task.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && task.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final taskData = getTaskFirestoreData(task, forFieldValue);
  final nestedData = taskData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = task.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTaskFirestoreData(
  TaskStruct? task, [
  bool forFieldValue = false,
]) {
  if (task == null) {
    return {};
  }
  final firestoreData = mapToFirestore(task.toMap());

  // Add any Firestore field values
  task.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTaskListFirestoreData(
  List<TaskStruct>? tasks,
) =>
    tasks?.map((e) => getTaskFirestoreData(e, true)).toList() ?? [];
