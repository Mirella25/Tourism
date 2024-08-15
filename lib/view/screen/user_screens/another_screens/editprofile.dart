// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/edit_profile_controller.dart';

import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/widget/editprofile/editImage.dart';
import 'package:tourism_app/view/widget/editprofile/save_button.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_textfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EditProfileControllerImp());

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
          "18".tr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Column(
            children: [
              const EditImageProfile(),
              const SizedBox(
                height: 20,
              ),
              Obx(() => Get.find<EditProfileControllerImp>().isloading.value ==
                      true
                  ? Center(
                      child: Lottie.asset(ImageAssets.loading,
                          width: 250, height: 250))
                  : Form(
                      key: Get.find<EditProfileControllerImp>().key,
                      child: Column(
                        children: [
                          CustomTextField(
                              keyboardType: TextInputType.name,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "24".tr;
                                }
                                return null;
                              },
                              controller: Get.find<EditProfileControllerImp>()
                                  .namecontroller,
                              labelText: "22".tr,
                              prefixIcon: const Icon(Icons.person)),
                          CustomTextField(
                              keyboardType: TextInputType.number,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "24".tr;
                                }
                                return null;
                              },
                              controller: Get.find<EditProfileControllerImp>()
                                  .phonecontroller,
                              labelText: "23".tr,
                              prefixIcon: const Icon(Icons.phone)),
                          const SizedBox(
                            height: 50,
                          ),
                          SaveButton(
                            onPressed: () async {
                              if (Get.find<EditProfileControllerImp>()
                                  .key
                                  .currentState!
                                  .validate()) {
                                Get.find<EditProfileControllerImp>()
                                    .editProfile();
                              }
                            },
                          )
                        ],
                      ),
                    )),
            ],
          )
        ]),
      )),
    );
  }
}
