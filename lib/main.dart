// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Archived.dart';
import 'package:to_do_list/NewTasks.dart';
import 'package:to_do_list/NewTasks.dart';
import 'package:to_do_list/Porvider_checkbox.dart';

import 'DoneTasks.dart';

void main() {
  runApp( ChangeNotifierProvider <Provider_chackbox>(
    create: (_)=>Provider_chackbox(),
    child: MaterialApp(
        home: MyApp(),
      ),
  ),
  );
}
int item = 0;
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

List bodyScreen = [NewTasks(), DoneTasks(), Archived()];
List<String> appBar_name = ['New Tasks', 'Done Tasks', 'Archive Tasks'];

int d=0;
final _formKey = GlobalKey<FormState>();
var controller=TextEditingController();
String text='';
List reminders=['','','',''];
int i=0;
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var change=Provider.of<Provider_chackbox>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('${appBar_name[item]}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => {
          showDialog(
              context: context,
              builder: (_) => Form(
                key: _formKey,
                child: AlertDialog(
                      title: Text('Add Reminder'),
                      content: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your reminder',
                          labelText: 'Reminder',
                        ),
                        controller: controller,
                      ),
                      actions: [
                        FlatButton(
                          onPressed: () => {if(_formKey.currentState!.validate()){
                            text =controller.text,
                            Navigator.of(context).pop(),
                            reminders.insert(i++,controller.text ),
                            change.change_text(i),
                          }
                          },
                          child: Text('Ok',style: TextStyle(
                            color: Colors.lightBlue,
                          ),),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                        ),
                        FlatButton(
                          onPressed: () => {Navigator.of(context).pop()},
                          child: Text('Cancel',style: TextStyle(
                            color: Colors.lightBlue,
                          ),),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),

                          ),
                        ),
                      ],
                    ),
              ))
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined), label: 'New Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.domain_verification), label: 'Done Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive), label: 'Archived Tasks'),
        ],
        onTap: (index) => {
          change.change_item(index),
          d=item
        },
        enableFeedback: false,
        currentIndex: d,

      ),
      body: bodyScreen[d],

    );
  }
}
