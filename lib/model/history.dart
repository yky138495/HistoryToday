import 'dart:convert';

class History {
  String code;
  String day;
  List<String> content;

  History({
    this.code,
    this.day,
    this.content,
  });

  factory History.fromJson(Map<String, dynamic> jsonStr) {
    List<String> content = [];
    if (jsonStr['content'] == null) {
      content = [];
    }else{
      List contentL = jsonStr['content'];
      contentL.forEach((value) {
        if (value!=null){
          content.add(value.toString());
        }
      });
    }

    return History(
        code: jsonStr['code'],
        content: content,
        day: jsonStr['day']);
  }
}