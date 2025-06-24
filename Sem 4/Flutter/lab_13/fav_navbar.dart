import 'package:flutter/material.dart';
import 'package:lab_6/lab_10/myForm.dart';

class FavNavbar extends StatelessWidget {
  const FavNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dhaval Talaviya",
              style: TextStyle(fontSize: 100),
            ),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return MyForm();
                      });
                },
                child: Text("Show"))
          ],
        ),
      ),
    );
  }
}
