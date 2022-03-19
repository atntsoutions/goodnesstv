import 'package:flutter/material.dart';

import 'package:goodnessapp/drawer/aboutus.dart';
import 'package:goodnessapp/drawer/contact.dart';
import 'package:goodnessapp/drawer/feedback.dart';
import 'package:goodnessapp/drawer/platformservice.dart';
import 'package:goodnessapp/drawer/prayer.dart';
import 'package:goodnessapp/drawer/satelite.dart';
import 'package:goodnessapp/screens/btvplayer.dart';
import 'package:goodnessapp/screens/tvplayer.dart';
import 'package:goodnessapp/screens/youtube.dart';
import 'package:goodnessapp/players/youtube_player.dart';

import 'utils/strings.dart';
import 'players/radio_player.dart';
import 'home/home.dart';

class AppRouter {
  AppRouter() {}

  Route generateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case DEFAULT_ROUTE:
        return MaterialPageRoute(builder: (_) => HomePage());
      case ABOUTUS_ROUTE:
        return MaterialPageRoute(builder: (_) => AboutusPage());
      case CONTACT_ROUTE:
        return MaterialPageRoute(builder: (_) => ContactPage());
      case SATELITE_ROUTE:
        return MaterialPageRoute(builder: (_) => SatelitePage());
      case PLATFORMSERVICE_ROUTE:
        return MaterialPageRoute(builder: (_) => PlatFormServicePage());
      case PRAYER_ROUTE:
        return MaterialPageRoute(builder: (_) => PrayerPage());
      case FEEDBACK_ROUTE:
        return MaterialPageRoute(builder: (_) => FeedBackPage());
      case BTV_ROUTE:
        String args = settings.arguments.toString();
        return MaterialPageRoute(
            builder: (_) => TvPlayerPage(
                  url: args,
                ));
      case TV_ROUTE:
        String args = settings.arguments.toString();
        return MaterialPageRoute(
            builder: (_) => BTvPlayerPage(
                  url: args,
                ));
      case RADIO_ROUTE:
        String args = settings.arguments.toString();
        return MaterialPageRoute(
            builder: (_) => MyRadioPlayer(
                  radioName: 'Goodness Radio',
                  logo: 'radio.png',
                  url: args,
                ));

      case YOUTUBE_ROUTE:
        final GlobalKey<YoutubePlayerPageState> _youtubePlayerKey =
            GlobalKey<YoutubePlayerPageState>();
        String args = settings.arguments.toString();
        return MaterialPageRoute(
            builder: (_) => YouTubePage(key: _youtubePlayerKey, url: args));

      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
