// import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/register_guide_controller.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/auth_widgets/auth_button.dart';
import 'package:tourism_app/view/widget/auth_widgets/page_title_bar.dart';
import 'package:tourism_app/view/widget/auth_widgets/under_part.dart';
import 'package:tourism_app/view/widget/auth_widgets/upside.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_textfield.dart';

class RegisterGuide extends StatelessWidget {
  const RegisterGuide({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RegisterGuideControllerImp());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Obx(() => Get.find<RegisterGuideControllerImp>().isloading.value ==
              true
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
                            key: Get.find<RegisterGuideControllerImp>().key,
                            child: Column(children: [
                              CustomTextField(
                                  controller:
                                      Get.find<RegisterGuideControllerImp>()
                                          .name,
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
                                      Get.find<RegisterGuideControllerImp>()
                                          .phone,
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
                                  controller:
                                      Get.find<RegisterGuideControllerImp>()
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
                                      Get.find<RegisterGuideControllerImp>()
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
                                  controller:
                                      Get.find<RegisterGuideControllerImp>()
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
                                padding:
                                    const EdgeInsets.fromLTRB(20, 13, 20, 13),
                                child: DropdownButtonFormField(
                                  value: Get.find<RegisterGuideControllerImp>()
                                      .status
                                      .value,
                                  decoration: InputDecoration(
                                    labelText: "97".tr,
                                    fillColor: Colors.grey[200],
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 89, 213, 93)),
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color.fromARGB(255, 89, 213, 93),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    labelStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey.shade400),
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
                                    Get.find<RegisterGuideControllerImp>()
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
                                      Get.find<RegisterGuideControllerImp>()
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
                                      Get.find<RegisterGuideControllerImp>()
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
                                padding:
                                    const EdgeInsets.fromLTRB(20, 13, 20, 13),
                                child: DateTimeField(
                                  controller:
                                      Get.find<RegisterGuideControllerImp>()
                                          .birthDate,
                                  decoration: InputDecoration(
                                    labelText: "102".tr,
                                    prefixIcon: const Icon(Icons.date_range),
                                    fillColor: Colors.grey[200],
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 89, 213, 93)),
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color.fromARGB(255, 89, 213, 93),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    labelStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey.shade400),
                                    prefixIconColor:
                                        const Color.fromARGB(255, 89, 213, 93),
                                  ),
                                  format: DateFormat("dd-MM-yyyy"),
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
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
                              CustomTextField(
                                  controller:
                                      Get.find<RegisterGuideControllerImp>()
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
                                  icon: Get.find<RegisterGuideControllerImp>()
                                              .isShowPass
                                              .value ==
                                          false
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  onTapIcon: () {
                                    Get.find<RegisterGuideControllerImp>()
                                        .showPass();
                                  },
                                  obscureText:
                                      Get.find<RegisterGuideControllerImp>()
                                          .isShowPass
                                          .value,
                                  keyboardType: TextInputType.text),
                              CustomTextField(
                                  controller:
                                      Get.find<RegisterGuideControllerImp>()
                                          .confpassword,
                                  labelText: "62".tr,
                                  prefixIcon: const Icon(Icons.check_circle),
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "24".tr;
                                    } else if (Get.find<
                                                RegisterGuideControllerImp>()
                                            .confpassword
                                            .text !=
                                        Get.find<RegisterGuideControllerImp>()
                                            .password
                                            .text) {
                                      return "41".tr;
                                    }
                                    return null;
                                  },
                                  icon: Get.find<RegisterGuideControllerImp>()
                                              .isShowPass1
                                              .value ==
                                          false
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  onTapIcon: () {
                                    Get.find<RegisterGuideControllerImp>()
                                        .showpass1();
                                  },
                                  obscureText:
                                      Get.find<RegisterGuideControllerImp>()
                                          .isShowPass1
                                          .value,
                                  keyboardType: TextInputType.text),
                            ])),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomAuthButton(
                            onPressed: () async {
                              if (Get.find<RegisterGuideControllerImp>()
                                  .key
                                  .currentState!
                                  .validate()) {
                                Get.find<RegisterGuideControllerImp>()
                                    .Register();
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
                            Get.offAllNamed(AppRoute.logingGuide);
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
