import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism_app/controller/guide/edit_profile_guide_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class EditImageGuideProfile extends StatelessWidget {
  const EditImageGuideProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileGuideControllerImp(), permanent: true);

    return Center(
      child: Obx(
        () {
          String imagePath =
              Get.find<EditProfileGuideControllerImp>().selectedImagePath.value;
          ImageProvider imageProvider;

          if (imagePath.isNotEmpty) {
            if (imagePath.startsWith('http') || imagePath.startsWith('https')) {
              imageProvider = NetworkImage(imagePath);
            } else {
              imageProvider = FileImage(File(imagePath));
            }
          } else {
            imageProvider = const NetworkImage(
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png");
          }

          return Container(
            height: 160,
            width: 160,
            margin: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(160),
              color: Colors.grey[200],
              image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
            ),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: InkWell(
                      onTap: () {
                        AwesomeDialog(
                          padding: const EdgeInsets.all(8),
                          context: context,
                          transitionAnimationDuration:
                              const Duration(milliseconds: 400),
                          dialogType: DialogType.noHeader,
                          animType: AnimType.scale,
                          title: "25".tr,
                          body: Column(
                            children: [
                              Text(
                                "25".tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.find<EditProfileGuideControllerImp>()
                                      .deleteImage();
                                  Get.back();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: AppColor.mainColor,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("45".tr),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (xFile != null) {
                                    Get.find<EditProfileGuideControllerImp>()
                                        .setImagePath(xFile.path);
                                  }
                                  Get.back();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.photo,
                                        color: AppColor.mainColor,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("26".tr),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  XFile? xFile = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                  if (xFile != null) {
                                    Get.find<EditProfileGuideControllerImp>()
                                        .setImagePath(xFile.path);
                                  }
                                  Get.back();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.camera_alt,
                                        color: AppColor.mainColor,
                                      ),
                                      const SizedBox(width: 10),
                                      Text("27".tr),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).show();
                      },
                      child: const Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
