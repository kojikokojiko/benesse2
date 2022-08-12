import 'package:benesse_intern/view/calender/past_exam_controller.dart';
import 'package:benesse_intern/view/countdown_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RankingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pastExamListState = ref.watch(pastExamListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("ランキング"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            pastExamListState.when(
              data: (pastExamList) {
                return pastExamList.isNotEmpty
                    ? Expanded(
                    child: ListView.builder(
                        itemCount: pastExamList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data = pastExamList[index];
                          return Card(
                            child: ListTile(
                              leading: Visibility(
                                visible: (index == 0) || (index == 1) ||
                                    (index == 2),
                                child: Icon(
                                    Icons.workspace_premium, //設定したいアイコンのID
                                    color: (index == 0)
                                        ? Colors.yellow
                                        : (index == 1) ? Colors.grey : Colors
                                        .brown,
                                    size: 30 //サイズ
                                ),

                              ),


                              title: Row(
                                children: [
                                  Text(
                                    "${index + 1}位",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(data.name),
                                  SizedBox(width: 10,),
                                  Text("${data.score}点", style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),

                                ],
                              ),
                              trailing: CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage(data.imageUrl),
                              ),
                            ),
                          );
                        }))
                    : const Text('Data is empty.');
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, _) => Text(error.toString()),
            ),
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CountDownScreen()));
                }, child: Text("終了"))),
            SizedBox(height: 100, )
          ],
        ),

      ),
    );
  }
}
