import 'package:flutter/material.dart';
import 'package:meditator_app/utils/colors.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String lableText;
  final String? hintText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType keyBoardType;
  const CustomTextFormFeild({
    super.key,
    required this.lableText,
    this.hintText,
    this.onSaved,
    this.validator,
    required this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: lableText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: AppColors.primaryDarkBlue.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: AppColors.primaryDarkBlue.withOpacity(0.8),
          ),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyBoardType,
    );
  }
}
