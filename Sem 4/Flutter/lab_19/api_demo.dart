import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class JsonDisplayScreen extends StatefulWidget {
  @override
  _JsonDisplayScreenState createState() => _JsonDisplayScreenState();
}

class _JsonDisplayScreenState extends State<JsonDisplayScreen> {
  List<dynamic> data = [];

  // Function to load JSON data from the asset
  Future<void> loadJsonData() async {
    // Load the JSON from the asset file
    String jsonString = await rootBundle.loadString('assets/api.json');

    // Decode the JSON string into a List of objects
    final List parsedList = json.decode(jsonString);

    setState(() {
      data = parsedList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData(); // Load data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(color: Colors.red,borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),),
            child: Center(
              child: Text(
                "JSON Data!!!",
                style: TextStyle(color: Colors.white,fontSize: 35),
              ),
            ),
          ),backgroundColor: Colors.transparent
        ),
      ),
      body: data.isEmpty
          ? Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator while fetching data
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var item = data[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  item['name'],
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.cake,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Age: ${item['age']}',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      backgroundColor: Colors.black,
    );
  }
}
