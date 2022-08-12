import 'dart:collection';
import 'package:benesse_intern/model/exam_data.dart';
import 'package:benesse_intern/view/calender/dummy_zoom_screen.dart';
import 'package:benesse_intern/view/calender/past_exam_input_page.dart';
import 'package:benesse_intern/widget/webveiw.dart';
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
import 'package:url_launcher/url_launcher.dart';

import 'exam_list_provider.dart';

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
    final selecingDay = useState(DateTime.now());
    // final todoDataBaseController = ref.read(todoDatabaseProvider.notifier);
    final todos = ref.watch(listProvider).value!;

    Map<DateTime, List> eventsList = {};

    // DateTimeの配列作るところ///////////////
    for (var item in todos) {
      DateTime date =
          DateTime(item.examDay.year, item.examDay.month, item.examDay.day);
      if (eventsList.containsKey(date)) {
        eventsList[date]!.add(item);
      } else {
        eventsList[date] = [item];
      }
    }
    final events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(eventsList);

    List getEventForDay(DateTime day) {
      return events[day] ?? [];
    }

    return Column(
      children: [
        TableCalendar(
          focusedDay: focusingDay.value,
          firstDay: DateTime(
            now.year - 2,
          ),
          // DateTime.utc(2020, 1, 1),
          lastDay: DateTime(
            now.year + 2,
          ),
          eventLoader: getEventForDay,
          daysOfWeekStyle: const DaysOfWeekStyle(
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
          ),
          selectedDayPredicate: (day) {
            //以下追記部分
            return isSameDay(selecingDay.value, day);
          },
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
            selecingDay.value = selectedDay;
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
            markerBuilder: (context, date, events) {
              if (events.isNotEmpty) {
                return _buildEventsMarker(date, events);
              }
            },
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
        ListView(
          shrinkWrap: true,
          children: getEventForDay(selecingDay.value)
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    showDialog<void>(
                        context: context,
                        builder: (_) {
                          return AlertDialogSample();
                        });
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image(image: NetworkImage(e.bookImageUrl)),
                      title: Text(e.name.toString()),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return Positioned(
      // right: ,
      bottom: events[0].index == 0 ? 8 : 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: events[0].index == 0 ? Colors.red : Colors.blue),
        width: events[0].index == 0 ? 36 : 16.0,
        height: events[0].index == 0 ? 36 : 16.0,
        child: Center(
          child: Text(
            events[0].index == 0 ? '本番' : '${events[0].index.toString()}',
            style: TextStyle().copyWith(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}

class AlertDialogSample extends StatelessWidget {
  const AlertDialogSample({Key? key}) : super(key: key);
  void launchMeeet()async{
    // final url="https://meet.google.com/yxr-fefx-jtf";
    // final url="https://meet.google.com/yxr-fefx-jtf?hs=151";
    final url="https://meet.google.com/";

    // await launchUrl(Uri.parse(url));

    await launchUrl(Uri.parse(url));
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('過去問Meetに移動します', style: TextStyle(fontSize: 20)),
      content: const Text('準備はできていますか？'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DummyZoomScreen()));
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
