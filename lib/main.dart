// import 'package:call_screen/routes/app_routes.dart';
import 'package:call_screen/screens/call_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.CallScreen,
      // getPages: AppRoutes.routes,
      home: CallScreen(),
    );
  }
}
