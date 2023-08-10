import 'package:flutter/foundation.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var portName = "";

  getPort(String name) {
    portName = name;
  }

  serialConnect(String name) async {
    await getPort(name);
    print(name);
    final port = SerialPort(portName);

    port.openReadWrite();
    if (port.isOpen) {
      print("ready");
    }
  }

  serialWrite(String object) async {
    final port = SerialPort(portName);

    var data = _stringToUint8List(object);
    try {
      print(port.write(data, timeout: 1000));
    } on SerialPortError catch (err, _) {
      print(SerialPort.lastError);
    }
  }
}

Uint8List _stringToUint8List(String data) {
  List<int> codeUnits = data.codeUnits;
  Uint8List uint8list = Uint8List.fromList(codeUnits);
  return uint8list;
}
