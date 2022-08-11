

import 'package:flutter/material.dart';

import '../widget/sidebar_screen.dart';

class MotivationScreen extends StatelessWidget {
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: CustomColors.firebaseNavy,
        title: const Text("モチベーション下がった時に見てね"),
      ),
      drawer: const SideBar(),
    );
  }
}
