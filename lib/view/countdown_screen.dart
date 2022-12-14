import 'package:benesse_intern/view/calender/select_exam_day_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/sidebar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountDownScreen extends StatefulWidget {
  const CountDownScreen({Key? key}) : super(key: key);

  @override
  State<CountDownScreen> createState() => _CountDownScreenState();
}

class _CountDownScreenState extends State<CountDownScreen> {
  String _settingDay = '2020-09-30 12:30:50';
  int _restDay = 0;
  int _currentScore = 0;

  final isDaySetting = true;

  _getPrefItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 以下の「counter」がキー名。見つからなければ０を返す
    setState(() {
      _currentScore = prefs.getInt('currentScore') ?? 0;
      _settingDay = prefs.getString('settingDay') ?? "";
    });

    DateTime now = DateTime.now();
    final Duration difference = DateTime.parse(_settingDay).difference(now);
    _restDay = difference.inDays;
  }

  _setPrefrestCurrentScore(nextScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 以下の「counter」がキー名。
    prefs.setInt('currentScore', nextScore);
    setState(() {
      _currentScore = nextScore;
    });
  }

  _checkDayIsNull() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('settingDay') == null) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("あなたが本当に合格したいなら、今すぐTOEICに申し込んでください"),
            // content: Text("メッセージメッセージメッセージメッセージメッセージメッセージ"),
            actions: <Widget>[
              // ボタン領域
              // FlatButton(
              //   child: Text("Cancel"),
              //   onPressed: () => Navigator.pop(context),
              // ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectExamDayScreen(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // 初期化時にShared Preferencesに保存している値を読み込む
    _getPrefItem();
    _checkDayIsNull();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: CustomColors.firebaseNavy,
        title: const Text("カレンダー"),
      ),
      drawer: const SideBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              levelWidget(_currentScore),
              Text("現在のTOEICの点数は", style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),
              Text("$_currentScore点", style: TextStyle(fontSize: 40)),
              SizedBox(height: 20),
              Text("次の試験まであと", style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),
              Text("$_restDay日", style: TextStyle(fontSize: 40)),
              SizedBox(height: 50),
              Visibility(
                visible: isDaySetting,
                child: SizedBox(
                  height: 50,
                  // width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectExamDayScreen()));
                      },
                      child: const Text("試験日を登録する。")),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 50,
                // width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          int _tempScore = 0;
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 150,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (value) {
                                      _tempScore = int.parse(value);
                                    },
                                    onSubmitted: (value) {
                                      _tempScore = int.parse(value);
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("キャンセル")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _setPrefrestCurrentScore(
                                                _tempScore);
                                          },
                                          child: Text("OK"))
                                    ],
                                  ),
                                ],
                              ),

                              // color: Colors.pink,
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("点数を変更する。")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget levelWidget(score) {
    String text;
    if (score < 400) {
      return Text("Level0", style: TextStyle(fontSize: 50));
    } else if (score >= 400 && score < 600) {
      return Text("Level1", style: TextStyle(fontSize: 50));
    } else if (score >= 600 && score < 800) {
      return Text("Level2", style: TextStyle(fontSize: 50));
    } else {
      return Text("Level3", style: TextStyle(fontSize: 50));
    }

  }
}
