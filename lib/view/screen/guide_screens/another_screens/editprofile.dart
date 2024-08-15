import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/edit_profile_guide_controller.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/widget/editprofile/editImage_guide.dart';
import 'package:tourism_app/view/widget/editprofile/save_button.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_textfield.dart';

class EditProfileGuide extends StatelessWidget {
  const EditProfileGuide({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EditProfileGuideControllerImp());

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
              const EditImageGuideProfile(),
              const SizedBox(
                height: 20,
              ),
              Obx(() => Get.find<EditProfileGuideControllerImp>()
                          .isloading
                          .value ==
                      true
                  ? Center(
                      child: Lottie.asset(ImageAssets.loading,
                          width: 250, height: 250))
                  : Form(
                      key: Get.find<EditProfileGuideControllerImp>().key,
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
                              controller:
                                  Get.find<EditProfileGuideControllerImp>()
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
                              controller:
                                  Get.find<EditProfileGuideControllerImp>()
                                      .phonecontroller,
                              labelText: "23".tr,
                              prefixIcon: const Icon(Icons.phone)),
                          CustomTextField(
                              controller:
                                  Get.find<EditProfileGuideControllerImp>()
                                      .fatherName,
                              labelText: "94".tr,
                              prefixIcon: const Icon(Icons.face_outlined),
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "24".tr;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name),
                          CustomTextField(
                              controller:
                                  Get.find<EditProfileGuideControllerImp>()
                                      .motherName,
                              labelText: "95".tr,
                              prefixIcon: const Icon(Icons.face),
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "24".tr;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name),
                          CustomTextField(
                              readOnly:
                                  Get.find<EditProfileGuideControllerImp>()
                                              .changeId ==
                                          "able"
                                      ? true
                                      : false,
                              controller:
                                  Get.find<EditProfileGuideControllerImp>()
                                      .uniqueID,
                              labelText: "96".tr,
                              prefixIcon: const Icon(Icons.numbers),
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "24".tr;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 13, 20, 13),
                            child: DropdownButtonFormField(
                              value: Get.find<EditProfileGuideControllerImp>()
                                  .status
                                  .value,
                              decoration: InputDecoration(
                                labelText: "97".tr,
                                fillColor: Colors.grey[200],
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 89, 213, 93)),
                                    borderRadius: BorderRadius.circular(35)),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35)),
                                floatingLabelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 89, 213, 93),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade400),
                                prefixIcon: const Icon(Icons.check_box),
                                prefixIconColor:
                                    const Color.fromARGB(255, 89, 213, 93),
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: "available",
                                  child: Text("98".tr),
                                ),
                                DropdownMenuItem(
                                  value: "unavailable",
                                  child: Text("99".tr),
                                ),
                              ],
                              onChanged: (newValue) {
                                Get.find<EditProfileGuideControllerImp>()
                                    .status
                                    .value = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "24".tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          CustomTextField(
                              controller:
                                  Get.find<EditProfileGuideControllerImp>()
                                      .pricePerPerson,
                              labelText: "100".tr,
                              prefixIcon: const Icon(Icons.price_change),
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "24".tr;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number),
                          CustomTextField(
                              controller:
                                  Get.find<EditProfileGuideControllerImp>()
                                      .birthPlace,
                              labelText: "101".tr,
                              prefixIcon: const Icon(Icons.place),
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "24".tr;
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 13, 20, 13),
                            child: DateTimeField(
                              controller:
                                  Get.find<EditProfileGuideControllerImp>()
                                      .birthDate,
                              decoration: InputDecoration(
                                labelText: "102".tr,
                                prefixIcon: const Icon(Icons.date_range),
                                fillColor: Colors.grey[200],
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 89, 213, 93)),
                                    borderRadius: BorderRadius.circular(35)),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35)),
                                floatingLabelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 89, 213, 93),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade400),
                                prefixIconColor:
                                    const Color.fromARGB(255, 89, 213, 93),
                              ),
                              format: DateFormat("dd-MM-yyyy"),
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "24".tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SaveButton(
                            onPressed: () async {
                              if (Get.find<EditProfileGuideControllerImp>()
                                  .key
                                  .currentState!
                                  .validate()) {
                                Get.find<EditProfileGuideControllerImp>()
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
