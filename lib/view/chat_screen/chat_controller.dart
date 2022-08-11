import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/chat_data_model.dart';
import '../../repository/chat_repository.dart';



final _currentChatDataProvider =
StreamProvider<List<ChatData>>((ref) =>
    ref.read(chatRepositoryProvider).getChatSnapshots());

final chatListProvider = StateNotifierProvider<ChatController,
    AsyncValue<List<ChatData>>>((ref) {
  final repo = ref.read(chatRepositoryProvider);
  final currentList = ref.watch(_currentChatDataProvider);
  return ChatController(repo, currentList);
});

class ChatController extends StateNotifier<AsyncValue<List<ChatData>>> {
  ChatController(this._repo, currentList) : super(currentList);
  final ChatRepository _repo;



  void sendChat(ChatData chatData) {
      _repo.saveChatData(chatData);
  }

  Stream<List<ChatData>> getChatsnapshots() {
    return _repo.getChatSnapshots();
  }

}