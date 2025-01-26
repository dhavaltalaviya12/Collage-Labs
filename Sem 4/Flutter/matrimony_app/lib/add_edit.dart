import 'package:flutter/material.dart';
import 'package:matrimony_app/string_const.dart';

class AddEditScreen extends StatefulWidget {
  Map<String, dynamic>? user;

  AddEditScreen({super.key, Map<String, dynamic>? user}) {
    this.user = user;
  }


  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _Key = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String _gender = 'Male';
  String _city = 'Rajkot';
  String dob = 'Select DOB';
  DateTime? date = DateTime.now();
  bool isReading = false;
  bool isMusic = false;
  bool isTravelling = false;


  int findIndex(List<String> cities, selectedCity) {
    for (int i = 0; i < cities.length; i++) {
      if (selectedCity.toString().toLowerCase() ==
          cities[i].toString().toLowerCase()) {
        return i;
      }
    }
    return 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.user!=null) {
      nameController.text = widget.user?['name'];
      addressController.text = widget.user?['address'];
      emailController.text = widget.user?['email'];
      mobileController.text = widget.user?['phone'];
      cityController.text = widget.user?['city'];
      passwordController.text = widget.user?['password'];
      confirmPasswordController.text = widget.user?['confirmpassword'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _Key,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Enter Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                      labelText: 'Enter Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Enter Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: mobileController,
                  decoration: InputDecoration(
                      labelText: 'Enter Phone Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'Enter Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      labelText: 'Enter Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Confirm Password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  value: _city,
                  onChanged: (String? newValue) {
                    setState(() {
                      _city = newValue!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'City'),
                  items: <String>['Ahmedabad', 'Surat', 'Rajkot', 'Vadodara','Jamnagar']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your City';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  value: _gender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _gender = newValue!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Gender'),
                  items: <String>['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Date of Birth :    "),
                    InkWell(
                      child: Text(
                        dob,
                        style: TextStyle(fontSize: 15,),
                      ),
                      onTap: () async {
                        date = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1945),
                          lastDate: DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                          ),
                        );
                        dob = "${date!.day}-${date!.month}-${date!.year}";
                        setState(() {});
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Hobbies :"),
                  ],
                ),
                CheckboxListTile(
                  title: Text('Reading'),
                  value: isReading,
                  onChanged: (value) {
                    setState(() {
                      isReading = !isReading;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Music'),
                  value: isMusic,
                  onChanged: (value) {
                    setState(() {
                      isMusic = !isMusic;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Travelling'),
                  value: isTravelling,
                  onChanged: (value) {
                    setState(() {
                      isTravelling = !isTravelling;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_Key.currentState?.validate() ?? false) {
                      // Gather form data into a Map
                      Map<String, dynamic> user = {
                        'Name': nameController.text,
                        'Address': addressController.text,
                        'Email': emailController.text,
                        'Phone': mobileController.text,
                        'City': _city,
                        'Password': passwordController.text,
                        'ConfirmPassword': confirmPasswordController.text,
                      };
        
                      // Send the data back to the UserListPage
                      Navigator.pop(context, user);
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
