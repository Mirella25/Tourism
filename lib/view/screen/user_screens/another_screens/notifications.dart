import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/notifications_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationsControllerImp controllerImp =
        Get.put(NotificationsControllerImp());
    controllerImp.getRead();
    controllerImp.getUnRead();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              child: Text("106".tr),
            ),
            Tab(
              child: Text("107".tr),
            ),
          ]),
          toolbarHeight: 80,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoute.navbar);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
          title: Text(
            "108".tr,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<NotificationsControllerImp>(
            builder: (controller) => TabBarView(
                  children: [
                    controller.listUnRead.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle_notifications,
                                  color: AppColor.mainColor,
                                  size: 200,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  '109'.tr,
                                  style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    backgroundColor:
                                        AppColor.mainColor.withOpacity(0.1),
                                  ),
                                )
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.listUnRead.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  controller.setRead(
                                      controller.listUnRead[index]['id']);
                                  var data = controller.listRead[index]['data'];

                                  if (data['trip_id'] != null) {
                                    Get.offNamed(AppRoute.tripDetails,
                                        parameters: {
                                          'id': controllerImp.listUnRead[index]
                                                  ['data']['trip_id']
                                              .toString()
                                        });
                                  } else if (data['note'] != null) {
                                    // go where note
                                  } else if (data['amount'] != null) {
                                    Get.offNamed(AppRoute.transactions);
                                  }
                                },
                                child: Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor:
                                      AppColor.mainColor.withOpacity(0.5),
                                  child: ListTile(
                                    leading: Icon(Icons.notifications,
                                        color: AppColor.mainColor),
                                    title: Text(
                                      controller.listUnRead[index]['data']
                                          ['message'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                    controller.listRead.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle_notifications,
                                  color: AppColor.mainColor,
                                  size: 200,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  '109'.tr,
                                  style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    backgroundColor:
                                        AppColor.mainColor.withOpacity(0.1),
                                  ),
                                )
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.listRead.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  var data = controller.listRead[index]['data'];

                                  if (data['trip_id'] != null) {
                                    Get.offNamed(AppRoute.tripDetails,
                                        parameters: {
                                          'id': controllerImp.listRead[index]
                                                  ['data']['trip_id']
                                              .toString()
                                        });
                                  } else if (data['note'] != null) {
                                    // go where note
                                  } else if (data['amount'] != null) {
                                    Get.offNamed(AppRoute.transactions);
                                  }
                                },
                                child: Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 5,
                                  shadowColor:
                                      AppColor.mainColor.withOpacity(0.5),
                                  child: ListTile(
                                    leading: Icon(Icons.notifications,
                                        color: AppColor.mainColor),
                                    title: Text(
                                      controller.listRead[index]['data']
                                          ['message'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                )),
      ),
    );
  }
}
