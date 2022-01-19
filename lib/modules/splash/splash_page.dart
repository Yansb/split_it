import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
