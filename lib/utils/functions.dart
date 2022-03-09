import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> launchApp(String _youtubeUrl) async {
  if (await canLaunch(_youtubeUrl)) {
    final bool _nativeAppLaunchSucceeded = await launch(
      _youtubeUrl,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!_nativeAppLaunchSucceeded) {
      try {
        await launch(_youtubeUrl, forceSafariVC: true);
      } catch (e) {}
    }
  }
}

Future<void> launch_tel(String _url) async {
  try {
    await launch(_url);
  } catch (e) {}
}

Future<void> launch_email(String _url) async {
  try {
    await launch(_url);
  } catch (e) {}
}

Future<void> launch_site(String _url) async {
  if (await canLaunch(_url)) {
    try {
      await launch(_url);
    } catch (e) {}
  }
}

Future<dynamic> ReadLocalStorage(String Caption, dynamic value) async {
  final prefs = await SharedPreferences.getInstance();
  if (value.runtimeType.toString().toLowerCase() == "int")
    value = prefs.getInt(Caption) ?? value;
  if (value.runtimeType.toString().toLowerCase() == "string")
    value = prefs.getString(Caption) ?? value;
  if (value.runtimeType.toString().toLowerCase() == "bool")
    value = prefs.getBool(Caption) ?? value;
  if (value.runtimeType.toString().toLowerCase() == "double")
    value = prefs.getDouble(Caption) ?? value;
  return value;
}

Future<bool> SaveLocalStorage(String Caption, dynamic value) async {
  final prefs = await SharedPreferences.getInstance();
  if (value.runtimeType.toString().toLowerCase() == "int")
    return await prefs.setInt(Caption, value);
  if (value.runtimeType.toString().toLowerCase() == "string")
    return await prefs.setString(Caption, value);
  if (value.runtimeType.toString().toLowerCase() == "bool")
    return await prefs.setBool(Caption, value);
  if (value.runtimeType.toString().toLowerCase() == "double")
    return await prefs.setDouble(Caption, value);
  return false;
}

void showAlertDialog(BuildContext context, String title, String message) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(message),
  );
  showDialog(context: context, builder: (_) => alertDialog);
}
