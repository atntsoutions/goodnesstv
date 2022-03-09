import 'package:flutter/material.dart';
import 'package:goodnessapp/business/mail_controller.dart';
import 'package:goodnessapp/utils/colors.dart';
import 'package:goodnessapp/utils/functions.dart';
import 'package:goodnessapp/utils/singleton.dart';
import 'package:loading_overlay/loading_overlay.dart';

class FeedBackPage extends StatefulWidget {
  @override
  FeedBackPageState createState() => FeedBackPageState();
}

class FeedBackPageState extends State<FeedBackPage> {
  final _nameController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _msgController = TextEditingController(text: '');

  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form', style: TextStyle(fontSize: 16)),
        centerTitle: false,
        backgroundColor: AppColor.Page_Title_Background,
        foregroundColor: AppColor.Page_Title_Color,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: sendMail,
            icon: Icon(Icons.send),
          )
        ],
      ),
      backgroundColor: AppColor.Page_Body_Background2,
      body: LoadingOverlay(
        child: messageBody(),
        isLoading: _saving,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(),
      ),
    );
  }

  messageBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black38,
                    width: 0.0,
                  ),
                ),
                labelStyle: TextStyle(color: Colors.black),
                focusColor: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email Id',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black38,
                    width: 0.0,
                  ),
                ),
                labelStyle: TextStyle(color: Colors.black),
                focusColor: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _msgController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black38,
                      width: 0.0,
                    ),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  focusColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  allValid(String _field) {
    dynamic _value;
    switch (_field) {
      case 'NAME':
        {
          _value = _nameController.text.trim();
          if (_value.length <= 0 || _value.isEmpty) {
            showAlertDialog(context, 'Status', 'Name Cannot Be Blank');
            return false;
          }
          return true;
        }
      case 'EMAIL':
        {
          _value = _emailController.text.trim();
          if (_value.length <= 0 || _value.isEmpty) {
            showAlertDialog(context, 'Status', 'Invalid Email');
            return false;
          }
          return true;
        }
      case 'MESSAGE':
        {
          _value = _msgController.text.trim();
          if (_value.length <= 0 || _value.isEmpty) {
            showAlertDialog(context, 'Status', 'Message Cannot Be Blank');
            return false;
          }
          return true;
        }
      default:
        return false;
    }
  }

  Future<void> sendMail() async {
    if (!allValid("NAME")) return;
    if (!allValid("EMAIL")) return;
    if (!allValid("MESSAGE")) return;

    String platformResponse;

    try {
      platformResponse = "";

      setState(() {
        _saving = true;
      });

      Map<String, Object> _data = {
        "msg_source_id": 'FEEDBACK',
        "msg_from_id": _emailController.text,
        "msg_from_name": _nameController.text,
        "msg_body": _msgController.text,
        "to_ids": "",
        "cc_ids": "",
        "bcc_ids": "",
        "subject": "",
        "message": "",
        "company_code": Singleton.App_Company_Code,
      };

      Map<String, String> _headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };

      MailController mail = new MailController();

      String str = await mail.SendMail(_data, _headers);

      platformResponse = 'Message sent: $str ';

      setState(() {
        _saving = false;
      });

      Navigator.pop(context);

      showAlertDialog(context, 'Mail', platformResponse);
    } catch (e) {
      platformResponse = 'Mail sending failed : $e';

      setState(() {
        _saving = false;
      });

      showAlertDialog(context, 'Mail', platformResponse);
    }
  }
}
