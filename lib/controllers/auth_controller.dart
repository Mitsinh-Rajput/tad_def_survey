import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tam_def_survey/services/extensions.dart';

import '../data/models/contact_number.dart';
import '../data/models/response/response_model.dart';
import '../data/models/response/user_model.dart';
import '../data/repositories/auth_repo.dart';
import '../generated/assets.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool _acceptTerms = true;

  late final number = ContactNumber(number: '', countryCode: '+91');

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  bool get isLoading => _isLoading;
  bool get acceptTerms => _acceptTerms;
  PageController pageController = PageController();

  Map<String, dynamic> data = {
    "se_name": null,
    "dr_name": null,
    "hq": null,
    "city": null,
    "q1": null,
    "q2": null,
    "q3": null,
    "feedback": null,
  };
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();
  TextEditingController fourController = TextEditingController();
  TextEditingController comments = TextEditingController();

  final FocusNode focusNode = FocusNode();

  late AnimationController controller;

  List QuestionOneOption = [
    "Location",
    "Size (Carpet Area)",
    "Developer",
  ];

  List QuestionSecondOption = [
    "Technology",
    "Comfort",
    "Mileage",
  ];

  List QuestionThirdOption = [
    "Operating System",
    "Camera Quality",
    "Battery Life",
  ];
  String QuestionSecondAnswer = "";
  String QuestionThirdAnswer = "";
  String QuestionOneAnswer = "";

  List<bool> QuestionOneCheckBox = [false, false, false];
  List<bool> QuestionTwoCheckBox = [false, false, false];
  List<bool> QuestionThreeCheckBox = [false, false, false];
  // void setQuestionOneAnswer(String? value) {
  //   QuestionOneAnswer = value;
  // }
  //
  // void setQuestionThirdAnswer(String? value) {
  //   QuestionThirdAnswer = value;
  // }
  //
  // void setQuestionSecondAnswer(String? value) {
  //   QuestionSecondAnswer = value;
  // }

  List<String> images = [
    Assets.imagesBG,
    Assets.imagesBG,
    Assets.imagesBG,
    Assets.imagesBG,
    Assets.imagesBG,
    Assets.imagesNew1,
    Assets.imagesD3,
    Assets.imagesD4,
    Assets.imagesD5,
    Assets.imagesNew11,
    Assets.imagesD7,
    Assets.imagesNew12,
    Assets.imagesBG,
  ];

  Future<bool> connectivity() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');

        return true;
      }
    } on SocketException catch (_) {
      log('not connected');
      return false;
    }
    return false;
  }

  forwardButton() async {
    focusNode.unfocus();
    if (pageController.page! < images.length && validatePages()) {
      if (pageController.page! == images.length - 1 && validatePages()) {
        for (int i = 0; i < QuestionOneCheckBox.length; i++) {
          if (QuestionOneCheckBox[i]) {
            if (i == QuestionOneCheckBox.length - 1) {
              QuestionOneAnswer = QuestionOneAnswer + QuestionOneOption[i];
            } else {
              QuestionOneAnswer =
                  QuestionOneAnswer + QuestionOneOption[i] + ",";
            }
          }
        }
        if (QuestionOneAnswer.endsWith(",")) {
          QuestionOneAnswer =
              QuestionOneAnswer.substring(0, QuestionOneAnswer.length - 1);
        }
        for (int i = 0; i < QuestionTwoCheckBox.length; i++) {
          if (QuestionTwoCheckBox[i]) {
            if (i == QuestionTwoCheckBox.length - 1) {
              QuestionSecondAnswer =
                  QuestionSecondAnswer + QuestionSecondOption[i];
            } else {
              QuestionSecondAnswer =
                  QuestionSecondAnswer + QuestionSecondOption[i] + ",";
            }
          }
        }
        if (QuestionSecondAnswer.endsWith(",")) {
          QuestionSecondAnswer = QuestionSecondAnswer.substring(
              0, QuestionSecondAnswer.length - 1);
        }

        for (int i = 0; i < QuestionThreeCheckBox.length; i++) {
          if (QuestionThreeCheckBox[i]) {
            if (i == QuestionThreeCheckBox.length - 1) {
              QuestionThirdAnswer =
                  QuestionThirdAnswer + QuestionThirdOption[i];
            } else {
              QuestionThirdAnswer =
                  QuestionThirdAnswer + QuestionThirdOption[i] + ",";
            }
          }
        }
        if (QuestionThirdAnswer.endsWith(",")) {
          QuestionThirdAnswer =
              QuestionThirdAnswer.substring(0, QuestionThirdAnswer.length - 1);
        }
        submitForm();
        // await pageController.animateToPage(0, duration: const Duration(milliseconds: 50), curve: Curves.ease);
        // update();
      } else {
        await pageController.animateToPage((pageController.page! + 1).round(),
            duration: const Duration(milliseconds: 50), curve: Curves.ease);
        update();
      }
    }
  }

  bool validatePages() {
    if (pageController.page! == 0) {
      return true;
    } else if (pageController.page! == 1) {
      if (oneController.text.isValid &&
          twoController.text.isValid &&
          threeController.text.isValid &&
          fourController.text.isValid) {
        return true;
      }
      Fluttertoast.showToast(msg: "Please enter all data");
      return false;
    } else if (pageController.page! == 2) {
      // for (int i = 0; i < QuestionOneCheckBox.length; i++) {
      //   if (QuestionOneCheckBox[i]) {
      //     if (i == QuestionOneCheckBox.length - 1) {
      //       QuestionOneAnswer = QuestionOneAnswer + QuestionOneOption[i];
      //     } else {
      //       QuestionOneAnswer = QuestionOneAnswer + QuestionOneOption[i] + ",";
      //     }
      //   }
      // }
      // if (QuestionOneAnswer.endsWith(",")) {
      //   QuestionOneAnswer = QuestionOneAnswer.substring(0, QuestionOneAnswer.length - 1);
      // }
      if (QuestionOneCheckBox.contains(true)) {
        return true;
      }
      Fluttertoast.showToast(msg: "Please select an option");
      return false;
    } else if (pageController.page! == 3) {
      // for (int i = 0; i < QuestionTwoCheckBox.length; i++) {
      //   if (QuestionTwoCheckBox[i]) {
      //     if (i == QuestionTwoCheckBox.length - 1) {
      //       QuestionSecondAnswer = QuestionSecondAnswer + QuestionSecondOption[i];
      //     } else {
      //       QuestionSecondAnswer = QuestionSecondAnswer + QuestionSecondOption[i] + ",";
      //     }
      //   }
      // }
      // if (QuestionSecondAnswer.endsWith(",")) {
      //   QuestionSecondAnswer = QuestionSecondAnswer.substring(0, QuestionSecondAnswer.length - 1);
      // }
      if (QuestionTwoCheckBox.contains(true)) {
        return true;
      }
      Fluttertoast.showToast(msg: "Please select an option");
      return false;
    } else if (pageController.page! == 4) {
      // for (int i = 0; i < QuestionThreeCheckBox.length; i++) {
      //   if (QuestionThreeCheckBox[i]) {
      //     if (i == QuestionThreeCheckBox.length - 1) {
      //       QuestionThirdAnswer = QuestionThirdAnswer + QuestionThirdOption[i];
      //     } else {
      //       QuestionThirdAnswer = QuestionThirdAnswer + QuestionThirdOption[i] + ",";
      //     }
      //   }
      // }
      // if (QuestionThirdAnswer.endsWith(",")) {
      //   QuestionThirdAnswer = QuestionThirdAnswer.substring(0, QuestionThirdAnswer.length - 1);
      // }
      if (QuestionThreeCheckBox.contains(true)) {
        return true;
      }
      Fluttertoast.showToast(msg: "Please select an option");
      return false;
    } else if (pageController.page! == images.length - 1) {
      if (comments.text != "") {
        return true;
      }
      Fluttertoast.showToast(msg: "Please provide a feedback");
      return false;
    }
    {
      return true;
    }
  }

  resetForm() async {
    await pageController.animateToPage(0,
        duration: const Duration(milliseconds: 50), curve: Curves.ease);
    oneController.clear();
    twoController.clear();
    threeController.clear();
    fourController.clear();
    comments.clear();

    QuestionOneAnswer = "";
    QuestionSecondAnswer = "";
    QuestionThirdAnswer = "";
    QuestionOneCheckBox = [false, false, false];
    QuestionTwoCheckBox = [false, false, false];
    QuestionThreeCheckBox = [false, false, false];
    await pageController.animateToPage(0,
        duration: const Duration(milliseconds: 50), curve: Curves.ease);
    update();
  }

  submitForm() async {
    data['se_name'] = oneController.text;
    data['dr_name'] = twoController.text;
    data['hq'] = threeController.text;
    data['city'] = fourController.text;
    data['q1'] = QuestionOneAnswer;
    data['q2'] = QuestionSecondAnswer;
    data['q3'] = QuestionThirdAnswer;
    data['feedback'] = comments.text;
    if (await connectivity()) {
      //API CALL
      log(
        "$data",
        name: "DATA",
      );
      submitDa(data).then((value) {
        if (value.isSuccess) {
          resetForm();
          controller.forward(from: 0);
          Fluttertoast.showToast(msg: "Data saved to server");
        } else {
          SharedPreferences sharedPreferences = Get.find();
          sharedPreferences.clear();
          log('${sharedPreferences.getString('saved_data')}');
          List<dynamic> savedData =
              jsonDecode(sharedPreferences.getString('saved_data') ?? '[]');
          savedData.add(data);
          sharedPreferences.setString('saved_data', jsonEncode(savedData));
          resetForm();
          controller.forward(from: 0).then((value) {
            syncData();
          });
          Fluttertoast.showToast(msg: "Data saved locally");
        }
      });
    } else {
      SharedPreferences sharedPreferences = Get.find();
      List<dynamic> savedData =
          jsonDecode(sharedPreferences.getString('saved_data') ?? '[]');
      savedData.add(data);
      sharedPreferences.setString('saved_data', jsonEncode(savedData));
      Fluttertoast.showToast(msg: "Data saved locally");
      resetForm();
      controller.forward(from: 0).then((value) {
        syncData();
      });
    }
  }

  Future<ResponseModel> submitDa(data) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    try {
      Response response = await authRepo.submitDa(FormData(data));
      log(response.bodyString.toString(), name: 'submitDa()');
      if (response.statusCode == 200) {
        responseModel = ResponseModel(true, '${response.body}', response.body);
        _isLoading = false;
        update();
      } else {
        _isLoading = false;
        responseModel =
            ResponseModel(false, response.statusText!, response.body['errors']);
        update();
      }
    } catch (e) {
      _isLoading = false;
      update();
      responseModel = ResponseModel(false, "CATCH");
      log('++++++++ ${e.toString()} ++++++++', name: "ERROR AT submitDa()");
    }

    return responseModel;
  }

  syncData() async {
    if (await connectivity()) {
      SharedPreferences sharedPreferences = Get.find();
      List<dynamic> savedData =
          jsonDecode(sharedPreferences.getString('saved_data') ?? '[]');
      List remaining = [];
      if (savedData.isNotEmpty) {
        log(savedData.toString(), name: "Data available");
        for (int i = savedData.length - 1; i >= 0; i--) {
          var element = savedData[i];
          log("$element", name: "Data element");

          // if (false)
          submitDa(element).then((value) {
            if (value.isSuccess) {
              log("${value.isSuccess}");
              savedData.removeAt(savedData.indexOf(element));
            } else {
              remaining.add(element);
            }
          });
        }

        Fluttertoast.showToast(msg: "Synced Successfully");
        sharedPreferences.setString('saved_data', jsonEncode(remaining));
      } else {
        Fluttertoast.showToast(msg: "Synced Successfully");
      }
    } else {
      Fluttertoast.showToast(msg: "Please connect to internet");
    }
  }

  void toggleTerms() {
    _acceptTerms = !_acceptTerms;
    update();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  void setUserToken(String id) {
    authRepo.saveUserToken(id);
  }
}
