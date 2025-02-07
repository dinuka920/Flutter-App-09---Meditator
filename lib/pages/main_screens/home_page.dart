// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditator_app/models/mindfulness_exercise_model.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/providers/filter_provider.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                                    label: Text("All"),
                                    onSelected: (bool value) {},
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text("Mindfullness"),
                                    onSelected: (bool value) {},
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text("Meditation"),
                                    onSelected: (bool value) {},
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  FilterChip(
                                    label: Text("Sleep Stories"),
                                    onSelected: (bool value) {},
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
                                onTap: () {},
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
