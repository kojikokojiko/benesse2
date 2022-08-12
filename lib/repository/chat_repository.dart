import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/chat_data_model.dart';

final chatRepositoryProvider = Provider.family((ref,level) => ChatRepository(level:level));

class ChatRepository {
  ChatRepository({this.level});
  final level;
  final myId = FirebaseAuth.instance.currentUser!.uid;


  String returnCollectionName(level){
    switch(level){
      case 0:
        return "level0";
      case 1:
        return "level1";
      case 2:
        return "level2";
      case 3:
        return "level3";
      default:
        return"level0";
    }

  }
  void saveChatData(ChatData chatData) {

    final CollectionReference collection =
    FirebaseFirestore.instance.collection(returnCollectionName(level));

    collection.add(chatData.toJson());
  }

  Stream<List<ChatData>> getChatSnapshots() {

    final CollectionReference collection =
    FirebaseFirestore.instance.collection(returnCollectionName(level));

    return collection
        .limit(100)
        .orderBy('createdAt',descending: true)
        .snapshots()
        .map((e) => e.docs
            .map((data) =>
                ChatData.fromJson(data.data() as Map<String, dynamic>))
            .toList());
  }
}
