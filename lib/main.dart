import 'package:app_uber1/pages/client/map/client_map_page.dart';
import 'package:app_uber1/pages/driver/map/driver_map_page.dart';
import 'package:app_uber1/pages/driver/register/driver_register_page.dart';
import 'package:app_uber1/pages/home/home_page.dart';
import 'package:app_uber1/pages/login/login_page.dart';
import 'package:app_uber1/pages/client/register/client_register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_uber1/pages/utils/colors.dart' as utils;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App Uber',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        primaryColor: utils.Colors.uberCloneColor,
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => Home(),
        'login': (BuildContext context) => const LoginPage(),
        'client/register': (BuildContext context) => const ClientRegisterPage(),
        'client/map': (BuildContext context) => const ClientMapPage(),
        'driver/register': (BuildContext context) => const DriverRegisterPage(),
        'driver/map': (BuildContext context) => const DriverMapPage(),
      },
    );
  }
}
