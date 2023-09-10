import 'package:flutter/material.dart';
import 'package:flutter_application_hack3/Widgets/drawer.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  Homepage({super.key});
  int day = 1;
  String tea = "JAI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(222, 12, 168, 199),
        centerTitle: true,
        title: const Text("MOTHER EARTH"),
      ),
      backgroundColor: const Color.fromARGB(233, 254, 254, 254),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(2, 20, 2, 0),
        child: Text(
          "The major Problems in the world are the result of difference between how the nature works and the way people",
          style: TextStyle(
              color: Color.fromARGB(255, 186, 176, 28),
              fontSize: 30,
              fontFamily: AutofillHints.addressCity,
              fontStyle: FontStyle.italic),
        ),
      ),
      drawer: const MyDrawer(),
    );
    // const Text("For shopping check navigation bar");
  }
}
