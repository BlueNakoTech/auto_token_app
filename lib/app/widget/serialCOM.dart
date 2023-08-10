import 'package:auto_token_app/app/modules/home/controllers/home_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';
import 'package:libserialport/libserialport.dart';

class SerialPortWidget extends StatefulWidget {
  const SerialPortWidget({super.key});

  @override
  State<SerialPortWidget> createState() => _SerialPortWidgetState();
}

class _SerialPortWidgetState extends State<SerialPortWidget> {
  List<String> availablePorts = [];

  @override
  void initState() {
    super.initState();
    initPorts();
  }

  void initPorts() {
    setState(
      () => availablePorts = SerialPort.availablePorts,
    );
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60).copyWith(top: 38),
      alignment: Alignment.topCenter,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: const [
              Icon(
                Icons.usb_sharp,
                size: 16,
                color: Colors.white,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                  'Select Available Port',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: availablePorts
              .map((String item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
              controller.serialConnect(value!);
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Colors.blue,
            ),
            elevation: 2,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            offset: const Offset(56, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
        ),
      ),
    );
  }
}
