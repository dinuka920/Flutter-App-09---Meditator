import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditator_app/providers/filter_provider.dart';
import 'package:meditator_app/providers/meditation_exercise_provider.dart';
import 'package:meditator_app/providers/mindfull_exercise_provider.dart';
import 'package:meditator_app/providers/sleep_exercise_provider.dart';
import 'package:meditator_app/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MindfullExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeditationExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SleepExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Meditate App",
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routerConfig: RouterClass().router,
    );
  }
}
