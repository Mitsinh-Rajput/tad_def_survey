import 'dart:async';
import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../services/input_decoration.dart';
import '../../base/custom_image.dart';
import 'form_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer.run(() async {
      await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {});
      });
      Get.find<AuthController>().controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      );
    });
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        opacity = opacity + 0.3;
        if (opacity >= 1) {
          opacity = 0;
        }
      });
    });
  }

  Map data = {};
  bool _showImage = true;
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
          // resizeToAvoidBottomInset: (authController.pageController.page == 1) ? true : false,
          body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: authController.pageController,
              itemCount: authController.images.length,
              onPageChanged: (va) {
                log("${authController.pageController.page}");
              },
              itemBuilder: (BuildContext context, int index) {
                if (index == 1) {
                  return const FormScreen();
                }
                if (index == 6) {
                  return Stack(
                    children: [
                      CustomImage(
                        path: authController.images[index],
                        width: size.width,
                        height: size.height,
                      ),
                      // CustomImage(
                      //   path: Assets.imagesNew13,
                      //   width: size.width,
                      //   height: size.height,
                      // ),
                      Opacity(
                        opacity: opacity,
                        child: CustomImage(
                          path: Assets.imagesNew13,
                          width: size.width,
                          height: size.height,
                        ),
                      ),
                      AnimatedSwitcher(
                          duration: Duration(minutes: 300),
                          child: FadeTransition(
                            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: AlwaysStoppedAnimation(1),
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: CustomImage(
                              path: Assets.imagesNew13,
                              width: size.width,
                              height: size.height,
                            ),
                          )),
                      Positioned(
                          top: 50,
                          left: size.width * 0.33,
                          child: GestureDetector(
                            onTap: () async {
                              await Get.find<AuthController>()
                                  .pageController
                                  .animateToPage((Get.find<AuthController>().pageController.page! + 1).round(), duration: const Duration(milliseconds: 50), curve: Curves.ease);
                            },
                            child: Container(
                              height: 220,
                              width: 300,
                              color: Colors.transparent,
                            ),
                          )),
                      Positioned(
                          bottom: 50,
                          left: 180,
                          child: GestureDetector(
                            onTap: () async {
                              await Get.find<AuthController>()
                                  .pageController
                                  .animateToPage((Get.find<AuthController>().pageController.page! + 1).round(), duration: const Duration(milliseconds: 50), curve: Curves.ease);
                            },
                            child: Container(
                              height: 200,
                              width: 200,
                              color: Colors.transparent,
                            ),
                          )),
                      Positioned(
                          top: size.height * 0.45,
                          left: size.width * 0.5,
                          child: GestureDetector(
                            onTap: () async {
                              await Get.find<AuthController>()
                                  .pageController
                                  .animateToPage((Get.find<AuthController>().pageController.page! + 1).round(), duration: const Duration(milliseconds: 50), curve: Curves.ease);
                            },
                            child: Container(
                              height: 200,
                              width: 250,
                              color: Colors.transparent,
                            ),
                          )),
                      Positioned(
                          top: size.height * 0.27,
                          right: 50,
                          child: GestureDetector(
                            onTap: () async {
                              await Get.find<AuthController>()
                                  .pageController
                                  .animateToPage((Get.find<AuthController>().pageController.page! + 1).round(), duration: const Duration(milliseconds: 50), curve: Curves.ease);
                            },
                            child: Container(
                              height: 200,
                              width: 200,
                              color: Colors.transparent,
                            ),
                          )),
                    ],
                  );
                }
                if (index == 7) {
                  return Stack(
                    children: [
                      CustomImage(
                        path: authController.images[index],
                        width: size.width,
                        height: size.height,
                      ),
                      // CustomImage(
                      //   path: Assets.imagesNew13,
                      //   width: size.width,
                      //   height: size.height,
                      // ),

                      Opacity(
                        opacity: opacity,
                        child: CustomImage(
                          path: Assets.imagesNew14,
                          width: size.width,
                          height: size.height,
                        ),
                      ),
                      AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: FadeTransition(
                            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: AlwaysStoppedAnimation(1),
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: CustomImage(
                              path: Assets.imagesNew14,
                              width: size.width,
                              height: size.height,
                            ),
                          )),
                      Positioned(
                          top: size.height * 0.8,
                          left: size.width * 0.5,
                          child: GestureDetector(
                            onTap: () async {
                              await Get.find<AuthController>()
                                  .pageController
                                  .animateToPage((Get.find<AuthController>().pageController.page! + 1).round(), duration: const Duration(milliseconds: 50), curve: Curves.ease);
                            },
                            child: Container(
                              height: 200,
                              width: 600,
                              color: Colors.transparent,
                            ),
                          )),
                      Positioned(
                          bottom: 20,
                          right: size.width * 0.20,
                          child: GestureDetector(
                            onTap: () async {
                              await Get.find<AuthController>()
                                  .pageController
                                  .animateToPage((Get.find<AuthController>().pageController.page! + 1).round(), duration: const Duration(milliseconds: 50), curve: Curves.ease);
                            },
                            child: Container(
                              height: 200,
                              width: 350,
                              color: Colors.transparent,
                            ),
                          )),
                    ],
                  );
                }

                return CustomImage(
                  path: authController.images[index],
                  width: size.width,
                  height: size.height,
                );
              },
            ),
            if (authController.pageController.hasClients)
              if (authController.pageController.page == 0) const HomePage(),
            if (authController.pageController.hasClients)
              if (authController.pageController.page == 2) const QuestionOne(),
            if (authController.pageController.hasClients)
              if (authController.pageController.page == 3) const QuestionTwo(),
            if (authController.pageController.hasClients)
              if (authController.pageController.page == 4) const QuestionThree(),
            // if (authController.pageController.hasClients)
            //   if (authController.pageController.page == 5) const QuestionFour(),
            if (authController.pageController.hasClients)
              if (authController.pageController.page == authController.images.length - 1) const Comments(),
            /*if (authController.pageController.hasClients)
                    if (authController.pageController.page?.toInt() == 1)
                      Positioned(
                        top: size.height * .14,
                        left: size.width * .333,
                        child: SizedBox(
                          height: size.height * .0654,
                          width: size.width * .507,
                          child: TextFormField(
                            controller: authController.oneController,
                            decoration: CustomDecoration.inputDecoration(),
                          ),
                        ),
                      ),
                  if (authController.pageController.hasClients)
                    if (authController.pageController.page?.toInt() == 1)
                      Positioned(
                        top: size.height * .32,
                        left: size.width * .333,
                        child: SizedBox(
                          height: size.height * .0654,
                          width: size.width * .507,
                          child: TextFormField(
                            controller: authController.twoController,
                            decoration: CustomDecoration.inputDecoration(),
                          ),
                        ),
                      ),
                  if (authController.pageController.hasClients)
                    if (authController.pageController.page?.round() == 1)
                      Positioned(
                        top: size.height * .498,
                        left: size.width * .333,
                        child: SizedBox(
                          height: size.height * .0654,
                          width: size.width * .507,
                          child: TextFormField(
                            controller: authController.threeController,
                            decoration: CustomDecoration.inputDecoration(),
                          ),
                        ),
                      ),*/
            // Sync Button
            if (authController.pageController.hasClients)
              if (authController.pageController.page?.round() == 0)
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () async {
                      // await authController.submitForm();
                      authController.controller.forward(from: 0).then((value) async {
                        await authController.syncData();
                      });
                    },
                    child: AnimatedBuilder(
                        animation: authController.controller,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: authController.controller.value * 2 * 3.14159265359,
                            child: const CustomImage(
                              path: Assets.imagesSyncBlue,
                              height: 75,
                              width: 75,
                            ),
                          );
                        }),
                  ),
                ),

            // Back Button
            if (authController.pageController.hasClients)
              if (authController.pageController.page!.round() < authController.images.length && authController.pageController.page!.round() > 0)
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () async {
                      if (authController.pageController.page! > 0) {
                        await authController.pageController
                            .animateToPage((authController.pageController.page! - 1).round(), duration: const Duration(milliseconds: 50), curve: Curves.ease);
                        setState(() {});
                      }
                    },
                    child: const CustomImage(
                      path: Assets.imagesBackwardBlue,
                      height: 75,
                      width: 75,
                    ),
                  ),
                ),
            // Forward Button
            if (authController.pageController.hasClients)
              if ((authController.pageController.page?.round() != 6) && (authController.pageController.page?.round() != 7))
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () async {
                      authController.forwardButton();
                    },
                    child: const CustomImage(
                      path: Assets.imagesForwardBlue,
                      height: 75,
                      width: 75,
                    ),
                  ),
                ),
            // Home Button
            if (authController.pageController.hasClients)
              if (authController.pageController.page!.round() > 0)
                Positioned(
                  top: 40,
                  right: 30,
                  child: GestureDetector(
                    onTap: () async {
                      authController.resetForm();
                    },
                    child: CustomImage(
                      path: (authController.pageController.page!.round() < authController.images.length - 1) ? Assets.imagesHOME : Assets.imagesHomeBlue,
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
          ],
        ),
      ));
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.only(top: size.height * 0.06),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            Assets.imagesBG,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomImage(
                path: Assets.imagesLOGO,
                height: size.width * 0.09,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.3),
              child: Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                      text: "Leuprolide Acetate Depot Inj.",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 22, color: const Color(0xFF676767), fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                          text: "\nDelays Disease Progression & Improves Survival",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 22, color: const Color(0xFF18467e), fontWeight: FontWeight.w900),
                        )
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.09,
            ),
            CustomImage(
              path: Assets.imagesD10,
              height: size.height * 0.36,
            ),
            SizedBox(
              height: size.height * 0.22,
            ),
            CustomImage(
              path: Assets.imagesD11,
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionOne extends StatefulWidget {
  const QuestionOne({Key? key}) : super(key: key);

  @override
  State<QuestionOne> createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
  // final assetsAudioPlayer = AssetsAudioPlayer();
  // bool _isInit = true;

  // AssetsAudioPlayer.newPlayer().open(
  // Audio("assets/audios/correct_selection.mp3"),
  // showNotification: false,
  // );

  // AssetsAudioPlayer.newPlayer().open(
  // Audio("assets/audios/invalid_selection.mp3"),
  // showNotification: false,
  // );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(builder: (authController) {
      // bool isSelected() {
      //   return authController.questionOneAnswer['selected'] != null;
      // }
      //
      // if (!_isInit) {
      //   if (authController.questionOneAnswer['selected'] == authController.questionOneAnswer['answer']) {
      //     AssetsAudioPlayer.newPlayer().open(
      //       Audio("assets/audios/correct_selection.mp3"),
      //       showNotification: false,
      //     );
      //   } else {
      //     AssetsAudioPlayer.newPlayer().open(
      //       Audio("assets/audios/invalid_selection.mp3"),
      //       showNotification: false,
      //     );
      //   }
      // } else {
      //   _isInit = false;
      // }

      // Color getColorIfSelected(int index) {
      //   var data = authController.questionOneAnswer;
      //   if (isSelected()) {
      //     if (index == data['answer']) {
      //       return Colors.green.withOpacity(.5);
      //     } else if (data['selected'] == index) {
      //       return Colors.red.withOpacity(.5);
      //     }
      //     return Colors.transparent;
      //   } else {
      //     return Colors.transparent;
      //   }
      // }

      // return Positioned(
      //   top: size.height * .278,
      //   // left: size.width * .4,
      //   width: size.width,
      //   child: Material(
      //     color: Colors.transparent,
      //     elevation: 0,
      //     child: Column(
      //       children: [
      //         OptionButton(
      //           height: size.height * .075,
      //           width: size.width * .2,
      //           color: getColorIfSelected(1),
      //           onTap: () {
      //             authController.questionOneAnswer['selected'] = 1;
      //             authController.questionOneAnswer['string'] = 'Location';
      //
      //             authController.update();
      //           },
      //         ),
      //         const SizedBox(height: 13),
      //         OptionButton(
      //           height: size.height * .075,
      //           width: size.width * .2,
      //           color: getColorIfSelected(2),
      //           onTap: () {
      //             authController.questionOneAnswer['selected'] = 2;
      //             authController.questionOneAnswer['string'] = 'Size (Carpet Area)';
      //             authController.update();
      //           },
      //         ),
      //         const SizedBox(height: 15),
      //         OptionButton(
      //           height: size.height * .075,
      //           width: size.width * .2,
      //           color: getColorIfSelected(3),
      //           onTap: () {
      //             authController.questionOneAnswer['selected'] = 3;
      //             authController.questionOneAnswer['string'] = 'Developer';
      //             authController.update();
      //           },
      //         ),
      //         if (isSelected()) const SizedBox(height: 70),
      //         if (isSelected())
      //           const CustomImage(
      //             path: Assets.images4,
      //             // width: size.width * .7,
      //             height: 40,
      //           ),
      //       ],
      //     ),
      //   ),
      // );
      return Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.imagesBG,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: 40,
                    color: Colors.black,
                  ),
                  const Text("1"),
                  Container(
                    height: 1,
                    width: 40,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "What do you look for \nwhen buying a home?",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 60, color: const Color(0xFF00a0e3), height: 0, fontWeight: FontWeight.bold, fontFamily: 'JosefinSans-Bold'),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              padding: EdgeInsets.only(left: size.width * 0.30),
              shrinkWrap: true,
              itemCount: authController.QuestionOneOption.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      authController.QuestionOneCheckBox[index] = !authController.QuestionOneCheckBox[index];
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                          side: BorderSide(
                            color: Colors.pink.shade400,
                            width: 1.5,
                          ),
                          activeColor: Colors.pink.shade400,
                          checkColor: Colors.white,
                          value: authController.QuestionOneCheckBox[index],
                          onChanged: (value) {
                            setState(() {
                              authController.QuestionOneCheckBox[index] = value!;
                            });
                          }),
                      Text(
                        authController.QuestionOneOption[index],
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 40),
                      ),
                    ],
                  ),
                );
                // return CheckboxListTile(
                //   secondary: const Icon(Icons.check_box_outline_blank),
                //   activeColor: Colors.pink.shade400,
                //   fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                //     return Colors.pink.shade400;
                //   }),
                //   title: Text(
                //     authController.QuestionOneOption[index],
                //     style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 40),
                //   ),
                //   value: authController.QuestionOneCheckBox[index],
                //   onChanged: (value) {
                //     log(value.toString());
                //     setState(() {
                //       authController.QuestionOneCheckBox[index] = value!;
                //     });
                //   },
                // );
              },
            ),
          ],
        ),
      );
    });
  }
}

