import 'package:catproject/main_controller.dart';
import 'package:flutter/material.dart';

class CatBuilder extends StatefulWidget {
  const CatBuilder({super.key});

  @override
  _CatBuilderState createState() => _CatBuilderState();
}

class _CatBuilderState extends State<CatBuilder> {
  List<String>? facts = [];
  MainController mainController = MainController();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    List<String>? list = await mainController.fetchCats();
    setState(() => facts = list);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: facts?.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text('Fact ${index + 1}'),
          children: [
            ListTile(
              title: Text(facts?[index] ?? "Nothing found"),
            ),
          ],
        );
      },
    );
  }
}
