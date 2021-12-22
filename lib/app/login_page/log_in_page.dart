import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_service_of_connectivity/app/home_page/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => Get.to(() => const HomePage()),
                    child: const Text('Go to Homepage'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
