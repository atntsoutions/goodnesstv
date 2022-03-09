import 'package:flutter/material.dart';
import 'package:goodnessapp/utils/colors.dart';
import 'package:goodnessapp/utils/functions.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Us', style: TextStyle(fontSize: 16)),
          centerTitle: false,
          backgroundColor: AppColor.Page_Title_Background,
          foregroundColor: AppColor.Page_Title_Color,
          elevation: 0.0,
        ),
        backgroundColor: AppColor.Drawer_Background,
        body: getMainList());
  }

  getMainList() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 90,
          width: 90,
          child: Image(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(height: 10),
        Center(
          child: Text(
            'Goodness Media Private Limited',
            style: TextStyle(
              color: AppColor.Drawer_Color,
              letterSpacing: 0.0,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            'SRM Road, Ernakulam,',
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ),
        Center(
          child: Text(
            'Kerala, India',
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Divider(height: 2.0, color: AppColor.Divider_Color2),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(Icons.phone, color: Colors.amber[900]),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_tel('tel:+914842406240');
                },
                child: Text(
                  '+91 484 2406240',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(Icons.mobile_friendly_rounded, color: Colors.amber[900]),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_tel('tel:+919778702654');
                },
                child: Text(
                  '+91 9778702654',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(Icons.email, color: Colors.amber[900]),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_email('mailto:feedback@goodnesstv.in');
                },
                child: Text(
                  'feedback@goodnesstv.in',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(
                Icons.email,
                color: Colors.amber[900],
              ),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_email('mailto:info@goodnesstv.in');
                },
                child: Text(
                  'info@goodnesstv.in',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(
                Icons.web,
                color: Colors.amber[900],
              ),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_site('https://www.goodnesstv.in');
                },
                child: Text(
                  'www.goodnesstv.in',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Divider(height: 2.0, color: AppColor.Divider_Color2),
        SizedBox(height: 10),
        Center(
          child: Text(
            'Feel Free To Contact Us',
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ],
    );
  }

  getList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          child: Image(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            'Goodness Media Private Limited',
            style: TextStyle(
              color: AppColor.Drawer_Color,
              letterSpacing: 0.0,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            'SRM Road, Ernakulam,',
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ),
        Center(
          child: Text(
            'Kerala, India',
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Divider(height: 2.0, color: Colors.white),
        SizedBox(height: 5.0),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(Icons.phone, color: Colors.amber[900]),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_tel('tel:+914842406240');
                },
                child: Text(
                  '+91 484 2406240',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(Icons.mobile_friendly_rounded, color: Colors.amber[900]),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_tel('tel:+919778702654');
                },
                child: Text(
                  '+91 9778702654',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(Icons.email, color: Colors.amber[900]),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_email('mailto:feedback@goodnesstv.in');
                },
                child: Text(
                  'feedback@goodnesstv.in',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(
                Icons.email,
                color: Colors.amber[900],
              ),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_email('mailto:info@goodnesstv.in');
                },
                child: Text(
                  'info@goodnesstv.in',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Icon(
                Icons.web,
                color: Colors.amber[900],
              ),
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  launch_site('https://www.goodnesstv.in');
                },
                child: Text(
                  'www.goodnesstv.in',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Feel Free To Contact Us',
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
