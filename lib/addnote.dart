import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todos"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: 'title',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
                ref
                    .push()
                    .set(
                      title.text,
                    )
                    .asStream();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
              child: const Text(
                "save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
