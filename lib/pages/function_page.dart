import 'package:flutter/material.dart';
import 'package:meditator_app/models/function_data_model.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FunctionPage extends StatefulWidget {
  final FunctionDataModel functionDataModel;
  const FunctionPage({
    super.key,
    required this.functionDataModel,
  });

  @override
  State<FunctionPage> createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // get video id from video url
    final videoId = YoutubePlayer.convertUrlToId(
          widget.functionDataModel.videoUrl,
        ) ??
        "";
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.functionDataModel.name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_controller.initialVideoId.isNotEmpty)
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: YoutubePlayer(controller: _controller),
                    ),
                  )
                else
                  const Text("No video Available!"),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Duration: ${widget.functionDataModel.duration} min",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryGrey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Category: ${widget.functionDataModel.category}",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryGreen,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.functionDataModel.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryDarkBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
