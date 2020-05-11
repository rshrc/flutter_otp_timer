# flutter_otp_timer

Get easy otp timer in your app

# Usage

Import `package:flutter_otp_timer/flutter_otp_timer`

Example:

```dart
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


```

You will find links to the API docs on the [pub page](https://pub.dev/packages/otp_count_down).

## Getting Started

For help getting started with Flutter, view our online
[documentation](http://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).