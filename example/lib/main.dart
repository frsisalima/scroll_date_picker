import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _selectedDate = DateTime.now();

  DatePickerScrollViewOptions datePickerScrollViewOptions = DatePickerScrollViewOptions.all(
    ScrollViewDetailOptions(
        margin: EdgeInsets.all(4),
      textStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 24
      ),
      selectedTextStyle:  TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 24
      )
    )
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Date Picker Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 100.0,
            alignment: Alignment.center,
            child: Text(
              "$_selectedDate",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 48),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime.now();
                });
              },
              child: Text(
                "TODAY",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            height: 160,
            child: ScrollDatePicker(
              selectedDate: _selectedDate,
              locale: Locale('en'),
              scrollViewOptions: datePickerScrollViewOptions,
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  _selectedDate = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
