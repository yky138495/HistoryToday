import 'package:flutter/material.dart';
import './mg_global.dart';
import 'package:http/http.dart' as http;
import './model/history.dart';
import 'dart:convert';
import './mg_drawer.dart';


class MgHomeList extends StatefulWidget {
  @override
  _MgHomeListState createState() => _MgHomeListState();
}

class _MgHomeListState extends State<MgHomeList> {
  List<String> content = [];
  @override

  void initState() {
    super.initState();
  }

  Future<List<String>> _requstData() async{
    var url = 'https://api.ooopn.com/history/api.php?type=json';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      History his = History.fromJson(json.decode(response.body));
      content = his.content;
      return content;
    } else {
      throw Exception('Failed to load get');
    }
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    String item = content[index];
    return Container(
      margin: EdgeInsets.all(0.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                  title: Text(item),
                  onTap: () {
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
        title: Text(APPTitle),
        elevation: 0.0,
      ),
      body: FutureBuilder<List<String>>(
        future: _requstData(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: _listItemBuilder,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          setState(() {});
        },
      ),
    );
  }
}
