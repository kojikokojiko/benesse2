import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/chat_data_model.dart';
import '../../model/past_exam_score.dart';
import '../../repository/chat_repository.dart';
import '../../repository/past_exam_repository.dart';



final _currentExamDataProvider =
StreamProvider<List<PastExamScore>>((ref) =>
    ref.read(pastExamRepositoryProvider).getPastExamSnapshots());

final pastExamListProvider = StateNotifierProvider<PastExamController,
    AsyncValue<List<PastExamScore>>>((ref) {
  final repo = ref.read(pastExamRepositoryProvider);
  final currentList = ref.watch(_currentExamDataProvider);
  return PastExamController(repo, currentList);
});

class PastExamController extends StateNotifier<AsyncValue<List<PastExamScore>>> {
  PastExamController(this._repo, currentList) : super(currentList);
  final PastExamRepository _repo;

  void sendPastExam(PastExamScore pastExamScore) {
    _repo.savePastExamData(pastExamScore);
  }
  Stream<List<PastExamScore>> getPastExamSnapshots() {
    return _repo.getPastExamSnapshots();
  }
}