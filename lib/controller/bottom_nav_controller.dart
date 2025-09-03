import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final currentIndex = 0.obs;
  void changePageIndex(int i) => currentIndex.value = i;
}
