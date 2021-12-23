import 'package:counter_real/controller/home_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counter3 extends StatelessWidget {
  final HomeController controller = Get.find();

  Counter3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Obx(
          () => Text('Counter: ${controller.counter_3.value.toString()}', style: const TextStyle(
            fontSize: 24,
          ),),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        icon: const Icon(Icons.add, color: Colors.black,),
        label: const Text('Increment Me',style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),),
        onPressed: () {
          controller.counter_3.value += 1;
          var ref = FirebaseDatabase.instance.ref();
          ref.child('counter-3').set(controller.counter_3.value);
        },
      ),
    );
  }
}
