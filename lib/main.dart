import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_service_of_connectivity/app/login_page/log_in_page.dart';
import 'package:getx_service_of_connectivity/app/services/connectivity_service_init.dart';

Future main() async {
  await connctivityServiceInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Connection Checking using getx Service',
      home: LoginPage(),
    );
  }
}
