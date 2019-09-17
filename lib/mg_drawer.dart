import 'package:flutter/material.dart';
import './util/NavigatorUtil.dart';
import './mg_global.dart';
import './more.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class MgDrawer extends StatefulWidget {
  @override
  _MgDrawerState createState() => _MgDrawerState();
}

class _MgDrawerState extends State<MgDrawer> {
  List questList = [];
  int pageIndex = 1;

  List<String> moreList = [
    "鼓励一下",
    "更多应用",
    "邮件我们",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.fromLTRB(0.0, 50, 0, 0),
        color: Color(MGComminBgRGB),
        child: new ListView.builder(
          padding: new EdgeInsets.all(5.0),
          itemCount: moreList.length,
          itemBuilder: _listItemBuilder,
        ),
      ),
    );
  }


  _launchURL() async {
    const url = 'mailto:yky138495@163.com?subject=feedback&body=hello';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }


  Widget _listItemBuilder(BuildContext context, int index) {
    String item = moreList[index];
    return Container(
      margin: EdgeInsets.all(0.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                  title: Text(item),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    if (index == 0) {
                      Fluttertoast.showToast(
                          msg: "谢谢鼓励",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Color(MGPrimarySwatchRGB),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    } else if (index == 1) {
                      Fluttertoast.showToast(
                          msg: "暂无更多应用",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Color(MGPrimarySwatchRGB),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    } else if (index == 2) {
                      _launchURL();
                    }
                  }),
              Divider(
                height: 20.0,
                indent: 1.0,
                color: Color(MGLineRGB),
              )
            ],
          ),
        ],
      ),
    );
  }

}