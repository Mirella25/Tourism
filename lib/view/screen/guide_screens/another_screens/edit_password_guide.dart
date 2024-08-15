import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/editpassword_guide_controller.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/widget/editprofile/save_button.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_textfield.dart';

class EditPasswordGuide extends StatelessWidget {
  const EditPasswordGuide({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EditPasswordGuideControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: Text(
          "32".tr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => Form(
            key: Get.find<EditPasswordGuideControllerImp>().key,
            child: Get.find<EditPasswordGuideControllerImp>().isloading.value ==
                    true
                ? Center(
                    child: Lottie.asset(ImageAssets.loading,
                        width: 250, height: 250))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        CustomTextField(
                            onTapIcon: () {
                              Get.find<EditPasswordGuideControllerImp>()
                                  .showPass2();
                            },
                            obscureText:
                                Get.find<EditPasswordGuideControllerImp>()
                                    .isShowPass2
                                    .value,
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
                            controller:
                                Get.find<EditPasswordGuideControllerImp>()
                                    .newpass,
                            labelText: "40".tr,
                            prefixIcon: const Icon(Icons.lock),
                            icon: Get.find<EditPasswordGuideControllerImp>()
                                        .isShowPass2
                                        .value ==
                                    false
                                ? Icons.visibility
                                : Icons.visibility_off,
                            keyboardType: TextInputType.text),
                        CustomTextField(
                            onTapIcon: () {
                              Get.find<EditPasswordGuideControllerImp>()
                                  .showPass3();
                            },
                            obscureText:
                                Get.find<EditPasswordGuideControllerImp>()
                                    .isShowPass3
                                    .value,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "24".tr;
                              } else if (Get.find<
                                          EditPasswordGuideControllerImp>()
                                      .confirmpass
                                      .text !=
                                  Get.find<EditPasswordGuideControllerImp>()
                                      .newpass
                                      .text) {
                                return "41".tr;
                              }
                              return null;
                            },
                            controller:
                                Get.find<EditPasswordGuideControllerImp>()
                                    .confirmpass,
                            labelText: "42".tr,
                            prefixIcon: const Icon(Icons.check_circle),
                            icon: Get.find<EditPasswordGuideControllerImp>()
                                        .isShowPass3
                                        .value ==
                                    false
                                ? Icons.visibility
                                : Icons.visibility_off,
                            keyboardType: TextInputType.text),
                        const SizedBox(
                          height: 100,
                        ),
                        SaveButton(onPressed: () async {
                          if (Get.find<EditPasswordGuideControllerImp>()
                              .key
                              .currentState!
                              .validate()) {
                            Get.find<EditPasswordGuideControllerImp>()
                                .editPassword();
                          }
                        })
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
