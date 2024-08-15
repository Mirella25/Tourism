import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/forget_password_controller.dart';

import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/widget/auth_widgets/auth_button.dart';
import 'package:tourism_app/view/widget/auth_widgets/page_title_bar.dart';
import 'package:tourism_app/view/widget/auth_widgets/upside.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_textfield.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ForgetPasswordControllerImp(),
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => Get.find<ForgetPasswordControllerImp>().isloading.value == true
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
                        imgUrl: ImageAssets.checkImage,
                      ),
                      PageTitleBar(title: '67'.tr),
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
                                height: 25,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Form(
                                  key: Get.find<ForgetPasswordControllerImp>()
                                      .key,
                                  child: Column(children: [
                                    Text(
                                      "66".tr,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    CustomTextField(
                                        controller: Get.find<
                                                ForgetPasswordControllerImp>()
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
                                  ])),
                              CustomAuthButton(
                                  onPressed: () async {
                                    if (Get.find<ForgetPasswordControllerImp>()
                                        .key
                                        .currentState!
                                        .validate()) {
                                      await Get.find<
                                              ForgetPasswordControllerImp>()
                                          .sendCode();
                                    }
                                  },
                                  buttonTitle: "68".tr),
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
