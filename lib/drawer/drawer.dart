import 'package:flutter/material.dart';
import 'package:goodnessapp/utils/colors.dart';
import 'package:goodnessapp/utils/singleton.dart';
import 'package:goodnessapp/utils/strings.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.Drawer_Background.withOpacity(1),
              AppColor.Drawer_Background.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListPage(),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 180,
          child: DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.Drawer_Header_Background.withOpacity(1),
                  AppColor.Drawer_Header_Background.withOpacity(1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.fill,
                    height: 60,
                    width: 60,
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Expanded(
                  child: Text(
                    Singleton.App_Caption,
                    style: TextStyle(
                        color: AppColor.Drawer_Header_Color, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.contact_page, color: AppColor.Drawer_Icon_Color),
          title:
              Text('About Us', style: TextStyle(color: AppColor.Drawer_Color)),
          onTap: () {
            closeDrawer(context);
            Navigator.pushNamed(context, ABOUTUS_ROUTE);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings, color: AppColor.Drawer_Icon_Color),
          title: Text('Satellite Details',
              style: TextStyle(color: AppColor.Drawer_Color)),
          onTap: () {
            closeDrawer(context);
            Navigator.pushNamed(context, SATELITE_ROUTE);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings, color: AppColor.Drawer_Icon_Color),
          title: Text('Platform Service',
              style: TextStyle(color: AppColor.Drawer_Color)),
          onTap: () {
            closeDrawer(context);
            Navigator.pushNamed(context, PLATFORMSERVICE_ROUTE);
          },
        ),
        ListTile(
          leading: Icon(Icons.request_page, color: AppColor.Drawer_Icon_Color),
          title: Text('Prayer Request',
              style: TextStyle(color: AppColor.Drawer_Color)),
          onTap: () {
            closeDrawer(context);
            Navigator.pushNamed(context, PRAYER_ROUTE);
          },
        ),
        ListTile(
          leading: Icon(Icons.feedback, color: AppColor.Drawer_Icon_Color),
          title:
              Text('Feedback', style: TextStyle(color: AppColor.Drawer_Color)),
          onTap: () {
            closeDrawer(context);
            Navigator.pushNamed(context, FEEDBACK_ROUTE);
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_page, color: AppColor.Drawer_Icon_Color),
          title: Text('Contact Us',
              style: TextStyle(color: AppColor.Drawer_Color)),
          onTap: () {
            closeDrawer(context);
            Navigator.pushNamed(context, CONTACT_ROUTE);
          },
        ),
        ListTile(
          leading: Icon(Icons.close, color: AppColor.Drawer_Icon_Color),
          title: Text('Close', style: TextStyle(color: AppColor.Drawer_Color)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Divider(height: 2, color: Colors.grey),
        ListTile(
          title: Text('Powered by',
              style: TextStyle(fontSize: 12, color: AppColor.Drawer_Color)),
          subtitle: Text('Time Channel Communications Pvt Ltd',
              style: TextStyle(
                  fontSize: 12,
                  color: AppColor.Drawer_Color,
                  fontWeight: FontWeight.bold)),
        ),
        Divider(height: 2, color: Colors.grey),
      ],
    );
  }
}

closeDrawer(BuildContext context) {
  Navigator.pop(context);
}
