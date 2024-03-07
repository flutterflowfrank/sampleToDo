import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'action2_sheet_simple_widget.dart' show Action2SheetSimpleWidget;
import 'package:flutter/material.dart';

class Action2SheetSimpleModel
    extends FlutterFlowModel<Action2SheetSimpleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameController;
  String? Function(BuildContext, String?)? taskNameControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskNameFocusNode?.dispose();
    taskNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