class QuestionTwo extends StatefulWidget {
  const QuestionTwo({Key? key}) : super(key: key);

  @override
  State<QuestionTwo> createState() => _QuestionTwoState();
}

class _QuestionTwoState extends State<QuestionTwo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(builder: (authController) {
      return Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.imagesBG,
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: 40,
                    color: Colors.black,
                  ),
                  const Text("2"),
                  Container(
                    height: 1,
                    width: 40,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "What do you look for when\nbuying a car?",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 60, color: const Color(0xFF00a0e3), fontWeight: FontWeight.bold, fontFamily: 'JosefinSans-Bold', height: 0),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ListView.builder(
                padding: EdgeInsets.only(left: size.width * 0.30),
                shrinkWrap: true,
                itemCount: authController.QuestionSecondOption.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        authController.QuestionTwoCheckBox[index] = !authController.QuestionTwoCheckBox[index];
                      });
                    },
                    child: Row(
                      children: [
                        Checkbox(
                            side: BorderSide(
                              color: Colors.pink.shade400,
                              width: 1.5,
                            ),
                            activeColor: Colors.pink.shade400,
                            checkColor: Colors.white,
                            value: authController.QuestionTwoCheckBox[index],
                            onChanged: (value) {
                              setState(() {
                                authController.QuestionTwoCheckBox[index] = value!;
                              });
                            }),
                        Text(
                          authController.QuestionSecondOption[index],
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 40),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class QuestionThree extends StatefulWidget {
  const QuestionThree({Key? key}) : super(key: key);

  @override
  State<QuestionThree> createState() => _QuestionThreeState();
}

class _QuestionThreeState extends State<QuestionThree> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  // bool _isInit = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(builder: (authController) {
      // return Positioned(
      //   top: size.height * .278,
      //   // left: size.width * .4,
      //   width: size.width,
      //   child: Material(
      //     color: Colors.transparent,
      //     elevation: 0,
      //     child: Column(
      //       children: [
      //         OptionButton(
      //           height: size.height * .075,
      //           width: size.width * .55,
      //           color: getColorIfSelected(1),
      //           onTap: () {
      //             authController.questionTwoAnswer['selected'] = 1;
      //             authController.questionTwoAnswer['string'] = 'Reservoir matrix system';
      //             authController.update();
      //           },
      //         ),
      //         const SizedBox(height: 13),
      //         OptionButton(
      //           height: size.height * .075,
      //           width: size.width * .55,
      //           color: getColorIfSelected(2),
      //           onTap: () {
      //             authController.questionTwoAnswer['selected'] = 2;
      //             authController.questionTwoAnswer['string'] = 'Nano crystalline technology';
      //             authController.update();
      //           },
      //         ),
      //         const SizedBox(height: 15),
      //         OptionButton(
      //           height: size.height * .075,
      //           width: size.width * .55,
      //           color: getColorIfSelected(3),
      //           onTap: () {
      //             authController.questionTwoAnswer['selected'] = 3;
      //             authController.questionTwoAnswer['string'] = 'Easy release technology';
      //             authController.update();
      //           },
      //         ),
      //         const SizedBox(height: 14),
      //         OptionButton(
      //           height: size.height * .075,
      //           width: size.width * .55,
      //           color: getColorIfSelected(4),
      //           onTap: () {
      //             authController.questionTwoAnswer['selected'] = 4;
      //             authController.questionTwoAnswer['string'] = 'Micro encapsulation technology';
      //             authController.update();
      //           },
      //         ),
      //         if (isSelected()) const SizedBox(height: 70),
      //         if (isSelected())
      //           const CustomImage(
      //             path: Assets.images6,
      //             // width: size.width * .7,
      //             height: 40,
      //           ),
      //       ],
      //     ),
      //   ),
      // );
      return Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.imagesBG,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: 40,
                    color: Colors.black,
                  ),
                  const Text("3"),
                  Container(
                    height: 1,
                    width: 40,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "What do you look for\nwhen buying a mobile phone?",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 60, color: const Color(0xFF00a0e3), fontWeight: FontWeight.bold, fontFamily: 'JosefinSans-Bold', height: 0),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              padding: EdgeInsets.only(left: size.width * 0.30),
              shrinkWrap: true,
              itemCount: authController.QuestionThirdOption.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      authController.QuestionThreeCheckBox[index] = !authController.QuestionThreeCheckBox[index];
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                          side: BorderSide(
                            color: Colors.pink.shade400,
                            width: 1.5,
                          ),
                          activeColor: Colors.pink.shade400,
                          checkColor: Colors.white,
                          value: authController.QuestionThreeCheckBox[index],
                          onChanged: (value) {
                            setState(() {
                              authController.QuestionThreeCheckBox[index] = value!;
                            });
                          }),
                      Text(
                        authController.QuestionThirdOption[index],
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 40),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

// class QuestionFour extends StatefulWidget {
//   const QuestionFour({Key? key}) : super(key: key);
//
//   @override
//   State<QuestionFour> createState() => _QuestionFourState();
// }
//
// class _QuestionFourState extends State<QuestionFour> {
//   final assetsAudioPlayer = AssetsAudioPlayer();
//   // bool _isInit = true;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return CustomImage(path: Assets.imagesNew1,fit: B,);
//     return Container(
//         width: size.width,
//         height: size.height,
//         padding: const EdgeInsets.only(top: 20),
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage(
//               Assets.imagesBG,
//             ),
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Thank you for your response.",
//                 style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 40, fontWeight: FontWeight.w400, color: Colors.black87, letterSpacing: 2),
//               ),
//               CustomImage(
//                 path: Assets.imagesD2,
//                 height: size.height * 0.45,
//               )
//             ],
//           ),
//         ));
//   }
// }

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(builder: (authController) {
      return Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                Assets.imagesBG,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Any other comments:",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 40, fontWeight: FontWeight.bold, color: const Color(0xFF00a0e3)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: authController.comments,
                    maxLines: 17,
                    decoration: CustomDecoration.inputDecoration(borderColor: Colors.black38),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
