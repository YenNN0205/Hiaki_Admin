import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiaki_admin/model/support_list.dart';
import 'package:hiaki_admin/utils/networking.dart';

import '../pages/common_widget/yesno_dialog.dart';
import '../utils/data_bucket.dart';

class TaskListController extends GetxController {
  RxList<SupportList> listPending = RxList();
  RxList<SupportList> listProgress = RxList();
  RxList<SupportList> listDone = RxList();
  RxList<UserProfileModel> userData = RxList();

  // Validate for taskItem

  Color colorTask(DateTime timeSchedule) {
    DateTime currentTime = DateTime.now();
    DateTime _currentTime = DateTime(currentTime.year, currentTime.month,
        currentTime.day, currentTime.hour, currentTime.minute);
    DateTime _timeSchedule = DateTime(timeSchedule.year, timeSchedule.month,
        timeSchedule.day, timeSchedule.hour, timeSchedule.minute);
    if (currentTime.compareTo(timeSchedule) < 0) {
      if ((_timeSchedule.difference(_currentTime).inHours) < 24) {
        print(_timeSchedule.difference(_currentTime).inHours);
        return Colors.yellow;
      } else {
        return Colors.green;
      }
    } else {
      return Colors.red;
    }
  }

  Future<void> refresh() async {
    await Networking.getInstance().reloadMetadata();
    // get data from api
    final listAPIPending = DataBucket.getInstance().getSupportPending();
    final listAPIProgress = DataBucket.getInstance().getSupportProgress();
    final listAPIHistory = DataBucket.getInstance().getSupportHistory();
    final userAPIData = DataBucket.getInstance().getDataProfile();

    listPending.value = listAPIPending;
    listProgress.value = listAPIProgress;
    listDone.value = listAPIHistory;
    userData.value = userAPIData;
  }

  void getTaskList() {
    // get data from api
    final listAPIPending = DataBucket.getInstance().getSupportPending();
    final listAPIProgress = DataBucket.getInstance().getSupportProgress();
    final listAPIHistory = DataBucket.getInstance().getSupportHistory();
    final userAPIData = DataBucket.getInstance().getDataProfile();

    listPending.value = listAPIPending;
    listProgress.value = listAPIProgress;
    listDone.value = listAPIHistory;
    userData.value = userAPIData;
  }

  reloadData(
      {required String maintenanceID,
      required String titleDialog,
      required String status,
      String content = "",
      bool isDetail = false}) async {
    var result = await yesNoDialog(titleDialog);
    if (result == "true") {
      final update = await Networking.getInstance().updateStatus(UpdateStatus(
          maintenanceID: maintenanceID, status: status, content: content));
      if (update == "Success") {
        await Networking.getInstance().reloadMetadata();
        // get data from api
        final listAPIPending = DataBucket.getInstance().getSupportPending();
        final listAPIProgress = DataBucket.getInstance().getSupportProgress();
        final listAPIHistory = DataBucket.getInstance().getSupportHistory();
        final userAPIData = DataBucket.getInstance().getDataProfile();

        listPending.value = listAPIPending;
        listProgress.value = listAPIProgress;
        listDone.value = listAPIHistory;
        userData.value = userAPIData;

        if (isDetail) {
          Get.back();
          Get.snackbar("Success", "");
        }
      }
    }
  }
}
