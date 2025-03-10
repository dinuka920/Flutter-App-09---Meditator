import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/widgets/reuserble/text_input.dart';

class MindfulExerciseForm extends StatefulWidget {
  const MindfulExerciseForm({super.key});

  @override
  State<MindfulExerciseForm> createState() => _MindfulExerciseFormState();
}

class _MindfulExerciseFormState extends State<MindfulExerciseForm> {
  final _formKey = GlobalKey<FormState>();
  String _category = "";
  String _name = "";
  String _description = "";
  List<String> _instructions = [];
  int _duration = 0;
  String _instructionUrl = "";
  File? _imagePath;

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage(ImageSource imageSource) async {
    final pickedFile = await _imagePicker.pickImage(source: imageSource);

    setState(() {
      if (pickedFile != null) {
        _imagePath = File(pickedFile.path);
      } else {
        print("No image Selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create a new Minsful Exercise",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryGreen,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                if (_imagePath != null)
                  Image.file(
                    _imagePath!,
                    height: 200,
                  ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Pick from Camera",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryPurple,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Pick from Gallery",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryPurple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormFeild(
                  lableText: "Category",
                  keyBoardType: TextInputType.text,
                  hintText: "Category",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a Category";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _category = newValue!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFeild(
                  lableText: "Name",
                  keyBoardType: TextInputType.text,
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a Name";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _name = newValue!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFeild(
                  lableText: "Description",
                  keyBoardType: TextInputType.text,
                  hintText: "Description",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a Description";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _description = newValue!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFeild(
                  lableText: "Instructions",
                  keyBoardType: TextInputType.text,
                  hintText: "Instructions",
                  onSaved: (newValue) {
                    _instructions = newValue!.split(",");
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a instructions";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFeild(
                  lableText: "Duration",
                  keyBoardType: TextInputType.number,
                  hintText: "Duration",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a Duration";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _duration = int.parse(newValue!);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFeild(
                  lableText: "Instruction Url",
                  keyBoardType: TextInputType.text,
                  hintText: "Instruction Url",
                  onSaved: (newValue) {
                    _instructionUrl = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a instruction Url";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.primaryGreen,
                        ),
                      ),
                      // Todo Save data
                      onPressed: () {},
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
