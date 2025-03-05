import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:meditator_app/models/function_data_model.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/providers/filter_provider.dart';
import 'package:meditator_app/router/router_names.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // handle mindfullness exercises pressed
  void handleMindfullExercisesPressed(
      BuildContext context, MindfulnessExerciseModel data) {
    GoRouter.of(context).pushNamed(
      RouterName.mindfullExerciseTimer,
      queryParameters: {
        "mindfullExerciseTimer": jsonEncode(data.toJson()),
      },
    );
  }

  // handle Meditation exercises pressed
  void handleMeditationExercisesPressed(
    BuildContext context,
    final name,
    final description,
    final duration,
    final category,
    final videoUrl,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryPurple,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGrey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$duration min",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryGreen,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push(
                          "/functions",
                          extra: FunctionDataModel(
                            name: name,
                            description: description,
                            duration: duration,
                            category: category,
                            videoUrl: videoUrl,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          AppColors.primaryGreen,
                        ),
                        shadowColor: WidgetStatePropertyAll<Color>(
                          Colors.transparent,
                        ),
                      ),
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryBlack,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.primaryGrey),
                        shadowColor: WidgetStatePropertyAll(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryBlack,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // handle sleep exercises pressed
  void handleSleepExercisesPressed(
      BuildContext context, SleepExerciseModel data) {
    GoRouter.of(context).pushNamed(
      RouterName.sleepExerciseTimer,
      queryParameters: {
        "sleepExercise": jsonEncode(data.tojson()),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterProvider>(context, listen: false)
              .getData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: const Text("Error Loading Data"),
              );
            }
            return Consumer<FilterProvider>(
              builder: (BuildContext context, FilterProvider filterData,
                  Widget? child) {
                final completedData = filterData.filterData;
                completedData.shuffle();

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/meditation.png",
                              width: MediaQuery.of(context).size.width * 0.09,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Meditator",
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryPurple,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Select a category to start exploring",
                          style: AppTextStyles.subtitleStyle.copyWith(
                            color: AppColors.primaryDarkBlue,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryPurple.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  FilterChip(
                                    label: Text(
                                      "All",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCatagory() ==
                                                    "All"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("All");
                                    },
                                    selected:
                                        filterData.getSelectedCatagory() ==
                                            "All",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Mindfullness",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCatagory() ==
                                                    "Mindfullness"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Mindfullness");
                                    },
                                    selected:
                                        filterData.getSelectedCatagory() ==
                                            "Mindfullness",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Meditation",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCatagory() ==
                                                    "Meditation"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Meditation");
                                    },
                                    selected:
                                        filterData.getSelectedCatagory() ==
                                            "Meditation",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Sleep Stories",
                                      style: TextStyle(
                                        color:
                                            filterData.getSelectedCatagory() ==
                                                    "Sleep Stories"
                                                ? AppColors.primaryWhite
                                                : AppColors.primaryBlack,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Sleep Stories");
                                    },
                                    selected:
                                        filterData.getSelectedCatagory() ==
                                            "Sleep Stories",
                                    selectedColor: AppColors.primaryPurple,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: AppColors.primaryPurple
                                            .withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (completedData.isNotEmpty)
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: completedData.map((data) {
                              return GestureDetector(
                                onTap: () {
                                  if (data is MindfulnessExerciseModel) {
                                    handleMindfullExercisesPressed(
                                      context,
                                      data,
                                    );
                                  } else if (data is MeditationExerciseModel) {
                                    handleMeditationExercisesPressed(
                                      context,
                                      data.name,
                                      data.description,
                                      data.duration,
                                      data.category,
                                      data.videoUrl,
                                    );
                                  } else {
                                    handleSleepExercisesPressed(
                                      context,
                                      data,
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: data is MindfulnessExerciseModel
                                        ? AppColors.primaryGreen
                                        : data is SleepExerciseModel
                                            ? AppColors.primaryPurple
                                            : AppColors.primaryDarkBlue
                                                .withOpacity(0.6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.name,
                                          style:
                                              AppTextStyles.titleStyle.copyWith(
                                            color: AppColors.primaryWhite,
                                          ),
                                        ),
                                        Text(
                                          data.category,
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryBlack
                                                .withOpacity(0.5),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${data.duration} min",
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryBlack
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                        Text(
                                          data.description,
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryWhite,
                                          ),
                                          maxLines:
                                              (data.description.length / 2)
                                                  .toInt(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
