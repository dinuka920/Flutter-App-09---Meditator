import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/providers/mindfull_exercise_provider.dart';
import 'package:meditator_app/router/router_names.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MindfullExercisePage extends StatelessWidget {
  const MindfullExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mindfull Exercises",
          style: AppTextStyles.titleStyle.copyWith(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryPurple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryPurple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onChanged: (value) {
                    Provider.of<MindfullExerciseProvider>(context,
                            listen: false)
                        .searchMindfullExercise(value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<MindfullExerciseProvider>(
                  builder: (context, mindFullExercises, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: mindFullExercises.mindfullExercises.length,
                      itemBuilder: (context, index) {
                        MindfulnessExerciseModel singleMindFullExercise =
                            mindFullExercises.mindfullExercises[index];
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                                RouterName.mindfullExercise,
                                queryParameters: {
                                  "mindfulExercise": jsonEncode(
                                      singleMindFullExercise.toJson()),
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.primaryDarkBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  singleMindFullExercise.imagePath,
                                  width:
                                      MediaQuery.of(context).size.width * 0.13,
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                singleMindFullExercise.name,
                                style: AppTextStyles.subtitleStyle,
                              ),
                              subtitle: Text(
                                singleMindFullExercise.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.bodyStyle.copyWith(
                                  color: AppColors.primaryDarkBlue
                                      .withOpacity(0.7),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
