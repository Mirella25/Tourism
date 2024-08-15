import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/verify_code_guide_controller.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/widget/auth_widgets/page_title_bar.dart';
import 'package:tourism_app/view/widget/auth_widgets/upside.dart';

class VerifyCodeGuide extends StatelessWidget {
  const VerifyCodeGuide({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VerifyCodeGuideController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Obx(
        () => Get.find<VerifyCodeGuideController>().isLoading.value == true
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
                      PageTitleBar(title: '69'.tr),
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
                              Text(
                                "70".tr,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Form(
                                child: Column(
                                  children: [
                                    OtpTextField(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      margin: const EdgeInsets.only(
                                          top: 20, bottom: 20, left: 10),
                                      numberOfFields: 6,
                                      borderColor: const Color(0xFF512DA8),
                                      showFieldAsBox: true,
                                      onCodeChanged: (String code) {},
                                      onSubmit: (String verificationCode) {
                                        Get.find<VerifyCodeGuideController>()
                                            .verifyCode(verificationCode);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
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
    ));
  }
}
