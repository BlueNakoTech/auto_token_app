import 'package:auto_token_app/app/widget/num_pad.dart';
import 'package:auto_token_app/app/widget/serialCOM.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController numPad = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text('Home'),
        ),
        body: Row(
          children: [
            Flexible(
                child: SizedBox(
              child: Column(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: Get.width,
                          height: Get.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 60),
                                child: TextField(
                                  cursorHeight: 30,
                                  keyboardType: TextInputType.number,
                                  maxLength: 6,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 8),
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  controller: controller,
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(180, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () {},
                                  child: const Text("START"))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Flexible(
                      child: SizedBox(
                    child: SerialPortWidget(),
                  )),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: NumPad(
                        buttonSize: 50,
                        buttonColor: Colors.grey,
                        iconColor: Colors.deepOrange,
                        controller: numPad,
                        onChange: () {
                          HomeController().getData(numPad);
                        },
                        delete: () {
                          numPad.text =
                              numPad.text.substring(0, numPad.text.length - 1);
                        },
                        onSubmit: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
