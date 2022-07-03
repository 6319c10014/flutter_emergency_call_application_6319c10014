import 'package:flutter/material.dart';

import 'package:flutter_emergency_call_application_6319c10014/views/splash_screen_ui.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ContactsUI(),
      home: SplashScreenUI(),
      theme: ThemeData(
        fontFamily: 'Sriracha',
      ),
    ),
  );
}
