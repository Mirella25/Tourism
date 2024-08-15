// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tourism_app/controller/user/home_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';

class HomeSearch extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Material(
        borderRadius: BorderRadius.circular(100),
        elevation: 5,
        shadowColor: Theme.of(context).shadowColor.withOpacity(0.6),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(children: [
              Expanded(
                  child: TextFormField(
                controller: searchController,
                cursorColor: AppColor.mainColor,
                decoration: InputDecoration(
                  hintText: "115".tr,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColor.mainColor,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onFieldSubmitted: (value) {
                  Get.find<HomeControllerImp>()
                      .searchHomeCountries(value)
                      .then((value) {
                    if (value == true) {
                      Get.toNamed(AppRoute.search);
                    }
                    searchController.clear();
                  });
                },
              )),
              !Get.find<HomeControllerImp>().searchLoading
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColor.mainColor,
                        child: const Icon(
                          Icons.sort_by_alpha_sharp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const Center(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: CircularProgressIndicator(
                              color: AppColor.appColor)))
            ]),
          ),
        ),
      ),
    );
  }
}
