
import 'package:flutter/material.dart';

class AppColor {
  static Color Page_Title_Background = Colors.red;
  static Color Page_Title_Color = Colors.white;
  static Color Page_Body_Background = Colors.white;

  static Color Page_Body_Background2 = Colors.white;

  static Color HomePage_MainList_Card_Background = Colors.white;
  static Color HomePage_Featured_Color = Colors.red;
  static Color HomePage_Featued_Card_Background = Colors.white;

  static Color Drawer_Background = Colors.white;
  static Color Drawer_Color = Colors.black;
  static Color Drawer_Icon_Color = Colors.black;

  static Color Drawer_Header_Background = Colors.red;
  static Color Drawer_Header_Color = Colors.white;

  static Color Divider_Color = Colors.grey;

  static Color Divider_Color2 = Colors.red;

  static Color Main_List_Card_Background = Colors.white;

  static DefaultScheme() {
    Page_Title_Background = Colors.red;
    Page_Title_Color = Colors.white;
    Page_Body_Background = Colors.white;
    Page_Body_Background2 = Colors.white;

    HomePage_MainList_Card_Background = Colors.white;

    HomePage_Featured_Color = Colors.red;
    HomePage_Featued_Card_Background = Colors.white;

    Drawer_Background = Colors.white;
    Drawer_Color = Colors.black;
    Drawer_Icon_Color = Colors.black;

    Drawer_Header_Background = Colors.red;
    Drawer_Header_Color = Colors.white;

    Divider_Color = Colors.grey;
    Divider_Color2 = Colors.red;

    Main_List_Card_Background = Colors.white;
  }

  static DarkTheme() {
    Page_Title_Background = Colors.black;
    Page_Title_Color = Colors.grey;
    Page_Body_Background = Colors.black;
    Page_Body_Background2 = Colors.grey;

    HomePage_MainList_Card_Background = Colors.grey;

    HomePage_Featured_Color = Colors.grey;
    HomePage_Featued_Card_Background = Colors.grey;

    Drawer_Background = Color(0xFF212121);
    Drawer_Color = Colors.grey;
    Drawer_Icon_Color = Colors.grey;
    Drawer_Header_Background = Colors.black;
    Drawer_Header_Color = Colors.grey;

    Divider_Color = Color(0xFF212121);

    Divider_Color2 = Colors.white;

    Main_List_Card_Background = Colors.transparent;
  }
}
