import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/utils/colors.dart';

class SleepExerciseTimer extends StatefulWidget {
  final SleepExerciseModel sleepExerciseModel;
  const SleepExerciseTimer({
    super.key,
    required this.sleepExerciseModel,
  });

  @override
  State<SleepExerciseTimer> createState() => _SleepExerciseTimerState();
}

class _SleepExerciseTimerState extends State<SleepExerciseTimer> {
  Timer? _timer;
  int _remaningTime = 0;
  bool _isRunnig = false;

  @override
  void initState() {
    _remaningTime = widget.sleepExerciseModel.duration * 60;
    super.initState();
  }

  // method to start the timer
  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _isRunnig = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remaningTime > 0) {
          _remaningTime--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  // methode to pause the timer
  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _isRunnig = false;
    }
  }

  // methode to Stop the timer
  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      setState(() {
        _remaningTime = widget.sleepExerciseModel.duration * 60;
        _isRunnig = false;
      });
    }
  }

  // time format
  String _formatTime(int second) {
    final int minutes = second ~/ 60;
    final int remaningSecond = second % 60;
    return "$minutes : ${remaningSecond.toString().padLeft(2, "0")}";
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sleep Story Timer"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sleepExerciseModel.category,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.sleepExerciseModel.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Duration: ${widget.sleepExerciseModel.duration} minutes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.sleepExerciseModel.description,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  _formatTime(_remaningTime),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isRunnig ? _pauseTimer() : _startTimer();
                      });
                    },
                    child: Text(
                      _isRunnig
                          ? "Pause"
                          : (_remaningTime <
                                  widget.sleepExerciseModel.duration * 60
                              ? "Resume"
                              : "Start"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _stopTimer();
                    },
                    child: Text("Stop"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
