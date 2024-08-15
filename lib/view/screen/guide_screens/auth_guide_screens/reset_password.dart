import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/reset_password_guide_controller.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/widget/auth_widgets/auth_button.dart';
import 'package:tourism_app/view/widget/auth_widgets/page_title_bar.dart';
import 'package:tourism_app/view/widget/auth_widgets/upside.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_textfield.dart';

class ResetPasswordGuide extends StatelessWidget {
  const ResetPasswordGuide({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordGuideControllerImp());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => Get.find<ResetPasswordGuideControllerImp>().isloading.value ==
                true
            ? Center(
                child:
                    Lottie.asset(ImageAssets.loading, width: 250, height: 250))
            : SizedBox(
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Upside(
                        imgUrl: ImageAssets.password,
                      ),
                      PageTitleBar(title: '72'.tr),
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
                                  key: Get.find<
                                          ResetPasswordGuideControllerImp>()
                                      .key,
                                  child: Column(children: [
                                    CustomTextField(
                                        controller: Get.find<
                                                ResetPasswordGuideControllerImp>()
                                            .password,
                                        labelText: "40".tr,
                                        prefixIcon: const Icon(Icons.lock),
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return "24".tr;
                                          } else if (p0.length < 8) {
                                            return "38".tr;
                                          } else if (!p0
                                                  .contains(RegExp(r'[a-z]')) &&
                                              !p0.contains(RegExp(r'[A-Z]'))) {
                                            return "54".tr;
                                          } else if (!p0
                                              .contains(RegExp(r'[0-9]'))) {
                                            return "71".tr;
                                          }
                                          return null;
                                        },
                                        icon:
                                            Get.find<ResetPasswordGuideControllerImp>()
                                                        .isShowPass
                                                        .value ==
                                                    false
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                        onTapIcon: () {
                                          Get.find<
                                                  ResetPasswordGuideControllerImp>()
                                              .showPass();
                                        },
                                        obscureText: Get.find<
                                                ResetPasswordGuideControllerImp>()
                                            .isShowPass
                                            .value,
                                        keyboardType: TextInputType.text),
                                    CustomTextField(
                                        controller: Get.find<
                                                ResetPasswordGuideControllerImp>()
                                            .confpassword,
                                        labelText: "62".tr,
                                        prefixIcon:
                                            const Icon(Icons.check_circle),
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return "24".tr;
                                          } else if (Get.find<
                                                      ResetPasswordGuideControllerImp>()
                                                  .confpassword
                                                  .text !=
                                              Get.find<
                                                      ResetPasswordGuideControllerImp>()
                                                  .password
                                                  .text) {
                                            return "41".tr;
                                          }
                                          return null;
                                        },
                                        icon:
                                            Get.find<ResetPasswordGuideControllerImp>()
                                                        .isShowPass1
                                                        .value ==
                                                    false
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                        onTapIcon: () {
                                          Get.find<
                                                  ResetPasswordGuideControllerImp>()
                                              .showpass1();
                                        },
                                        obscureText: Get.find<
                                                ResetPasswordGuideControllerImp>()
                                            .isShowPass1
                                            .value,
                                        keyboardType: TextInputType.text),
                                  ])),
                              CustomAuthButton(
                                  onPressed: () async {
                                    if (Get.find<
                                            ResetPasswordGuideControllerImp>()
                                        .key
                                        .currentState!
                                        .validate()) {
                                      Get.find<
                                              ResetPasswordGuideControllerImp>()
                                          .resetPassword();
                                    }
                                  },
                                  buttonTitle: "21".tr),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    ));
  }
}
