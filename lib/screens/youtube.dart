import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:goodnessapp/players/youtube_player.dart';
import 'package:goodnessapp/utils/colors.dart';
import 'package:goodnessapp/utils/singleton.dart';
import 'package:share_plus/share_plus.dart';

class YouTubePage extends StatefulWidget {
  final String url;
  final Key key;
  YouTubePage({required this.key, required this.url}) : super(key: key);

  @override
  _YouTubePageState createState() => _YouTubePageState();
}

class _YouTubePageState extends State<YouTubePage> {
  final GlobalKey<YoutubePlayerPageState> _youtubeState =
      GlobalKey<YoutubePlayerPageState>();
  String selectedURL = "";
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait ? portrait() : landscape();
    });
  }

  portrait() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube Videos", style: TextStyle(fontSize: 16)),
        backgroundColor: AppColor.Page_Title_Background,
        foregroundColor: AppColor.Page_Title_Color,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            tooltip: 'Share',
            onPressed: () {
              String _id = _youtubeState.currentState!.getplayingid();
              Share.share(
                  'https://www.youtube.com/watch?v=' +
                      _id +
                      ' \n Pls download Goodness Mobile App to see latest youtube videos',
                  subject: "Goodness App - Video");
            },
          ),
        ],
      ),
      body: Container(
        color: AppColor.Page_Body_Background,
        child: Column(
          children: [
            showHero(),
            Expanded(
              child: showVideos(),
            ),
          ],
        ),
      ),
    );
  }

  showVideos() {
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildListDelegate(showSocialMedialStremingList()),
      ),
    ]);
  }

  showSocialMedialStremingList() {
    int count = Singleton.getYoutubeGroupList().length;
    List<Widget> Items = [];
    String grp = "";
    for (int k = 0; k < count; k++) {
      Items.add(
        ShowCaption(Singleton.getYoutubeGroupList()[k]),
      );
      grp = Singleton.getYoutubeGroupList()[k];
      Items.add(showVideoList(grp, k));
    }
    return Items;
  }

  showVideoList(String grp, int ctr) {
    return Container(
      width: 100,
      height: 100,
      child: Padding(
        padding: EdgeInsets.only(left: 1, right: 1, top: 1),
        child: CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: true,
            autoPlay: ctr == 0 ? true : false,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: .3,
            enlargeCenterPage: false,
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: Singleton.getYouTubeSubList(grp).map(
            (item) {
              return GestureDetector(
                onTap: () {
                  startVideo(item.url);
                },
                child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: getYoutbueImage(
                        "https://img.youtube.com/vi/${item.url}/0.jpg")),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  ShowCaption(String _caption) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3, right: 1, top: 7, bottom: 7),
          child: Text(
            _caption,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColor.HomePage_Featured_Color,
            ),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  landscape() {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: showHero(),
            ),
          ],
        ),
      ),
    );
  }

  showHero() {
    return Container(
      color: AppColor.Drawer_Background,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: YoutubePlayerPage(
          key: _youtubeState,
          id: widget.url,
          videoList: Singleton.youTubeList,
        ),
      ),
    );
  }

  void startVideo(String _url) {
    _youtubeState.currentState!.startPlayer(_url);
  }

  void stopVideo() {
    _youtubeState.currentState!.stopPlayer();
  }

  getYoutbueImage(String imgName) {
    try {
      return CachedNetworkImage(
        imageUrl: imgName,
        fit: BoxFit.fill,
        placeholder: (context, url) {
          return SizedBox(
            width: 10,
            height: 10,
            child: Center(child: CircularProgressIndicator()),
          );
        },
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } catch (e) {
      return Container();
    }
  }
}
