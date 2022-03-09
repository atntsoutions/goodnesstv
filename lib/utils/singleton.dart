import 'package:flutter/material.dart';

import 'package:goodnessapp/data/models/video.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  factory Singleton() {
    return _singleton;
  }
  Singleton._internal();

  static int Version = 1;

  //static String baseURL = "http://192.168.0.150:1001/resources/GOODNESSTV";

  //static String baseURL_api = "http://10.0.2.2:5000";

  static String baseURL_api = "http://app.timeiptv.in";
  static String baseURL = "http://data.timeiptv.in/resources/GOODNESSTV";

  static var primary = Colors.blue;

  static bool isLoggedIn = false;

  static String App_Company_Code = "GOODNESSTV";

  static String App_Caption = "Goodness TV";

  static int timer_hh = 0;
  static int timer_mm = 60;
  static int timer_ss = 0;

  static List<video> themeList = [];
  static List<video> liveStreamingList = [];
  static List<video> youtTubeFeauredList = [];
  static List<video> youTubeList = [];
  static List<video> socialList = [];
  static List<video> platformList = [];

  static void AssignData(List<video> mList) {
    themeList = [];
    liveStreamingList = [];
    youtTubeFeauredList = [];
    youTubeList = [];
    socialList = [];

    mList.forEach((element) {
      if (element.type == "THEME") themeList.add(element);
      if (element.type == "LIVE-STREAMING") liveStreamingList.add(element);
      if (element.type == "SOCIALMEDIA") socialList.add(element);
      if (element.type == "YOUTUBE") youTubeList.add(element);
      if (element.type == "YOUTUBE" && element.group == "Featured Videos")
        youtTubeFeauredList.add(element);
      if (element.type == "PLATFORM") platformList.add(element);
    });
  }

  static List<video> getPlatformSubList(String _type) {
    return platformList.where((element) => element.group == _type).toList();
  }

  static List<video> getYouTubeSubList(String _type) {
    List<video> data =
        youTubeList.where((element) => element.group == _type).toList();
    return data;
  }

  static List<dynamic> getYoutubeGroupList() {
    List data = youTubeList.map((itm) => itm.group).toList();
    List mList = data.toSet().toList(); // will give you the list
    return mList;
  }
}
