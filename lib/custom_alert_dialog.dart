import 'dart:math';

import 'package:catproject/main_controller.dart';
import 'package:catproject/timer_widget.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key, required this.isTimer});
  final bool isTimer;

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  MainController mainController = MainController();
  List<String>? facts = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    List<String>? list = await mainController.fetchCats();
    setState(() => facts = list);
  }

  Random random = Random();
  @override
  Widget build(BuildContext context) {
    int randomNumber = random.nextInt(4);
    if (facts != null && facts!.isNotEmpty) {
      return widget.isTimer
          ? AlertDialog(
              title: TimerWidget(facts: facts!),
            )
          : AlertDialog(
              title: Text(facts?[randomNumber] ?? "Nothing found"),
            );
    } else {
      return const AlertDialog(
        title: Text("Loading..."),
      );
    }
  }
}
