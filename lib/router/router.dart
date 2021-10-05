import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:qrapp/pages/home_page.dart';
import 'package:qrapp/pages/qr_code_page.dart';
import 'package:qrapp/pages/qr_scanner_page.dart';

class AppRoutes {
  static final router = FluroRouter();

  static Future<dynamic> navigate(BuildContext context, String routeName,
      {dynamic args}) {
    return router.navigateTo(context, routeName,
        routeSettings: RouteSettings(
          arguments: args,
        ));
  }

//TODO: Make cast arguements as Strings
  static void createRoutes() {
    router.define('home', handler: Handler(handlerFunc: (context, params) {
      var args = context!.settings!.arguments as String;
      return MyHomePage(title: args);
    }));
    router.define('/qrcode', handler: Handler(handlerFunc: (context, params) {
      var args = context!.settings!.arguments as String;
      return QrCodePage(title: args);
    }));
    router.define('/qrscanner',
        handler: Handler(handlerFunc: (context, params) {
      var args = context!.settings!.arguments as String;
      return QrScannerPage(title: args);
    }));
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      return null;
    });
  }
}
