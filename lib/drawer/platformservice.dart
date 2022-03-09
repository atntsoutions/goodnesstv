import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goodnessapp/utils/colors.dart';
import 'package:goodnessapp/utils/singleton.dart';

class PlatFormServicePage extends StatelessWidget {
  const PlatFormServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.Page_Title_Background,
          foregroundColor: AppColor.Page_Title_Color,
          elevation: 0.0,
          bottom: TabBar(
            tabs: [
              Tab(text: "Cable TV"),
              Tab(text: "DTH"),
              Tab(text: "OTT"),
            ],
          ),
          title: Text('Platform Service', style: TextStyle(fontSize: 16)),
        ),
        backgroundColor: AppColor.Page_Body_Background2,
        body: TabBarView(
          children: [
            showImages('CABLE'),
            showImages('DTH'),
            showImages('OTT'),
          ],
        ),
      ),
    );
  }

  showImages(String _type) {
    return GridView.count(
      crossAxisCount: 3,
      controller: new ScrollController(keepScrollOffset: false),
      scrollDirection: Axis.vertical,
      children: Singleton.getPlatformSubList(_type).map((item) {
        return Container(
          padding: EdgeInsets.only(top: 10, left: 2, right: 2),
          child: Card(
            color: Colors.white,
            elevation: 6.0,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CachedNetworkImage(
                imageUrl: "${Singleton.baseURL}/PLATFORM/${item.logo}",
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
