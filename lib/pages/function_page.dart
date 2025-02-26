import 'package:flutter/material.dart';
import 'package:meditator_app/models/function_data_model.dart';

class FunctionPage extends StatelessWidget {
  final FunctionDataModel functionDataModel;
  const FunctionPage({
    super.key,
    required this.functionDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FunctionPage"),
      ),
    );
  }
}
