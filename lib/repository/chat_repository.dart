import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/chat_data_model.dart';

final chatRepositoryProvider = Provider((ref) => ChatRepository());

class ChatRepository {
  final myId = FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("level1");

  void saveChatData(ChatData chatData) {
    final myId = FirebaseAuth.instance.currentUser!.uid;
    collection.add(chatData.toJson());
  }

  Stream<List<ChatData>> getChatSnapshots() {
    final myId = FirebaseAuth.instance.currentUser!.uid;

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
