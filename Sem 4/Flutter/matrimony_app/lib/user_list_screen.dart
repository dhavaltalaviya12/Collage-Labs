import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_app/add_edit.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<Map<String, dynamic>> userList = [];
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _listView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToForm(null),
        child: Icon(Icons.add),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        'User List',
        style: TextStyle(
            color: Colors.white, fontSize: 30),
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (_, index) => _card(index),
    );
  }

  Widget _card(int index) {
    final user = userList[index];
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardHeader(index),
            _cardInfo(user['address'], Colors.blue),
            _cardInfo(user['city'], Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _cardHeader(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(userList[index]['name'],
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold))),
        IconButton(
            onPressed: () => _navigateToForm(index), icon: Icon(Icons.edit)),
        IconButton(
            onPressed: () => _confirmDelete(index), icon: Icon(Icons.delete))
      ],
    );
  }

  Widget _cardInfo(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }

  _navigateToForm(int? index) async {
    final user = index != null ? userList[index] : null;
    final updateUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddEditScreen(
          user: user,
        ),
      ),
    );
    print(updateUser);
    if (updateUser != null) {
      if (index != null) {
        userList[index] = updateUser;
      } else {
        userList.add(updateUser);
      }
      setState(() {});
    }
  }

  _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Are you sure you want to delete'),
        actions: [
          TextButton(
            onPressed: () => _deleteUser(index),
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          )
        ],
      ),
    );
  }

  _deleteUser(int index) {
    userList.removeAt(index);
    Navigator.pop(context);
    setState(() {});
  }
}