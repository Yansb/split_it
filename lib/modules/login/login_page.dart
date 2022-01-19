import 'package:flutter/material.dart';
import 'package:split_it/modules/login/widgets/social_button.dart';
import 'package:split_it/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                SizedBox(
                  width: 236,
                  child: Text("Divida suas contas com seus amigos",
                      style: AppTheme.textStyles.title),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/Emoji.png",
                    height: 36,
                    width: 36,
                  ),
                  title: Text(
                    "Faça seu login com uma das contas abaixo",
                    style: AppTheme.textStyles.button,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: SocialButtonWidget(
                    imagePath: "assets/images/Google.png",
                    label: "Entrar com Google"),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: SocialButtonWidget(
                    imagePath: "assets/images/Apple.png",
                    label: "Entrar com Apple"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
