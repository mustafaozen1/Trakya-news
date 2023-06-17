import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trakya_news/calendar/event.dart';
import 'package:trakya_news/constant/color_constant.dart';

class CalendarView extends StatefulWidget {
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  Map<DateTime, List<Event>> selectedEvents = {};
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String? selectedTime;
  List categoryList = [
    "Son Dakika",
    "Ekonomi",
    "Magazin",
    "Spor",
    "Dünya",
    "Turizm"
  ];
  List selectedCategories = [];

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("Bildirim Takvimim"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              eventLoader: _getEventsfromDay,

              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 80, 162, 224),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 249, 176, 5),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 17, 20, 22),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ..._getEventsfromDay(selectedDay).map(
              (Event event) => ListTile(
                title: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Icon(Icons.newspaper),
                    title: Text(event.title),
                    trailing: Text("23:00"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Bildirim Ekle"),
            content: StatefulBuilder(
              builder: ((context, setState) {
                return Container(
                  height: 300,
                  child: Column(
                    children: [
                      MultiSelectDialogField(
                        checkColor: Colors.yellow,
                        // barrierColor: Colors.yellow.,
                        buttonIcon: Icon(Icons.notifications),
                        buttonText: Text(
                          "Kategori Seçiniz",
                          style: TextStyle(fontSize: 20),
                        ),
                        items: categoryList
                            .map((e) => MultiSelectItem(e, e))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (values) {
                          selectedCategories = values;
                        },
                      ),
                      // TextFormField(
                      //   controller: _eventController,
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                      // Text(
                      //   selectedTime != null ? selectedTime! : 'Saat Seçiniz',
                      //   style: const TextStyle(fontSize: 30),
                      // ),
                      selectedTime != null
                          ? Text(selectedTime!)
                          : ElevatedButton(
                              onPressed: () async {
                                final TimeOfDay? pickedTime =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        builder: (context, childWidget) {
                                          return MediaQuery(
                                              data: MediaQuery.of(context)
                                                  .copyWith(
                                                      alwaysUse24HourFormat:
                                                          true),
                                              child: childWidget!);
                                        });
                                if (pickedTime != null) {
                                  setState(() {
                                    selectedTime = pickedTime.hour < 10
                                        ? "0${pickedTime.hour.toString()}:${pickedTime.minute.toString()}"
                                        : "${pickedTime.hour.toString()}:${pickedTime.minute.toString()}";
                                  });
                                }
                              },
                              child: Text("Saat Seçiniz")),
                    ],
                  ),
                );
              }),
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]!.add(
                        Event(
                            title: _eventController.text, time: DateTime.now()),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(
                            title: _eventController.text, time: DateTime.now())
                      ];
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Bildirim Esskle"),
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        icon: Icon(Icons.add),
      ),
    );
  }
}
