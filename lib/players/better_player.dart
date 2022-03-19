import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class BetterPlayerPage extends StatefulWidget {
  final String url;
  BetterPlayerPage({required Key key, required this.url}) : super(key: key);
  @override
  BetterPlayerPageState createState() => BetterPlayerPageState();
}

class BetterPlayerPageState extends State<BetterPlayerPage> {
  late BetterPlayerController _controller;
  //GlobalKey _playerKey = GlobalKey();

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      looping: false,
      autoPlay: true,
      fullScreenByDefault: false,
      fullScreenAspectRatio: 16 / 9,
    );

    _controller = BetterPlayerController(betterPlayerConfiguration);
    //_controller.setBetterPlayerGlobalKey(_playerKey);

    if (widget.url != "") changeDatasource(widget.url);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayer();
  }

  Widget _videoPlayer() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: widget.url != ""
          ? BetterPlayer(
              controller: _controller,
              //key: _playerKey,
            )
          : Container(
              child: Center(
                child: Text(
                  'Select a video to play',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[900],
                  ),
                ),
              ),
            ),
    );
  }

  void startPlayer(String? _url) async {
    setState(() {
      changeDatasource(_url);
    });
    await _controller.play();
  }

  void changeDatasource(String? _url) {
    if (_url != null) {
      BetterPlayerDataSource _dataSource =
          BetterPlayerDataSource(BetterPlayerDataSourceType.network, _url);
      _controller.setupDataSource(_dataSource);
    }
  }

  void stopPlayer() async {
    try {
      await _controller.pause();
    } catch (e) {
      print('$e');
    }
  }

  void enterFullScreen() {
    try {
      _controller.enterFullScreen();
    } catch (e) {
      print('$e');
    }
  }
}
