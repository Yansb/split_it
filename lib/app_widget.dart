import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/create_split_page.dart';
import 'package:split_it/modules/details/details_page.dart';
import 'package:split_it/modules/login/login_page.dart';
import 'package:split_it/modules/splash/splash_page.dart';

import 'modules/error/error_page.dart';
import 'modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      title: "Split.it",
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/error": (context) => const ErrorPage(),
        "/home": (context) => const HomePage(),
        "/create_split": (context) => const CreateSplitPage(),
      },
    );
  }
}
