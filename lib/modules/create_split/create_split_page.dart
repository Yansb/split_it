import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/one/step_one_page.dart';
import 'package:split_it/modules/create_split/steps/three/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_page.dart';
import 'package:split_it/modules/create_split/widgets/bottom_stepper_bar.dart';
import 'package:split_it/modules/create_split/widgets/create_split_app_bar.dart';
import 'package:split_it/modules/create_split_success/create_split_success_page.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/shared/utils/numberFormatter.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController(repository: FirebaseRepository());
  final formatter = NumberFormater();

  late List<Widget> pages;

  late ReactionDisposer _disposer;

  @override
  void initState() {
    pages = [
      StepOnePage(
        controller: controller,
      ),
      StepTwoPage(
        controller: controller,
      ),
      StepThreePage(
        controller: controller,
      ),
    ];
    _disposer = autorun((_) {
      if (controller.status == CreateSplitStatus.success) {
        BotToast.closeAllLoading();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CreateSplitSuccessPage(
                      controller: controller,
                      formater: formatter,
                    )));
      } else if (controller.status == CreateSplitStatus.error) {
        BotToast.closeAllLoading();
        BotToast.showText(
            text: "Não foi possível cadastrar esse evento",
            contentColor: Colors.yellow.shade700);
      } else if (controller.status == CreateSplitStatus.loading) {
        BotToast.showLoading();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.colors.backgroundPrimary,
        appBar: CreateSplitAppBarWidget(
          controller: controller,
          pages: pages.length,
          context: context,
        ),
        body: Observer(
          builder: (context) {
            final index = controller.currentPage;
            return pages[index];
          },
        ),
        bottomNavigationBar: BottomStepperBarWidget(
          controller: controller,
          onPrevious: controller.previousPage,
        ));
  }
}
