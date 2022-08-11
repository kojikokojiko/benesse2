import 'package:flutter/material.dart';

import '../../widget/sidebar_screen.dart';
import 'calender_screen_child.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: CustomColors.firebaseNavy,
        title: const Text("カレンダー"),
      ),
      drawer: const SideBar(),
      body: CalenderScreenChild()
    );
  }
}
