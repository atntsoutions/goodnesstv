import 'package:flutter/material.dart';
import 'package:goodnessapp/players/better_player.dart';
import 'package:goodnessapp/utils/colors.dart';
import 'package:wakelock/wakelock.dart';

class BTvPlayerPage extends StatefulWidget {
  final String url;
  final GlobalKey<BetterPlayerPageState> _key =
      GlobalKey<BetterPlayerPageState>();
  BTvPlayerPage({required this.url});
  @override
  State<BTvPlayerPage> createState() => _BTvPlayerPageState();
}

class _BTvPlayerPageState extends State<BTvPlayerPage> {
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
        title: Text('TV PLAYER', style: TextStyle(fontSize: 16)),
        backgroundColor: AppColor.Page_Title_Background,
        foregroundColor: AppColor.Page_Title_Color,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BetterPlayerPage(key: widget._key, url: widget.url),
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
        child: BetterPlayerPage(key: widget._key, url: widget.url),
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
