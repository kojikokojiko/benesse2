import 'package:benesse_intern/view/countdown_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/webveiw.dart';

class SelectExamDayScreen extends StatelessWidget {
  SelectExamDayScreen({Key? key}) : super(key: key);

  _setPrefrestCurrentScore(String settingDay) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 以下の「counter」がキー名。
    prefs.setString('settingDay', settingDay);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("試験希望日を選択")),
      body: ListView(
          children: examDataList
              .map(
                (examData) => Card(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: examData.isAfterNoon?
                            Text("${DateFormat("yyyy年MM月dd日午前").format(examData.date)}"):
                            Text("${DateFormat("yyyy年MM月dd日午後").format(examData.date)}"),
                              content: Text("本当にこの日でよろしいですか？"),
                            actions: <Widget>[
                              // ボタン領域
                              FlatButton(
                                child: Text("Cancel"),
                                onPressed: () => Navigator.pop(context),
                              ),
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () async {

                                  _setPrefrestCurrentScore(examData.date.toString());
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute<WebViewScreen>(
                                      builder: (BuildContext _context) =>
                                          WebViewScreen(
                                        url:
                                            "https://ms.toeic.or.jp/Usr/Pages/Member/ServiceTop.aspx",
                                      ),
                                    ),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CountDownScreen()));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: ListTile(
                      title: examData.isAfterNoon?Text(DateFormat("yyyy年MM月dd日午前").format(examData.date),):Text(DateFormat("yyyy年MM月dd日午後").format(examData.date),)
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }

  final examDataList = [
    TempExamData(date:  DateTime(2022, 8, 30),isAfterNoon: false),
    TempExamData(date:  DateTime(2022, 8, 30),isAfterNoon: true),
    TempExamData(date:  DateTime(2022, 9, 30),isAfterNoon: false),
    TempExamData(date:  DateTime(2022, 9, 30),isAfterNoon: true),
    TempExamData(date:  DateTime(2022, 10, 30),isAfterNoon: false),
    TempExamData(date:  DateTime(2022,10, 30),isAfterNoon: true),
    TempExamData(date:  DateTime(2022, 11, 30),isAfterNoon: false),
    TempExamData(date:  DateTime(2022, 11, 30),isAfterNoon: true),
  ];
}

class TempExamData{
  TempExamData({required this.date,required this.isAfterNoon});
  final date;
  final isAfterNoon;
}
