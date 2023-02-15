import 'dart:async';

import 'package:flutter/material.dart';

class ClockField extends StatefulWidget {
  const ClockField({super.key});

  @override
  State<ClockField> createState() => _ClockFieldState();
}

class _ClockFieldState extends State<ClockField> {
  @override
  void initState() {
    super.initState();

    // set state every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //seconds
    return Container(
      padding: EdgeInsets.only(
        bottom: 1,
        right: 1,
        left: 8,
      ),
      alignment: Alignment.centerRight,
      child: Text(
        (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 175, 175, 175),
        ),
      ),
    );
  }
}
