import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void _submit(){

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Handlelista'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HandleItem(),
            Row(
              children: [
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Legg til'),
                    //onSubmitted: _submit(value),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HandleItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HandleItemState();
  }
}

class HandleItemState extends State<HandleItem> {
  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('400g Kjøttdeig'),
      value: _checked,
      onChanged: (bool? value) {
        setState(() {
          _checked = value;
        });
      },
      activeColor: Colors.green,
    );
  }
}
