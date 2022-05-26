import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../statemanagement/controllers/home_controller.dart';
import '../neumophoric/neumophoric.dart';



class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

final HomeController homeController = Get.put(HomeController());

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/images/crest.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // mutes the video
      _controller.setVolume(0);
      // Plays the video once the widget is build and loaded.
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
        builder: (context, orientation)
    {
      return Flexible(child:
        Obx(() =>
          FittedBox(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              fit: BoxFit.cover,

              child: Neumophoric(
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          decoration: BoxDecoration(
                            color: homeController.isDarkMode.value
                                ? Colors.black
                                : const Color(0xFF18FFFF),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                color: homeController.isDarkMode.value
                                    ? Colors.black.withOpacity(0.2)
                                    : const Color(0xFF18FFFF).withOpacity(0.2),
                              ),
                            ],
                          ),
                          child: Stack(children: [
                            FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return SizedBox(
                                      height: 400,
                                      width: 700,
                                      child: Stack(children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                25.0),
                                            child: Center(
                                                child: AspectRatio(
                                                  aspectRatio:
                                                  _controller.value.aspectRatio,
                                                  child: VideoPlayer(
                                                    _controller,
                                                  ),
                                                )))
                                      ]));
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),

                          ])))))));
    });
  }}