import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/register_controller.dart';

import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/auth_widgets/auth_button.dart';
import 'package:tourism_app/view/widget/auth_widgets/page_title_bar.dart';
import 'package:tourism_app/view/widget/auth_widgets/under_part.dart';
import 'package:tourism_app/view/widget/auth_widgets/upside.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_textfield.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RegisterControllerImp());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Obx(() => Get.find<RegisterControllerImp>().isloading.value == true
          ? Center(
              child: Lottie.asset(ImageAssets.loading, width: 250, height: 250))
          : SizedBox(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                  child: Stack(children: [
                Upside(
                  imgUrl: ImageAssets.register,
                ),
                PageTitleBar(title: '60'.tr),
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
                          height: 20,
                        ),
                        Form(
                            key: Get.find<RegisterControllerImp>().key,
                            child: Column(children: [
                              CustomTextField(
                                  controller:
                                      Get.find<RegisterControllerImp>().name,
                                  labelText: "22".tr,
                                  prefixIcon: const Icon(Icons.person),
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "24".tr;
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.name),
                              CustomTextField(
                                  controller:
                                      Get.find<RegisterControllerImp>().phone,
                                  labelText: "23".tr,
                                  prefixIcon: const Icon(Icons.phone),
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "24".tr;
                                    } else if (!p0.startsWith('+')) {
                                      return "61".tr;
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number),
                              CustomTextField(
                                  controller: Get.find<RegisterControllerImp>()
                                      .password,
                                  labelText: "53".tr,
                                  prefixIcon: const Icon(Icons.lock),
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "24".tr;
                                    } else if (p0.length < 8) {
                                      return "38".tr;
                                    } else if (!p0.contains(RegExp(r'[a-z]')) &&
                                        !p0.contains(RegExp(r'[A-Z]'))) {
                                      return "54".tr;
                                    } else if (!p0.contains(RegExp(r'[0-9]'))) {
                                      return "71".tr;
                                    }
                                    return null;
                                  },
                                  icon: Get.find<RegisterControllerImp>()
                                              .isShowPass
                                              .value ==
                                          false
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  onTapIcon: () {
                                    Get.find<RegisterControllerImp>()
                                        .showPass();
                                  },
                                  obscureText: Get.find<RegisterControllerImp>()
                                      .isShowPass
                                      .value,
                                  keyboardType: TextInputType.text),
                              CustomTextField(
                                  controller: Get.find<RegisterControllerImp>()
                                      .confpassword,
                                  labelText: "62".tr,
                                  prefixIcon: const Icon(Icons.check_circle),
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "24".tr;
                                    } else if (Get.find<RegisterControllerImp>()
                                            .confpassword
                                            .text !=
                                        Get.find<RegisterControllerImp>()
                                            .password
                                            .text) {
                                      return "41".tr;
                                    }
                                    return null;
                                  },
                                  icon: Get.find<RegisterControllerImp>()
                                              .isShowPass1
                                              .value ==
                                          false
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  onTapIcon: () {
                                    Get.find<RegisterControllerImp>()
                                        .showpass1();
                                  },
                                  obscureText: Get.find<RegisterControllerImp>()
                                      .isShowPass1
                                      .value,
                                  keyboardType: TextInputType.text),
                            ])),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomAuthButton(
                            onPressed: () async {
                              if (Get.find<RegisterControllerImp>()
                                  .key
                                  .currentState!
                                  .validate()) {
                                Get.find<RegisterControllerImp>().Register();
                              }
                            },
                            buttonTitle: "63".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        UnderPart(
                          title: "64".tr,
                          navigatorText: "65".tr,
                          onTap: () {
                            Get.offAllNamed(AppRoute.login);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ])))),
    ));
  }
}
