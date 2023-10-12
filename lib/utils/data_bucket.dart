import 'package:flutter/foundation.dart';
import 'package:hiaki_admin/controllers/update_list_controller.dart';
import 'package:hiaki_admin/model/support_list.dart';

import '../controllers/controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataBucket {
  static final DataBucket _instance = DataBucket._internal();

  DataBucket._internal();

  static DataBucket getInstance() => _instance;

  List<UserProfileModel> listProfileData = [];

  List<UserProfileModel> getDataProfile() => listProfileData;

  void setDataProfile(dynamic fecthProfileData) {
    listProfileData = [];

    var userName = fecthProfileData['UserName'];
    var fullName = fecthProfileData['FullName'];
    var email = fecthProfileData['Email'];
    var phoneNumber = fecthProfileData['PhoneNumber'];
    var address = fecthProfileData['Address'];

    listProfileData.add(UserProfileModel(
        userName: userName,
        address: address,
        email: email,
        fullName: fullName,
        phoneNumber: phoneNumber));
  }

  List<SupportList> listSupportPending = [];

  List<SupportList> getSupportPending() => listSupportPending;

  void setSupportPending(dynamic fecthSupportData) {
    listSupportPending = [];
    for (var item in fecthSupportData) {
      var device = item['Device'];
      var customer = item['Customer'];
      var phoneNumber = item['PhoneNumber'];
      var responsibility = item['Responsibility'];
      var request = item['Request'];
      var requestType = item['RequestType'];
      var creationDate = item['CreationDate'];
      var timeSchedule = item['TimeSchedule'].toString();
      DateTime timeScheduleFormat =
          DateFormat("yyyy/MM/dd hh:mm:ss").parse(timeSchedule);
      var status = item['Status'];
      var contractID = item['ContractID'];
      var maintenanceID = item['MaintenanceID'];
      var address = item['Address'];

      if (status == "Open") {
        List chatContent = item['ChatContent'];
        List<ChatContent> listNoteCustomer = [];
        for (var chat in chatContent) {
          listNoteCustomer = [];
          var content = chat['Content'];
          listNoteCustomer.add(ChatContent(content: content));
        }

        listSupportPending.add(SupportList(
            device: device,
            customer: customer,
            phoneNumber: phoneNumber,
            responsibility: responsibility,
            request: request,
            requestType: requestType,
            creationDate: creationDate,
            timeSchedule: timeScheduleFormat,
            status: status,
            contractID: contractID,
            maintenanceID: maintenanceID,
            chatContent: listNoteCustomer,
            address: address));
      }
    }
  }

  List<SupportList> listSupportProgress = [];

  List<SupportList> getSupportProgress() => listSupportProgress;

  void setSupportProgress(dynamic fecthSupportData) {
    final taskListController = Get.put(TaskListController());
    listSupportProgress = [];
    for (var item in fecthSupportData) {
      var device = item['Device'];
      var customer = item['Customer'];
      var phoneNumber = item['PhoneNumber'];
      var responsibility = item['Responsibility'];
      var request = item['Request'];
      var requestType = item['RequestType'];
      var creationDate = item['CreationDate'];
      var timeSchedule = item['TimeSchedule'].toString();
      DateTime timeScheduleFormat =
          DateFormat("yyyy/MM/dd hh:mm:ss").parse(timeSchedule);
      var status = item['Status'];
      var contractID = item['ContractID'];
      var maintenanceID = item['MaintenanceID'];
      var address = item['Address'];

      if (status == "On progressing") {
        List chatContent = item['ChatContent'];
        List<ChatContent> listNoteCustomer = [];
        for (var chat in chatContent) {
          listNoteCustomer = [];
          var content = chat['Content'];
          listNoteCustomer.add(ChatContent(content: content));
        }

        listSupportProgress.add(SupportList(
            device: device,
            customer: customer,
            phoneNumber: phoneNumber,
            responsibility: responsibility,
            request: request,
            requestType: requestType,
            creationDate: creationDate,
            timeSchedule: timeScheduleFormat,
            status: status,
            contractID: contractID,
            maintenanceID: maintenanceID,
            chatContent: listNoteCustomer,
            address: address));
      }
    }
    taskListController.listProgress.value = listSupportProgress;
  }

  List<SupportList> listSupportHistory = [];

  List<SupportList> getSupportHistory() => listSupportHistory;

  void setSupportHistory(dynamic fecthSupportData) {
    listSupportHistory = [];

    for (var item in fecthSupportData) {
      var device = item['Device'];
      var customer = item['Customer'];
      var phoneNumber = item['PhoneNumber'];
      var responsibility = item['Responsibility'];
      var request = item['Request'];
      var requestType = item['RequestType'];
      var creationDate = item['CreationDate'];
      var timeSchedule = item['TimeSchedule'].toString();
      DateTime timeScheduleFormat =
          DateFormat("yyyy/MM/dd hh:mm:ss").parse(timeSchedule);
      var status = item['Status'];
      var contractID = item['ContractID'];
      var maintenanceID = item['MaintenanceID'];
      var address = item['Address'];

      if (status != "On progressing" && status != "Open") {
        List chatContent = item['ChatContent'];
        List<ChatContent> listNoteCustomer = [];
        for (var chat in chatContent) {
          listNoteCustomer = [];
          var content = chat['Content'];
          listNoteCustomer.add(ChatContent(content: content));
        }

        listSupportHistory.add(SupportList(
            device: device,
            customer: customer,
            phoneNumber: phoneNumber,
            responsibility: responsibility,
            request: request,
            requestType: requestType,
            creationDate: creationDate,
            timeSchedule: timeScheduleFormat,
            status: status,
            contractID: contractID,
            maintenanceID: maintenanceID,
            chatContent: listNoteCustomer,
            address: address));
      }
    }
  }
}
