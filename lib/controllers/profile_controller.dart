import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/model/profile_model.dart';
import 'package:hiaki_admin/utils/networking.dart';
import 'package:hiaki_admin/model/support_list.dart';
import '../pages/common_widget/yesno_dialog.dart';
import '../utils/data_bucket.dart';

class ProfileController extends GetxController {
  RxList<UserProfileModel> userData = RxList();
  RxBool readOnly = true.obs;


  reloadProfile({
    required String email,
    required String phoneNumber,
    required String titleDialog,
    required String address,
  }) async {

    var result = await yesNoDialog(titleDialog);
    if (result == "true") {
       userData.value =[];
      final update = await Networking.getInstance().updateProfile(UpdateProfile(
          email: email, phoneNumber: phoneNumber, address: address));
      print(update);
      if (update == "Success") {
        await Networking.getInstance().reloadMetadata();
        // get data from api
      await initData();
        readOnly.toggle();
   
      }
    }
  }


  initData(){
    final userAPIData = DataBucket.getInstance().getDataProfile();
    userData.value = userAPIData;
  }
}
