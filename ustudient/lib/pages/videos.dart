import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

class videos_screen extends StatefulWidget {
  const videos_screen({Key? key}) : super(key: key);

  @override
  State<videos_screen> createState() => _videos_screenState();
}

class _videos_screenState extends State<videos_screen> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.asset('assets/1.mp4'),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PodVideoPlayer(controller: controller),
    );
  }
}