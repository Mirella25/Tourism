// ignore_for_file: prefer_if_null_operators

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/profile_guide_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/profile/delete_profile_guide_button.dart';
import 'package:tourism_app/view/widget/profile/edit_profile_button_guide.dart';
import 'package:tourism_app/view/widget/profile/options_profile.dart';
import 'package:tourism_app/view/widget/profile/photo_profile.dart';
import 'package:tourism_app/view/widget/profile/user_name.dart';

class ProfileGuidePage extends StatelessWidget {
  const ProfileGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileGuideControllerImp controller =
        Get.put(ProfileGuideControllerImp());
    controller.profile();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(AppRoute.navbarGuide);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: Text(
          "10".tr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Obx(
            () {
              if (controller.isLoading.value || controller.isLoading2.value) {
                return Center(
                    child: Lottie.asset(ImageAssets.loading,
                        width: 250, height: 250));
              }
              String photoUrl = controller.userData['photo'] != null &&
                      controller.userData.isNotEmpty
                  ? "http://10.0.2.2:8000${controller.userData['photo']}"
                  : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
              return Column(
                children: [
                  PhotoProfile(photoUrl: photoUrl),
                  const SizedBox(height: 15),
                  UserName(
                    name: controller.userData['name'] ?? '74'.tr,
                    email: controller.userData['email'] ?? '75'.tr,
                    accept:
                        "${controller.userData['accept_by_admin']} by admin",
                  ),
                  const SizedBox(height: 30),
                  const EditProfilebuttonGuide(),
                  const SizedBox(height: 40),
                  ProfileOptions(
                    onTap: () {
                      Get.toNamed(AppRoute.editpasswordGuide);
                    },
                    icon: Icons.password,
                    title: "32".tr,
                  ),
                  ProfileOptions(
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        dismissOnTouchOutside: true,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.topSlide,
                        width: 500,
                        borderSide: BorderSide(
                          color: AppColor.mainColor,
                        ),
                        transitionAnimationDuration: const Duration(seconds: 2),
                        title: "19".tr,
                        titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        desc: controller.userData['wallet'] != null
                            ? controller.userData['wallet']
                            : "105".tr,
                        descTextStyle: TextStyle(
                          color: AppColor.mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ).show();
                    },
                    icon: Icons.wallet_outlined,
                    title: '19'.tr,
                  ),
                  const Divider(),
                  const DeleteProfileGuideButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
