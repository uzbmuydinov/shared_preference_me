import 'package:flutter/material.dart';
import 'package:shared_preference/models/note_model.dart';
import 'package:shared_preference/services/prefs.dart';


class MainPage1 extends StatefulWidget {
  const MainPage1({Key? key}) : super(key: key);

  static const String id = "main_page_1";

  @override
  _MainPage1State createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  TextEditingController controller = TextEditingController();

  Note? note;

  void _storeNote() async {
    String text = controller.text.toString().trim();
    Note note = Note(
      id: text.hashCode,
      createTime: DateTime.now(),
      editTime: DateTime.now(),
      content: text,
      title: 'Flutter B14',
    );
    var result = await Prefs.storeNote(note);
  }

  Future<void> _loadNote() async {
    await Prefs.loadNote().then((value) {
      setState(() {
        note = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextField(
                decoration: InputDecoration(),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  _storeNote();
                });
              },
              child: Text("store"),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  _loadNote();
                });
              },
              child: Text("load"),
            )
          ]),
    );
  }
}