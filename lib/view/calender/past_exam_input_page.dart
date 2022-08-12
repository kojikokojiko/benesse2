import 'package:benesse_intern/model/past_exam_score.dart';
import 'package:benesse_intern/view/calender/past_exam_controller.dart';
import 'package:benesse_intern/view/calender/ranking_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
class PastExamInputPage extends HookConsumerWidget {




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pastExamListController = ref.read(pastExamListProvider.notifier);
    // int _tempScore=-1;
    final _tempScore=useState(-1);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "今回の過去問の点数を入力してください。",
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _tempScore.value = int.parse(value);
                },
                onSubmitted: (value) {

                  _tempScore.value = int.parse(value);
                },
              ),
              ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(_tempScore.value<0?Colors.grey:Colors.blue)),

                  onPressed: _tempScore.value<0?(){}:() {
                    final user = FirebaseAuth.instance.currentUser;
                    final inputModel = PastExamScore(
                      score: _tempScore.value,
                      imageUrl: user!.photoURL!,
                      name:user!.displayName!,
                      userId:user.uid,

                    );


                    pastExamListController.sendPastExam(inputModel);





                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RankingPage()));
                  }, child: Text("送信"))
            ],
          ),
        ),
      ),
    );
  }
}
