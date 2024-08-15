import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/login_controller.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/auth_widgets/auth_button.dart';
import 'package:tourism_app/view/widget/auth_widgets/page_title_bar.dart';
import 'package:tourism_app/view/widget/auth_widgets/under_part.dart';
import 'package:tourism_app/view/widget/auth_widgets/upside.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_textfield.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LogInControllerImp());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Get.find<LogInControllerImp>().isloading.value == true
              ? Center(
                  child: Lottie.asset(ImageAssets.loading,
                      width: 250, height: 250))
              : SizedBox(
                  width: size.width,
                  height: size.height,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Upside(
                          imgUrl: ImageAssets.logIn,
                        ),
                        PageTitleBar(title: '51'.tr),
                        Padding(
                          padding: const EdgeInsets.only(top: 320.0),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Form(
                                    key: Get.find<LogInControllerImp>().key,
                                    child: Column(children: [
                                      CustomTextField(
                                          controller:
                                              Get.find<LogInControllerImp>()
                                                  .email,
                                          labelText: "48".tr,
                                          prefixIcon: const Icon(Icons.email),
                                          validator: (p0) {
                                            if (p0!.isEmpty) {
                                              return "24".tr;
                                            } else if (!p0.isEmail) {
                                              return "52".tr;
                                            }
                                            return null;
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress),
                                      CustomTextField(
                                          controller:
                                              Get.find<LogInControllerImp>()
                                                  .password,
                                          labelText: "53".tr,
                                          prefixIcon: const Icon(Icons.lock),
                                          validator: (p0) {
                                            if (p0!.isEmpty) {
                                              return "24".tr;
                                            } else if (p0.length < 8) {
                                              return "38".tr;
                                            } else if (!p0.contains(
                                                    RegExp(r'[a-z]')) &&
                                                !p0.contains(
                                                    RegExp(r'[A-Z]'))) {
                                              return "54".tr;
                                            } else if (!p0
                                                .contains(RegExp(r'[0-9]'))) {
                                              return "71".tr;
                                            }
                                            return null;
                                          },
                                          icon: Get.find<LogInControllerImp>()
                                                      .isShowPass
                                                      .value ==
                                                  false
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          onTapIcon: () {
                                            Get.find<LogInControllerImp>()
                                                .showPass();
                                          },
                                          obscureText:
                                              Get.find<LogInControllerImp>()
                                                  .isShowPass
                                                  .value,
                                          keyboardType: TextInputType.text),
                                    ])),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomAuthButton(
                                    onPressed: () async {
                                      if (Get.find<LogInControllerImp>()
                                          .key
                                          .currentState!
                                          .validate()) {
                                        Get.find<LogInControllerImp>().logIn();
                                      }
                                    },
                                    buttonTitle: "55".tr),
                                const SizedBox(
                                  height: 10,
                                ),
                                UnderPart(
                                  title: "56".tr,
                                  navigatorText: "57".tr,
                                  onTap: () {
                                    Get.offAllNamed(AppRoute.register);
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                UnderPart(
                                  title: "58".tr,
                                  navigatorText: "59".tr,
                                  onTap: () {
                                    Get.toNamed(AppRoute.forgetpassword);
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
