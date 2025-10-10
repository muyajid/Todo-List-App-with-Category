import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:todolist_project_with_category/controller/switch_controller.dart';
import 'package:todolist_project_with_category/controller/todo_controller.dart';
import 'package:todolist_project_with_category/pages/mobilescreen/history_mobilescreen.dart';
import 'package:todolist_project_with_category/pages/widescreen/history_widescreen_page.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';
import 'package:todolist_project_with_category/widgets/widget_todo_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final controller = Get.find<SwitchController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateScreen(constraints);

          return Obx(
            () => controller.isMobile.value
                ? HistoryMobilescreen()
                : HistoryWidescreenPage(),
          );
        },
      ),
    );
  }
}
