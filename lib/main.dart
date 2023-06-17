import 'package:flutter/material.dart';
import 'package:trakya_news/constant/color_constant.dart';
import 'package:trakya_news/landing/landing.dart';
import 'dart:typed_data';
import 'package:timezone/data/latest.dart' as tz;

import 'notifications/view/notifications.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trakya News',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: ColorConstant.blackForGrad),
        fontFamily: "Oswald",
        primarySwatch: Colors.blue,
      ),
      home: Landing(),
    );
  }
}
