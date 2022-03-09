import 'package:flutter/material.dart';
import 'package:goodnessapp/utils/colors.dart';

class AboutusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us', style: TextStyle(fontSize: 16)),
          centerTitle: false,
          backgroundColor: AppColor.Page_Title_Background,
          foregroundColor: AppColor.Page_Title_Color,
          elevation: 0.0,
        ),
        backgroundColor: AppColor.Page_Body_Background2,
        body: showListView());
  }

  showListView() {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      Container(
        height: 90,
        width: 90,
        child: Image(
          image: AssetImage("assets/logo.png"),
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(height: 5),
      showHeading(),
      SizedBox(height: 5),
      showBody(),
      SizedBox(height: 5),
      showText('A voice of hope for those in despair'),
      SizedBox(height: 5),
      showText('A beacon of light guiding those in confusion'),
      SizedBox(height: 5),
      showText(
          'A rhythm of joy breaking through the monotonous emptiness of life'),
      SizedBox(height: 5),
      showText(
          'A message of life for those walking through the valley of the shadow of death'),
      SizedBox(height: 5),
      showText('Goodness Television: Tune in for life, joy and goodness'),
      SizedBox(height: 5),
      showText('A voice of hope for those in despair'),
    ]);
  }

  showHeading() {
    return Text(
      'Goodness Television Channel is a devotional Family Channel with God’s own Signature…',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red[900],
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }

  showBody() {
    return Text(
      'This channel has a mission to enrich and empower the families conveying life-giving values of love and goodness. Programs are directed to binding the family in prayer, equipping parents to understand and guide the children and establishing a new generation on the firm foundation of a commitment to truth. Goodness Television telecasts programs in Malayalam and English. The Channel is committed to uphold the values of goodness and truth. We show in the Goodness TV what is needed for our heart’s transformation. ',
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.cyan[900],
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
    );
  }

  showText(String sText) {
    return Text(
      sText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.green[900],
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }
}
