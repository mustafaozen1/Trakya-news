import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class SettingsView extends StatefulWidget {
  SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  List categoryList = [
    "Son Dakika",
    "Ekonomi",
    "Magazin",
    "Spor",
    "Dünya",
    "Turizm"
  ];
  DateTime now = DateTime.now();
  late DateTime date = DateTime(now.year, now.month, now.day);

  List selectedCategories = [];

  var _time = TimeOfDay.now();
  // selectedTime;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: width,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 222, 221, 221)),
            child: Text(
              "Bildirim Ayarları",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          // MultiSelectDialogField(
          //   checkColor: Colors.yellow,
          //   // barrierColor: Colors.yellow.,
          //   buttonIcon: Icon(Icons.notifications),
          //   buttonText: Text(
          //     "Kategori Seçiniz",
          //     style: TextStyle(fontSize: 20),
          //   ),
          //   items: categoryList.map((e) => MultiSelectItem(e, e)).toList(),
          //   listType: MultiSelectListType.CHIP,
          //   onConfirm: (values) {
          //     selectedCategories = values;
          //   },
          // ),
          Container(
            height: 400,
          ),
        ]));
  }
}

TimeChange(time) {}
