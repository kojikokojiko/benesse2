import 'package:benesse_intern/view/calender/calender_screen.dart';
import 'package:benesse_intern/view/chat_screen/chat_screen.dart';
import 'package:benesse_intern/view/motivation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/countdown_screen.dart';
import '../view/user_info_screen.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'My App',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: Text('カウントタイマー'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CountDownScreen()));
            },
          ),
          ListTile(
            title: Text('チャット'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()));
            },
          ),
          ListTile(
            title: Text('カレンダー'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CalenderScreen()));
            },
          ),
          ListTile(
            title: const Text('ホーム'),
            onTap: () {
              final user =FirebaseAuth.instance.currentUser;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserInfoScreen(user: user!,)));
            },
          ),

        ],
      ),
    );
  }
}
