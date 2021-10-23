import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<String> handleliste=<String>[];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _textController= TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _textController.dispose();
    super.dispose();
  }

  void _submit(){
    setState(() {
      handleliste.add(_textController.text);
    });
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
            HandleListWidget(),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Handlevare'),
                    onSubmitted: (value)=>_submit(),
                  ),
                ),
                TextButton(
                  onPressed: ()=>_submit(),
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


//HandleItemWidget

class HandleItemWidget extends StatefulWidget {
  String text;

  HandleItemWidget({Key? key,required this.text}):super (key:key);

  @override
  State<StatefulWidget> createState() {
    return HandleItemWidgetState(text);
  }
}

class HandleItemWidgetState extends State<HandleItemWidget> {
  String text;

  HandleItemWidgetState(this.text);

  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(text),
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


//HandleListWidget

class HandleListWidget extends StatefulWidget {
  const HandleListWidget({ Key? key }) : super(key: key);

  @override
  _HandleListWidgetState createState() => _HandleListWidgetState();
}

class _HandleListWidgetState extends State<HandleListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: handleliste.map((handleitem) => HandleItemWidget(text: handleitem)).toList()
    );
  }
}