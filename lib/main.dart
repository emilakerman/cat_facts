import 'package:catproject/catbuilder.dart';
import 'package:catproject/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context: context),
      body: const CatBuilder(),
      floatingActionButton: _buildFAB(context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFAB({required BuildContext context}) {
    return SizedBox(
      height: 70.0,
      width: 200.0,
      child: FloatingActionButton(
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(
            isTimer: false,
          ),
        ),
        child: const Text(
          "Get random fact!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  AppBar _buildAppBar({required BuildContext context}) {
    return AppBar(
      title: TextButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const CustomAlertDialog(
            isTimer: true,
          ),
        ),
        child: const Text(
          "Press for one cat fact a second!",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
