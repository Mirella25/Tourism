import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/transactions_guide_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/transactions/info_guide_transactios.dart';

class TransactionsGuide extends StatelessWidget {
  const TransactionsGuide({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionsGuideControllerImp controllerImp =
        Get.put(TransactionsGuideControllerImp());
    controllerImp.getTransactions();
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
                return InfoTrasactionsGuide(
                  date: controllerImp.gettransactions[index]['date'],
                  wallet: controllerImp.gettransactions[index]['wallet'],
                  amount: controllerImp.gettransactions[index]['amount'],
                );
              },
            );
          }
        }));
  }
}
