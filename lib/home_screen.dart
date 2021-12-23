
import 'package:counter_real/controller/home_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/counter_1.dart';
import 'screens/counter_2.dart';
import 'screens/counter_3.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());
  var screens = [Counter1(), Counter2(), Counter3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Counter App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              var ref = FirebaseDatabase.instance.ref();
              ref.child('counter-1').set(0);
              ref.child('counter-2').set(0);
              ref.child('counter-3').set(0);
              controller.counter_1.value = 0;
              controller.counter_2.value = 0;
              controller.counter_3.value = 0;
            },
            child: const Text(
              'CLEAR',
              style: TextStyle(
                fontSize: 13,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: Obx(() => screens[controller.selectedScreen.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          currentIndex: controller.selectedScreen.value,
          items: const [
            BottomNavigationBarItem(
              label: 'counter-1',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'counter-2',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'counter-3',
              icon: Icon(Icons.home),
            ),
          ],
          onTap: (index) {
            controller.selectedScreen.value = index;
          },
        ),
      ),
    );
  }
}
