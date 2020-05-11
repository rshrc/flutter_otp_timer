import 'package:flutter/material.dart';
import 'package:flutter_otp_timer/flutter_otp_timer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp Timer"),
        centerTitle: true,
      ),
      body: Center(
        child: OtpTimer(
          duration: 60, // time till which the timer should animate
          radius: 10, // size of the circle
          timeTextSize: 16, // time text inside the circle
        ),
      ),
    );
  }
}
