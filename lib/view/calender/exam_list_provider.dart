import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/exam_data.dart';

final listProvider = FutureProvider.autoDispose<List<ExamData>>((ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final _settingDayString = prefs.getString('settingDay') ?? "";
  final _settingDay = DateTime.parse(_settingDayString);

  final examDataList = [
    ExamData(
        name: "本試験",
        bookImageUrl:
            "https://images-fe.ssl-images-amazon.com/images/I/71o9DSASNWL._AC_UL604_SR604,400_.jpg",
        examDay: _settingDay,
        index: 0),
    ExamData(
        name: "過去問1（レベル0）",
        bookImageUrl:
            "https://images-fe.ssl-images-amazon.com/images/I/71o9DSASNWL._AC_UL604_SR604,400_.jpg",
        examDay: _settingDay.subtract(Duration(days: 20)),
        index: 1),
    ExamData(
        name: "過去問2（レベル0）",
        bookImageUrl:
            "https://images-fe.ssl-images-amazon.com/images/I/71o9DSASNWL._AC_UL604_SR604,400_.jpg",
        examDay: _settingDay.subtract(Duration(days: 15)),
        index: 2),
    ExamData(
        name: "過去問3（レベル0）",
        bookImageUrl:
            "https://images-fe.ssl-images-amazon.com/images/I/71o9DSASNWL._AC_UL604_SR604,400_.jpg",
        examDay: _settingDay.subtract(Duration(days: 11)),
        index: 3),
    ExamData(
        name: "過去問4（レベル0）",
        bookImageUrl:
            "https://images-fe.ssl-images-amazon.com/images/I/71o9DSASNWL._AC_UL604_SR604,400_.jpg",
        examDay: _settingDay.subtract(Duration(days: 7)),
        index: 4),
    ExamData(
        name: "過去問5（レベル0）",
        bookImageUrl:
            "https://images-fe.ssl-images-amazon.com/images/I/71o9DSASNWL._AC_UL604_SR604,400_.jpg",
        examDay: _settingDay.subtract(Duration(days: 4)),
        index: 5),
  ];

  return examDataList;
});
