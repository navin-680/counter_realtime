import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedScreen = 0.obs;
  var counter_1 = 0.obs;
  var counter_2 = 0.obs;
  var counter_3 = 0.obs;

  @override
  void onInit() {
    var ref = FirebaseDatabase.instance.ref();
    ref.child('counter-1').once().then((value) {
      var data = value.snapshot;
      counter_1.value = data.value as int;
    });
    ref.child('counter-2').once().then((value) {
      var data = value.snapshot;
      counter_2.value =  data.value as int;
    });
    ref.child('counter-3').once().then((value) {
      var data = value.snapshot;
      counter_3.value =  data.value as int;
    });
    super.onInit();
  }
}