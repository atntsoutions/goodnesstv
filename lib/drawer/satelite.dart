import 'package:flutter/material.dart';
import 'package:goodnessapp/utils/colors.dart';

class SatelitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Satellite Details', style: TextStyle(fontSize: 16)),
        centerTitle: false,
        backgroundColor: AppColor.Page_Title_Background,
        foregroundColor: AppColor.Page_Title_Color,
        elevation: 0.0,
      ),
      backgroundColor: AppColor.Drawer_Background,
      body: getMainList(),
    );
  }

  getMainList() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Container(
          height: 90,
          width: 90,
          child: Image(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.contain,
          ),
        ),
        Divider(color: AppColor.Divider_Color2, height: 5),
        getRow("Satellite", "Intelsat 17"),
        getRow("Orbital Location", "66.0° East"),
        getRow("Downlink Frequency", "4024 MHz"),
        getRow("Downlink Polarization", "Horizontal"),
        getRow("Frequency Band", "C Band"),
        getRow("Symbol Rate", "14400 Ksps"),
        getRow("FEC", "2/3"),
        getRow("Modulation", "8PSK"),
        getRow("Standard", "DVB-S2"),
        Divider(color: AppColor.Divider_Color2, height: 5),
      ],
    );
  }

  getRow(String col1, String col2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(col1, style: TextStyle(color: AppColor.HomePage_Featured_Color)),
        Text(col2, style: TextStyle(color: AppColor.HomePage_Featured_Color)),
      ],
    );
  }
}
