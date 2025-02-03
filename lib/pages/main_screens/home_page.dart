import 'package:flutter/material.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
