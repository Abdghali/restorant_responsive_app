import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  RxInt counter = 1.obs;

  increment() {
    counter++;
  }

  decrement() {
    counter > 1 ? counter-- : null;
  }
}
