import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/logout_controller.dart';
import 'package:tourism_app/controller/user/profile_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LogOutControllerImp());
    Get.lazyPut(() => ProfileControllerImp());
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Color.fromARGB(255, 160, 247, 163),
          Color.fromARGB(255, 89, 213, 93)
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Obx(
              () => Row(children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      Get.find<ProfileControllerImp>().userData['photo'] !=
                                  null &&
                              Get.find<ProfileControllerImp>()
                                      .userData['photo'] !=
                                  ''
                          ? "http://10.0.2.2:8000${Get.find<ProfileControllerImp>().userData['photo']}"
                          : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(children: [
                  Text(
                    Get.find<ProfileControllerImp>().userData['name'] ??
                        "74".tr,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Get.find<ProfileControllerImp>().userData['email'] ??
                        "75".tr,
                    style: const TextStyle(fontSize: 12),
                  ),
                ])
              ]),
            ),
            const SizedBox(
              height: 100,
            ),
            ListTile(
              tileColor: Colors.white.withOpacity(0.1),
              onTap: () {
                Get.toNamed(AppRoute.settings);
              },
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                "11".tr,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: Colors.white,
              onTap: () {
                AwesomeDialog(
                  context: context,
                  borderSide: BorderSide(color: AppColor.mainColor),
                  padding: const EdgeInsets.all(15),
                  barrierColor: Colors.grey.withOpacity(0.5),
                  alignment: Alignment.center,
                  autoHide: const Duration(seconds: 40),
                  transitionAnimationDuration:
                      const Duration(milliseconds: 900),
                  dialogType: DialogType.noHeader,
                  animType: AnimType.topSlide,
                  showCloseIcon: true,
                  title: '28'.tr,
                  titleTextStyle: TextStyle(
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  descTextStyle: const TextStyle(fontSize: 15),
                  desc:
                      'Welcome to AdventureGo! We are passionate about curating unforgettable travel experiences that inspire, excite, and connect you with the world around you.\nAt AdventureGo, we believe that every journey is an opportunity for discovery and adventure.\nOur team of travel enthusiasts is dedicated to crafting personalized itineraries tailored to your interests, preferences, and budget. Whether you are dreaming of exploring exotic destinations, embarking on thrilling outdoor adventures, or immersing yourself in vibrant cultures, we are here to turn your travel dreams into reality.With years of experience and a commitment to excellence, we strive to provide you with seamless travel planning, unparalleled customer service, and unforgettable memories that will last a lifetime.\nJoin us on an incredible journey and let AdventureGo be your trusted partner in exploration.\nWherever your wanderlust takes you, we will be there to guide you every step of the way.\nLets embark on an adventure together!',
                ).show();
              },
              leading: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: Text(
                "28".tr,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: Colors.white.withOpacity(0.1),
              onTap: () {},
              leading: const Icon(
                Icons.social_distance_outlined,
                color: Colors.white,
              ),
              title: Text(
                "29".tr,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: Colors.white.withOpacity(0.1),
              onTap: () async {
                Get.find<LogOutControllerImp>().logOut();
              },
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              title: Text(
                "30".tr,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
