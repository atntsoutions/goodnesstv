import 'package:flutter/material.dart';
import 'package:goodnessapp/data/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatefulWidget {
  final String id;
  final List<video> videoList;
  YoutubePlayerPage(
      {required Key key, required this.id, required this.videoList})
      : super(key: key);
  @override
  YoutubePlayerPageState createState() => YoutubePlayerPageState();
}

class YoutubePlayerPageState extends State<YoutubePlayerPage> {
  //GlobalKey _playerKey = GlobalKey();
  bool _isPlayerReady = false;
  late YoutubePlayerController _controller;
  String url_id = "";
  @override
  void initState() {
    url_id = widget.id;
    initPlayer();
    super.initState();
  }

  void initPlayer() {
    _isPlayerReady = false;
    _controller = YoutubePlayerController(
      initialVideoId: url_id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        controlsVisibleAtStart: true,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getVideo();
  }

  YoutubePlayerBuilder getVideo() {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        //key: _playerKey,
        controller: _controller,
        showVideoProgressIndicator: true,
        aspectRatio: 16 / 9,
        onReady: () {
          setState(() {
            _isPlayerReady = true;
          });
        },
        onEnded: (data) {
          int pos = widget.videoList
                  .indexWhere((element) => element.url == data.videoId) +
              1;
          url_id = widget.videoList[pos % widget.videoList.length].url;
          _controller.load(url_id);
        },
      ),
      builder: (context, player) {
        return Column(
          children: [
            // some widgets
            player,
            //some other widgets
          ],
        );
      },
    );
  }

  void startPlayer(String? _id) {
    print('Youtube ' + _id!);
    url_id = _id;
    stopPlayer();
    changeDatasource(_id);
    _controller.play();
  }

  void changeDatasource(String? _id) {
    if (_id != null) {
      _controller.load(getVideoId(_id));
    }
  }

  String getplayingid() {
    return url_id;
  }

  void stopPlayer() {
    try {
      _controller.pause();
    } catch (exception) {}
  }

  String getVideoId(String url) {
    var id = "";
    try {
      id = YoutubePlayer.convertUrlToId(url)!;
    } catch (error) {
      id = "";
    }
    return id;
  }
}
