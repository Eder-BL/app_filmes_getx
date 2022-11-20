import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loaderRx) {
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        await Get.dialog(
          barrierDismissible: false,
          const Center(child: CircularProgressIndicator()),
        );
      } else {
        Get.close(1);
      }
    });
  }
}
