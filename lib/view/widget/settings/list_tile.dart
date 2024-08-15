// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tourism_app/core/localization/changelocale.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyLocaleController(), fenix: true);

    return Center(
      child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              side: BorderSide.none, borderRadius: BorderRadius.circular(30)),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 89, 213, 93).withOpacity(0.2)),
            child: const Icon(
              LineAwesomeIcons.globe,
              size: 30,
              color: Color.fromARGB(255, 89, 213, 93),
            ),
          ),
          title: Text(
            "13".tr,
            style: const TextStyle(fontSize: 20),
          ),
          trailing: Obx(
            () => Padding(
              padding: const EdgeInsets.all(5),
              child: DropdownButton<String>(
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_right),
                  borderRadius: BorderRadius.circular(20),
                  iconEnabledColor: Colors.grey,
                  value: Get.find<MyLocaleController>().choosenLang.value,
                  items: [
                    DropdownMenuItem(
                      value: "en",
                      child: Text(
                        "14".tr,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "ar",
                      child: Text(
                        "15".tr,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                  onChanged: (value) {
                    Get.find<MyLocaleController>().changeLang(value!);
                  }),
            ),
          )),
    );
  }
}
