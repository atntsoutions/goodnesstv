import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String url;
  VideoPlayerPage({required Key key, required this.url}) : super(key: key);
  @override
  VideoPlayerPageState createState() => VideoPlayerPageState();
}

class VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  //GlobalKey _playerKey = GlobalKey();

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.url,
      formatHint: VideoFormat.hls,
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.play();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return _videoPlayer();
    return ShowVideo();
  }

  Widget ShowVideo() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

/*
  Widget _videoPlayer() {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
*/
  void startPlayer(String? _url) async {
    setState(() {
      changeDatasource(_url);
    });
    await _controller.play();
  }

  void changeDatasource(String? _url) {}

  void stopPlayer() async {
    try {
      await _controller.pause();
    } catch (e) {
      print('$e');
    }
  }

  void enterFullScreen() {
    try {} catch (e) {
      print('$e');
    }
  }
}
