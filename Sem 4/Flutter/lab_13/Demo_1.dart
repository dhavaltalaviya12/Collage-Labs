import 'package:flutter/material.dart';
import 'package:lab_6/lab_13/Home_navbar.dart';
import 'package:lab_6/lab_13/call_navbar.dart';
import 'package:lab_6/lab_13/fav_navbar.dart';
import 'package:lab_6/lab_6/part_9.dart';

import '../lab_6/horizontal_space.dart';
import '../lab_6/part_9_size.dart';

class Demo10 extends StatefulWidget {
  const Demo10({super.key});

  @override
  State<Demo10> createState() => _Demo10State();
}

class _Demo10State extends State<Demo10> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [HomeNavbar(), FavNavbar(), CallNavbar()];
    return Scaffold(
      body: list[id],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: id,
          onTap: (value) {
            setState(() {
              id = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Colors.blue,),
                label: "Home",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,color: Colors.red,),
                label: "Favorite",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.call,color: Colors.green,),
                label: "Calls",
                backgroundColor: Colors.green)
          ]),
    );
  }
}
