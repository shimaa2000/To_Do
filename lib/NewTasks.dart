// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:to_do_list/Porvider_checkbox.dart';

import 'main.dart';
String text1='';
String text2='';
String text3='';
String text4='';
class NewTasks extends StatelessWidget {
  NewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var change=Provider.of<Provider_chackbox>(context);
    return Column(
      children: [
        Row(
          children: [
            Checkbox(value: change.value[0], onChanged:(val)=> {

              change.change1(0),
            },),
            Text(' $text1'),
          ],
        ),
        Row(

          children: [

            Checkbox(value:change.value[1] , onChanged:(val)=>change.change1(1),),
            Text(' $text2'),
          ],
        ),
        Row(
          children: [
            Checkbox(value: change.value[2], onChanged:(_)=>change.change1(2),),
            Text(' $text3'),
          ],
        ),
        Row(
          children: [
            Checkbox(value: change.value[3], onChanged:(_)=>change.change1(3),),
            Text('$text4'),
          ],
        ),
      ],
    );
  }
}
//
