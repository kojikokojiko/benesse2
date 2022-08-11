import 'dart:collection';
import 'package:benesse_intern/model/exam_data.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:table_calendar/table_calendar.dart';

// import 'modal_slider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';


class CalenderScreenChild extends HookConsumerWidget {
  CalenderScreenChild({Key? key}) : super(key: key);

  Color _textColor(DateTime day) {
    const defaultTextColor = Colors.black87;

    if (day.weekday == DateTime.sunday) {
      return Colors.red;
    }
    if (day.weekday == DateTime.saturday) {
      return Colors.blue[600]!;
    }
    return defaultTextColor;
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusingDay = useState(DateTime.now());
    // final todoDataBaseController = ref.read(todoDatabaseProvider.notifier);
    // final todos = ref.watch(todoDatabaseProvider).todoItems;

    Map<DateTime, List> eventsList = {};


    // DateTimeの配列作るところ///////////////
    // for (var item in todos) {
    //   DateTime date = DateTime(
    //       item.startDay!.year, item.startDay!.month, item.startDay!.day);
    //   if (eventsList.containsKey(date)) {
    //     eventsList[date]!.add(item);
    //   } else {
    //     eventsList[date] = [item];
    //   }
    // }
    final events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )
      ..addAll(eventsList);

    List getEventForDay(DateTime day) {
      return events[day] ?? [];
    }

    return Column(
      children: [
        TableCalendar(
          focusedDay: focusingDay.value,
          firstDay: DateTime(now.year - 2,),
          // DateTime.utc(2020, 1, 1),
          lastDay: DateTime(now.year + 2,),
          eventLoader: getEventForDay,
          daysOfWeekStyle: const DaysOfWeekStyle(
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
          ),
          daysOfWeekHeight: 25,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            formatButtonShowsNext: false,
            leftChevronVisible: false,
            rightChevronVisible: false,
          ),
          calendarFormat: CalendarFormat.month,
          calendarStyle: const CalendarStyle(
              disabledTextStyle: TextStyle(color: Color(0xFFDCDCDC))),
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: (selectedDay, focusedDay) {
            focusingDay.value = focusedDay;

            // showModalBottomSheet(
            //   isScrollControlled: true,
            //   backgroundColor: Colors.transparent,
            //   context: context,
            //   builder: (context) {
            //     return ModalSlider(
            //       day: focusingDay.value,
            //     );
            //   },
            // );
          },
          onPageChanged: (focusedDay) {
            focusingDay.value = focusedDay;
          },
          calendarBuilders: CalendarBuilders(
            headerTitleBuilder: (BuildContext context, DateTime day) {
              return Row(
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      side: const BorderSide(color: Colors.black12),
                    ),
                    onPressed: () {
                      focusingDay.value = DateTime.now();
                    },
                    child: const Text(
                      "今日",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 60),
                  Text(
                    "${day.year}年${day.month}月",
                    style: const TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () async {
                      var selctedDate = await showMonthPicker(
                          context: context,
                          initialDate: day,
                          firstDate: DateTime(DateTime.now().year - 2),
                          lastDate: DateTime(DateTime.now().year + 2));
                      if (selctedDate == null) return;
                      focusingDay.value = selctedDate;
                    },
                    child: const Icon(Icons.arrow_drop_down_sharp),
                  )
                  // Text()
                ],
              );
            },
            defaultBuilder:
                (BuildContext context, DateTime day, DateTime focusedDay) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  day.day.toString(),
                  style: TextStyle(
                    color: _textColor(day),
                  ),
                ),
              );
            },
            dowBuilder: (context, day) {
              final text = DateFormat.E("ja").format(day);

              return Center(
                child: Text(
                  text,
                  style: TextStyle(color: _textColor(day)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
