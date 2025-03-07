import 'package:flutter/material.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/widgets/meditation_form.dart';

class CreateCustomExercisePage extends StatefulWidget {
  const CreateCustomExercisePage({super.key});

  @override
  State<CreateCustomExercisePage> createState() =>
      _CreateCustomExercisePageState();
}

class _CreateCustomExercisePageState extends State<CreateCustomExercisePage> {
  String typeOfCategory = "Meditation";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Custom Exercise",
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryPurple.withOpacity(0.1),
                    border: Border.all(
                      color: AppColors.primaryPurple,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: typeOfCategory,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.primaryPurple,
                        ),
                        isExpanded: true,
                        items: ["Meditation", "Mindfulness", "Sleep Exercise"]
                            .map((item) {
                          return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primaryDarkBlue,
                                ),
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            typeOfCategory = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MeditationForm(),
            ],
          ),
        ),
      )),
    );
  }
}
