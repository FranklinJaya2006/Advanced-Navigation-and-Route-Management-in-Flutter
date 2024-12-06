import 'package:assignmentnavigation/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'dynamic.dart';
import 'home_screen.dart';

void main() {
  // Menangani exception global agar tidak terjadi forced close
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    // Menampilkan snackbar error
    Get.snackbar(
      'Error',
      details.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  };

  runApp(
    ChangeNotifierProvider(
      create: (_) => ScreenState(),  // Menambahkan ScreenState ke dalam Provider
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dynamic Screens App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/dynamic', page: () => DynamicScreen()),
      ],
      defaultTransition: Transition.fadeIn,  // Transisi default
    );
  }
}
