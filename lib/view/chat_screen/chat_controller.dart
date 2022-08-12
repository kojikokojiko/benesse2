import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/chat_data_model.dart';
import '../../repository/chat_repository.dart';



final _currentChatDataProvider =
StreamProvider.family<List<ChatData>,int>((ref,level) =>
    ref.read(chatRepositoryProvider(level)).getChatSnapshots());

final chatListProvider = StateNotifierProvider.family<ChatController,
    AsyncValue<List<ChatData>>,int>((ref,level) {
  final repo = ref.read(chatRepositoryProvider(level));
  final currentList = ref.watch(_currentChatDataProvider(level));
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