
import 'package:counter_real/controller/home_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counter2 extends StatelessWidget {
  Counter2({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Obx(
          () => Text('Counter: ${controller.counter_2.value.toString()}', style: const TextStyle(
            fontSize: 24,
          ),),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add, color: Colors.black,),
        label: const Text('Increment Me',style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),),
        backgroundColor: Colors.white,
        onPressed: () {
          controller.counter_2.value += 1;
          var ref = FirebaseDatabase.instance.ref();
          ref.child('counter-2').set(controller.counter_2.value);
        },
      ),
    );
  }
}
