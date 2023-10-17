import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  TextEditingController controller = TextEditingController();
  AutoSizeGroup autoSizeGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Auto Size Text"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: controller,
                maxLines: 5,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              Card(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: AutoSizeText(
                    controller.text,
                    maxLines: 3,
                    minFontSize: 20,
                    group: autoSizeGroup,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
