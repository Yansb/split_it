import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

import '../../firebase_options.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeFirebase() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushNamed(context, "/login");
    } catch (e) {
      Navigator.pushNamed(context, "/error");
    }
  }

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.gradients.background),
        child: SafeArea(
          top: true,
          bottom: true,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    Opacity(
                      opacity: 0.2,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/Rectangle-left.png",
                            width: 198,
                            height: 98,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/Rectangle-left.png",
                            width: 114,
                            height: 54,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/Logo.png",
                  width: 128,
                  height: 112,
                ),
                Column(
                  children: [
                    Opacity(
                      opacity: 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "assets/images/Rectangle-right.png",
                            width: 114,
                            height: 54,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "assets/images/Rectangle-right.png",
                            width: 198,
                            height: 98,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox()
              ]),
        ),
      ),
    );
  }
}
