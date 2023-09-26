import '../controllers/controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DataBucket {
  static final DataBucket _instance = DataBucket._internal();

  DataBucket._internal();

  static DataBucket getInstance() => _instance;

}