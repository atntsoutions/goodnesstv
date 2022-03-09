import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goodnessapp/business/video_Controller.dart';
import 'package:goodnessapp/utils/colors.dart';
import 'package:goodnessapp/utils/singleton.dart';
import '../utils/strings.dart';
import '../utils/functions.dart';
import '../drawer/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoController _video_controller = new VideoController();
  late Future<bool> _checkServer;
  bool isDarkMode = false;

  @override
  void initState() {
    ResetTheme();
    //AppColor.DarkTheme();
    _checkServer = _video_controller.CheckServer();
    super.initState();
  }

  ResetTheme() {
    ReadLocalStorage('darkmode', isDarkMode).then((value) {
      setState(() {
        isDarkMode = value;
        if (isDarkMode)
          AppColor.DarkTheme();
        else
          AppColor.DefaultScheme();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      backgroundColor: AppColor.Page_Body_Background,
      body: FutureBuilder(
          future: _checkServer,
          builder: (context, dataSnapshot) {
            if (dataSnapshot.hasData) return portrait();
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  portrait() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: false,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              Singleton.App_Caption,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: AppColor.Page_Title_Background,
          foregroundColor: AppColor.Page_Title_Color,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.dark_mode_sharp),
              color: isDarkMode ? Colors.red : Colors.grey,
              tooltip: 'Dark Mode',
              onPressed: () {
                // handle the press
                isDarkMode = !isDarkMode;
                SaveLocalStorage('darkmode', isDarkMode).then((value) {
                  if (value) ResetTheme();
                });
              },
            ),
          ],
        ),
        showLiveStreamingList(),
        showSocialMedialStremingList(),
        showSilverSizedBox(3),
        showSilverCaption("Featured Videos"),
        showFeaturedVideoList(),
      ],
    );
  }

  showLiveStreamingList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SizedBox(height: 5),
          showTheme(),
          SizedBox(height: 7),
          ShowCaption("Live TV/Radio"),
          SizedBox(height: 7),
          showMainList(),
          SizedBox(height: 7),
          ShowCaption("Social Media"),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  showSocialMedialStremingList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          showSocialMediaListHero(),
        ],
      ),
    );
  }

  showSocialMediaListHero() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: .25,
            enlargeCenterPage: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            height: 80,
          ),
          items: Singleton.socialList.map(
            (item) {
              return GestureDetector(
                onTap: () {
                  launchApp(item.url);
                },
                child: getSocialMediaImage(
                    "${Singleton.baseURL}/SOCIALMEDIA/${item.logo}"),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  showSilverCaption(String _caption) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ShowCaption(_caption),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  showSilverSizedBox(double _height) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SizedBox(height: _height),
        ],
      ),
    );
  }

  showTheme() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            viewportFraction: 1,
            autoPlayCurve: Curves.easeIn,
            enlargeCenterPage: false,
          ),
          items: Singleton.themeList.map(
            (item) {
              return Container(
                child:
                    getImagePoster("${Singleton.baseURL}/THEME/${item.logo}"),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  showMainList() {
    return Row(
      children: Singleton.liveStreamingList.map((item) {
        return Expanded(
            child: showCard(item.group, item.url,
                '${Singleton.baseURL}/LIVE-STREAMING/${item.logo}'));
      }).toList(),
    );
  }

  showCard(String stype, String url, String fileName) {
    return GestureDetector(
      onTap: () {
        print(stype);
        print(fileName);
        print(url);
        try {
          if (stype == "TV") {
            Navigator.pushNamed(context, TV_ROUTE, arguments: url);
          } else if (stype == "RADIO") {
            Navigator.pushNamed(context, RADIO_ROUTE, arguments: url);
          } else {
            launchApp("");
          }
        } catch (e) {
          print(e);
        }
      },
      child: Card(
        color: AppColor.Main_List_Card_Background,
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CachedNetworkImage(
            imageUrl: "${fileName}",
            fit: BoxFit.fill,
            height: 70,
            width: 70,
            alignment: Alignment.center,
            placeholder: (context, url) {
              return SizedBox(
                width: 10,
                height: 10,
                child: Center(child: CircularProgressIndicator()),
              );
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  ShowCaption(String _caption) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 10),
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

  showFeaturedVideoList() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      delegate: SliverChildListDelegate(
        Singleton.youtTubeFeauredList.map((item) {
          return GestureDetector(
            onTap: () {
              print(item.url);
              Navigator.pushNamed(context, YOUTUBE_ROUTE, arguments: item.url);
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Card(
                  margin: EdgeInsets.all(1),
                  color: AppColor.HomePage_Featued_Card_Background,
                  elevation: 1.0,
                  child: CachedNetworkImage(
                    imageUrl: "https://img.youtube.com/vi/${item.url}/0.jpg",
                    fit: BoxFit.fill,
                    placeholder: (context, url) {
                      return SizedBox(
                        width: 10,
                        height: 10,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  getImagePoster(String imgName) {
    try {
      return CachedNetworkImage(
        imageUrl: imgName,
        fit: BoxFit.fill,
        placeholder: (context, url) => LinearProgressIndicator(
          backgroundColor: Colors.red[700],
          color: Colors.red[700],
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } catch (e) {
      return Container();
    }
  }

  getSocialMediaImage(String imgName) {
    try {
      return CachedNetworkImage(
        imageUrl: imgName,
        fit: BoxFit.fill,
        placeholder: (context, url) {
          return Center(child: CircularProgressIndicator());
        },
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } catch (e) {
      return Container();
    }
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

  //HomePage Class Closing

}
