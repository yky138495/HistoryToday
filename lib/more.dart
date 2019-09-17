import 'package:flutter/material.dart';
import './mg_global.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './mg_global.dart';
import './mg_drawer.dart';

class MGMoreListView extends StatelessWidget {
  MGMoreListView();

  List<String> moreList = [
    "鼓励一下",
    "更多应用",
    "邮件我们",
  ];

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
                      if(index == 0){
                        Fluttertoast.showToast(
                            msg: "谢谢鼓励",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Color(MGPrimarySwatchRGB),
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }else if(index == 1){
                        Fluttertoast.showToast(
                            msg: "暂无更多应用",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Color(MGPrimarySwatchRGB),
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }else if(index == 2){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MgDrawer(),
      appBar: AppBar(
        title: Text(MoreTitle),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xfff2f2f2),
      body: new ListView.builder(
        padding: new EdgeInsets.all(5.0),
        itemCount: moreList.length,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
