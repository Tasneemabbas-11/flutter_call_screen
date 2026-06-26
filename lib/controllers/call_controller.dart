import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CallController extends GetxController {
  RxBool isCalling = true.obs;
  // RxBool isSpeakerOn = false.obs;
  // RxInt callDuraion = 0.obs;
  RxString callerName = 'Tasneem'.obs;
  // RxString callerStatus = 'Calling...'.obs;
  void acceptCall() {
    Get.toNamed("/call-screen");
  }

  void rejectCall() {
    SystemNavigator.pop();
  }
}
