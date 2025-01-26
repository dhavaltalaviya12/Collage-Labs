import 'package:flutter/material.dart';
import 'package:matrimony_app/add_edit.dart';
import 'package:matrimony_app/user_list_screen.dart';

class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.person_add,
      'label': 'Add User',
      'screen': AddEditScreen(),
    },
    {
      'icon': Icons.list,
      'label': 'User List',
      'screen': UserListScreen(),
    },
    {
      'icon': Icons.favorite,
      'label': 'Favorite User',
      'screen': FavoriteUserScreen(),
    },
    {
      'icon': Icons.info,
      'label': 'About Us',
      'screen': AboutUsScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrimonial',style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item['screen']),
              );
            },
            child: Card(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 50, color: Colors.black),
                    SizedBox(height: 5),
                    Text(
                      item['label'],
                      style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User')),
      body: Center(child: Text('Add User Screen')),
    );
  }
}

// class UserListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('User List')),
//       body: Center(child: Text('User List Screen')),
//     );
//   }
// }

class FavoriteUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite User')),
      body: Center(child: Text('Favorite User Screen')),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us')),
      body: Center(child: Text('About Us Screen')),
    );
  }
}
