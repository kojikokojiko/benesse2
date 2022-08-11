import 'package:benesse_intern/model/chat_data_model.dart';
import 'package:benesse_intern/view/chat_screen/chat_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ChatScreenChild extends ConsumerWidget {
  const ChatScreenChild({Key? key, required this.level}) : super(key: key);

  final String level;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String  message="";
    final chatDataController = ref.read(chatListProvider.notifier);
    final chatDataState = ref.watch(chatListProvider);
    final _currentUser=FirebaseAuth.instance.currentUser!;
    // firebase.firestore.Timestamp.fromDate
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          chatDataState.when(
            data: (chatDatas) {
              return chatDatas.isNotEmpty
                  ? Expanded(
                      child: ListView(
                        reverse: true,
                        children: chatDatas
                            .map(
                              (data) => Card(
                                margin: data.userId==_currentUser.uid!
                                    ? EdgeInsets.only(top: 5.0, left: 90.0, bottom: 5.0, right: 8.0)
                                    : EdgeInsets.only(top: 5.0, left: 8.0, bottom: 5.0, right: 90.0),
                                child: ListTile(
                                  // leading: CircleAvatar(
                                  //   radius: 35,
                                  //   backgroundImage:
                                  //       NetworkImage(data.imageUrl),
                                  // ),
                                  title: Text(data.content),
                                  subtitle: Row(
                                    mainAxisAlignment: data.userId==_currentUser.uid!
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:  NetworkImage(data.imageUrl),
                                        radius: 10.0,
                                      ),
                                      Text(data.name + DateFormat("MM/dd HH:mm").format(data.createdAt!)),
                                    ],
                                  ),
                                  // trailing: const Icon(Icons.more_vert),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : const Text('Data is empty.');
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, _) => Text(error.toString()),
          ),
          SizedBox(
            // height: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      message=value;
                    },
                    onChanged: (value) {
                      message=value;
                    },
                  ),
                ),
                Center(
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.blue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: (){
                        chatDataController.sendChat(ChatData(
                          content: message,
                          imageUrl:_currentUser.photoURL!,
                          name: _currentUser.displayName!,
                          userId: _currentUser.uid!,
                        ));

                      },
                      icon: Icon(Icons.send),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
