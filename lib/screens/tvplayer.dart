import 'package:flutter/material.dart';
import 'package:goodnessapp/utils/colors.dart';
import 'package:goodnessapp/players/good_video_player.dart';
import 'package:wakelock/wakelock.dart';

class TvPlayerPage extends StatefulWidget {
  final String url;
  final GlobalKey<VideoPlayerPageState> _key =
      GlobalKey<VideoPlayerPageState>();
  TvPlayerPage({required this.url});
  @override
  State<TvPlayerPage> createState() => _TvPlayerPageState();
}

class _TvPlayerPageState extends State<TvPlayerPage> {
  @override
  void initState() {
    Wakelock.enable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait ? portrait() : landscape();
    });
  }

  portrait() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('IP TV', style: TextStyle(fontSize: 16)),
        backgroundColor: AppColor.Page_Title_Background,
        foregroundColor: AppColor.Page_Title_Color,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: VideoPlayerPage(key: widget._key, url: widget.url),
        //child: Container(),
      ),
    );
  }

  landscape() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: VideoPlayerPage(key: widget._key, url: widget.url),
        //child: Container(),
      ),
    );
  }

  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }
}
