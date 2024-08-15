// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/transactions_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/transactions/info_transactions.dart';

class WalletHistory extends StatelessWidget {
  const WalletHistory({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionsControllerImp controllerImp =
        Get.put(TransactionsControllerImp());
    controllerImp.getTransactions();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoute.navbar);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
          title: Text(
            "103".tr,
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controllerImp.isLoading.value) {
            return Center(
                child:
                    Lottie.asset(ImageAssets.loading, width: 250, height: 250));
          } else if (controllerImp.gettransactions.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(ImageAssets.empty),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '104'.tr,
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        backgroundColor: AppColor.mainColor.withOpacity(0.1)),
                  )
                ],
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              itemCount: controllerImp.gettransactions.length,
              itemBuilder: (context, index) {
                return InfoTrasactions(
                  date: controllerImp.gettransactions[index]['date'],
                  wallet: controllerImp.gettransactions[index]['wallet'],
                  amount: controllerImp.gettransactions[index]['amount'],
                  type: controllerImp.gettransactions[index]['type'] == "dis"
                      ? "143".tr
                      : "142".tr,
                  id: controllerImp.gettransactions[index]['reservation_id'],
                  onPressed: () {
                    controllerImp.gettransactions[index]['type'] == "dis"
                        ? Get.toNamed(AppRoute.tripDetails, parameters: {
                            'id': controllerImp.gettransactions[index]
                                    ['reservation_id']
                                .toString()
                          })
                        : Get.snackbar("49".tr, "",
                            overlayBlur: 8,
                            snackStyle: SnackStyle.FLOATING,
                            icon: const Icon(Icons.info),
                            messageText: Text(
                              "118".tr,
                              style: const TextStyle(fontSize: 18),
                            ),
                            margin: const EdgeInsets.all(20),
                            backgroundColor:
                                AppColor.mainColor.withOpacity(0.8));
                  },
                );
              },
            );
          }
        }));
  }
}
