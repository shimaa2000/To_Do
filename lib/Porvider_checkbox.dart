import 'package:flutter/material.dart';

import 'NewTasks.dart';
import 'main.dart';

class Provider_chackbox with ChangeNotifier{
  List value=[false,false,false,false];
  change1(int i) {
    value[i]=!value[i];
    notifyListeners();

  }
  change_text(int i){
    text1=reminders[0];
    text2=reminders[1];
    text3=reminders[2];
    text4=reminders[3];
    notifyListeners();
  }
  change_item(int index){
    item=index;
    print(item);
  }
}