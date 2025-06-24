import 'package:flutter/material.dart';

import '../lab_8/image.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello World",
              style: TextStyle(fontSize: 100),
            ),
            ElevatedButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (context){
                return image1();
              });
            }, child: Text("Show"))
          ],
        ),
      ),
    );
  }
}
