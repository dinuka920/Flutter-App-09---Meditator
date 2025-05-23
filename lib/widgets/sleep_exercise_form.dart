import 'package:flutter/material.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/providers/custom_data_provider.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/widgets/reuserble/text_input.dart';
import 'package:provider/provider.dart';

class SleepExerciseForm extends StatefulWidget {
  const SleepExerciseForm({super.key});

  @override
  State<SleepExerciseForm> createState() => _SleepExerciseFormState();
}

class _SleepExerciseFormState extends State<SleepExerciseForm> {
  final _formKey = GlobalKey<FormState>();

  String _catagory = "";
  String _name = "";
  String _description = "";
  int _duration = 0;
  String _audioUrl = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create a new Sleep Exercise",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGreen,
                  ),
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
                    _catagory = newValue!;
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
                  lableText: "Audio Url",
                  keyBoardType: TextInputType.text,
                  hintText: "Audio Url",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a Audio Url";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _audioUrl = newValue!;
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
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          AppColors.primaryGreen,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final sleepExercise = SleepExerciseModel(
                            category: _catagory,
                            name: _name,
                            description: _description,
                            duration: _duration,
                            audioUrl: _audioUrl,
                          );

                          _formKey.currentState!.reset();
                          _catagory = "";
                          _name = "";
                          _description = "";
                          _duration = 0;
                          _audioUrl = "";

                          Provider.of<CustomDataProvider>(context,
                                  listen: false)
                              .addSleepExercise(sleepExercise, context);
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
