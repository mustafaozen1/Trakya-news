import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:trakya_news/constant/color_constant.dart';
import 'package:trakya_news/helper/toast_helper.dart';
import 'package:trakya_news/notifications/viewmodel/notification_viewmodel.dart';

import 'notifications.dart';

NotificationsViewModel notificationVM = NotificationsViewModel();
DateTime scheduleTime = DateTime.now();
List categoryList = [
  "Son Dakika",
  "Ekonomi",
  "Magazin",
  "Spor",
  "Dünya",
  "Turizm"
];
List selectedCategories = [];

class ScheduleNotificationView extends StatefulWidget {
  ScheduleNotificationView({super.key, required this.title});

  final String title;

  @override
  State<ScheduleNotificationView> createState() =>
      _ScheduleNotificationViewState();
}

class _ScheduleNotificationViewState extends State<ScheduleNotificationView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstant.blackForGrad,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 240, 240),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Bildirim Ekle",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            // decoration: BoxDecoration(border: Border.all()),
                            width: screenWidth,
                            child: _CategotyPicker()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          // decoration: BoxDecoration(color: Colors.amberAccent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: screenWidth * 0.86,
                                  child: DatePickerTxt()),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          // height: 40,
                          width: screenWidth * 0.87,
                          child: ScheduleBtn()),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: screenHeight * 0.5,
                  child: FutureBuilder(
                    future: notificationVM.getAlarms(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.length < 1) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Kayıtlı Bildiriminiz Bulunmamaktadır.",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ListTile(
                                        leading: const Icon(
                                          Icons.notifications,
                                          color: Color.fromARGB(255, 6, 6, 6),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            confirmWindow(
                                                context,
                                                snapshot.data[index][2]
                                                    .toString(),
                                                snapshot.data[index][3]
                                                    .toString());
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color:
                                                Color.fromARGB(255, 204, 18, 4),
                                          ),
                                        ),
                                        subtitle: Text(
                                            snapshot.data[index][2].toString()),
                                        title: Text(snapshot.data[index][3]
                                            .toString()
                                            .toUpperCase())),
                                  ),
                                );
                              });
                        }
                      } else {
                        return Text(
                          "LOADING",
                          textAlign: TextAlign.center,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> confirmWindow(BuildContext context, date, type) {
    return showDialog<void>(
      // barrierColor: ColorConstant.whiteForGrad,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('TRAKYA NEWS'),
          content: const Text('Bildirimi Kaldırmak İstediğinize Emin Misinz?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Evet',
                style: TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
              ),
              onPressed: () {
                notificationVM
                    .deleteAlarms(date: date, type: type)
                    .then((value) {
                  setState(() {});
                  Navigator.pop(context);
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Hayır',
                  style: TextStyle(color: Color.fromARGB(255, 9, 9, 9))),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  MultiSelectDialogField<dynamic> _CategotyPicker() {
    return MultiSelectDialogField(
      checkColor: Colors.yellow,
      decoration: BoxDecoration(color: Colors.amberAccent),
      // selectedColor: Colors.blueAccent,

      // barrierColor: Colors.yellow.,
      buttonIcon: Icon(Icons.notifications),
      buttonText: Text(
        "   Kategori Seçiniz",
        style: TextStyle(fontSize: 20),
      ),
      items: categoryList.map((e) => MultiSelectItem(e, e)).toList(),
      listType: MultiSelectListType.CHIP,
      onConfirm: (values) {
        selectedCategories = values;
      },
    );
  }
}

class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({
    Key? key,
  }) : super(key: key);

  @override
  State<DatePickerTxt> createState() => _DatePickerTxtState();
}

class _DatePickerTxtState extends State<DatePickerTxt> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(backgroundColor: Colors.amberAccent
          // side: BorderSide(width: .0),
          ),
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onChanged: (date) {
            setState(() {
              scheduleTime = date;
            });
          },
          onConfirm: (date) {},
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tarih Seçiniz ",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 9, 9, 9)),
              ),
              Text(
                scheduleTime.toString().substring(0, 16),
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 9, 9, 9)),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class ScheduleBtn extends StatefulWidget {
  const ScheduleBtn({
    Key? key,
  }) : super(key: key);

  @override
  State<ScheduleBtn> createState() => _ScheduleBtnState();
}

class _ScheduleBtnState extends State<ScheduleBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.black),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: const Text(
          'Bildirim Ekle',
          style: TextStyle(fontSize: 24),
        ),
      ),
      onPressed: () {
        debugPrint('Notification Scheduled for $scheduleTime');
        NotificationService().scheduleNotification(
            title: 'Haberleriniz Hazır!',
            body: 'En güncel ${selectedCategories.join(', ')} haberleri hazır!',
            scheduledNotificationDateTime: scheduleTime);
        String formattedDate =
            DateFormat('yyyy-MM-dd HH:mm').format(scheduleTime);
        for (var selectedCategory in selectedCategories) {
          notificationVM
              .postAlarm(
                  date: formattedDate,
                  type: selectedCategory.toString().toLowerCase())
              .then((value) {
            setState(() {});
            if (value.statusCode == 200) {
              ToastHelper.getTrueToast(value.body.toString());
            } else {
              ToastHelper.getFalseToast(value.body.toString());
            }
          });
        }
      },
    );
  }
}
