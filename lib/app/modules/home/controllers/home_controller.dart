import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late SerialPort newport;

  getPortName(SerialPort port) {
    newport = port;
  }

  serialConnection() async {
    newport.openReadWrite();
  }

  serialWrites(Uint8List data) {
    newport.write(data);
  }

  getData(TextEditingController text) {
    Uint8List uint8List = Uint8List.fromList(utf8.encode(text.text));
    serialWrites(uint8List);
  }
}
