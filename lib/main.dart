import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrapp/core/service_locator.dart';
import 'package:qrapp/pages/home_page.dart';
import 'package:qrapp/router/router.dart';

void main() {
  //Set Status Bar Color
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.blueGrey[700]));
  AppRoutes.createRoutes(); //create fluro routes
  ServiceLocator.register(); //Registor the locator for dependency injection
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.white,
        buttonColor: Colors.blueGrey[500],
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey[700],
            systemOverlayStyle: SystemUiOverlayStyle.light,
            brightness: Brightness.dark),
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}
