import 'package:benesse_intern/model/past_exam_score.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final pastExamRepositoryProvider = Provider((ref) => PastExamRepository());

class PastExamRepository {
  final CollectionReference collection =
  FirebaseFirestore.instance.collection("past_exam_score");

  void savePastExamData(PastExamScore pastExamScore) {
    collection.add(pastExamScore.toJson());
  }

  Stream<List<PastExamScore>> getPastExamSnapshots() {
    return collection
        .limit(100)
        .orderBy('score',descending: true)
        .snapshots()
        .map((e) => e.docs
        .map((data) =>
        PastExamScore.fromJson(data.data() as Map<String, dynamic>))
        .toList());
  }
}
