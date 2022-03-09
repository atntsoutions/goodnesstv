import 'package:flutter/material.dart';
import 'package:goodnessapp/players/stopwatch.dart';
import 'package:goodnessapp/utils/colors.dart';
import 'package:radio_player/radio_player.dart';

class MyRadioPlayer extends StatefulWidget {
  final radioName;
  final url;
  final logo;
  MyRadioPlayer(
      {required this.radioName, required this.url, required this.logo});
  @override
  MyRadioPlayerState createState() => MyRadioPlayerState();
}

class MyRadioPlayerState extends State<MyRadioPlayer> {
  RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  List<String>? metadata;
  String _logo = "";

  @override
  void initState() {
    super.initState();
    _logo = widget.logo == "" ? 'radio.jpg' : widget.logo;
    initRadioPlayer();
  }

  //'https://streaming.radio.co/s4f2cc35de/listen'

  void initRadioPlayer() {
    _radioPlayer.setMediaItem(widget.radioName, widget.url, 'assets/$_logo');

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
        if (!isPlaying) _radioPlayer.play();
      });
    });
  }

  @override
  void dispose() {
    stopPlayer();
    super.dispose();
  }

  void childActions(String _actions) {
    if (_actions == "TOGGLEPLAY") {
      isPlaying ? _radioPlayer.pause() : _radioPlayer.play();
    }
    if (_actions == "STOP") {
      stopPlayer();
    }
  }

  void stopPlayer() async {
    try {
      await _radioPlayer.pause();
    } catch (e) {
      print('$e');
    }
  }

  void startPlayer() async {
    try {
      await _radioPlayer.play();
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.radioName, style: TextStyle(fontSize: 16)),
        backgroundColor: AppColor.Page_Title_Background,
        foregroundColor: AppColor.Page_Title_Color,
        elevation: 0,
      ),
      backgroundColor: AppColor.Page_Body_Background2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: _radioPlayer.getMetadataArtwork(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                Image artwork;
                if (snapshot.hasData) {
                  artwork = snapshot.data;
                } else {
                  artwork = Image.asset(
                    'assets/$_logo',
                    fit: BoxFit.fill,
                  );
                }
                return Container(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    child: artwork,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Divider(height: 1, color: AppColor.Divider_Color),
            SizedBox(height: 10),
            Text(
              metadata?[0] ?? '...',
              softWrap: false,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.brown[900],
              ),
            ),
            SizedBox(height: 2),
            Text(
              metadata?[1] ?? '...',
              softWrap: false,
              overflow: TextOverflow.fade,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green[900]),
            ),
            SizedBox(height: 10),
            Divider(height: 1, color: AppColor.Divider_Color),
            SizedBox(height: 10),
            StopWatchTimerPage(childActions, isPlaying),
            SizedBox(height: 10),
            Divider(height: 1, color: AppColor.Divider_Color),
          ],
        ),
      ),
    );
  }
}
