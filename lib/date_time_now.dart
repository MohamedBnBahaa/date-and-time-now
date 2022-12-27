import 'package:flutter/material.dart';
import "dart:async";
import 'package:intl/intl.dart';

class DateTimeNow extends StatefulWidget {
  const DateTimeNow({Key? key}) : super(key: key);

  @override
  State<DateTimeNow> createState() => _DateTimeNowState();
}

class _DateTimeNowState extends State<DateTimeNow> {

  String weekday = "";
  String date = "";
  String timeNow = "";

  changeEverySec() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        weekday = DateFormat("EEEE").format(DateTime.now());
        date = DateFormat("MMMM d, y").format(DateTime.now());
        timeNow = DateFormat('hh : mm : ss a').format(DateTime.now());
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Date & Time Now",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 57, 73, 80),
      ),
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $weekday   ",
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              timeNow,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
