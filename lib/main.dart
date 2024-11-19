import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_12/Page/login_page.dart';
import 'package:pas1_mobile_11pplg2_12/dashboard.dart';

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
      initialRoute: '/',
      getPages: [
        //list all pages
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),

        GetPage(
          name: '/dashboard',
          page: () => Dashboard(),
        )
      ],
    );
  }
}
