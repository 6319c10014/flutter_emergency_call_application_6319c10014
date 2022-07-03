import 'package:flutter/material.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/models/phone_emer_list.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    Future.delayed(
      Duration(
        seconds: 1,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color.fromARGB(239, 252, 238, 109),
                Color.fromARGB(240, 245, 96, 86),
                Color.fromARGB(240, 103, 123, 235),
                Color.fromARGB(230, 16, 202, 184),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 150.0,
                  backgroundImage: AssetImage(
                    'assets/images/icon.png',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'ชิบหาย',
                  style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CircularProgressIndicator(
                  color: Colors.red,
                  strokeWidth: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
