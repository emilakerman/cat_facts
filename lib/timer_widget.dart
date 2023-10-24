import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.facts});

  final List<String> facts;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final int _start = 9;
  int _current = 9;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: _start),
      Duration(seconds: 1),
    );

    var streamSubscription = countDownTimer.listen(null);
    streamSubscription.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    streamSubscription.onDone(() {
      streamSubscription.cancel();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$_current'),
          Text(widget.facts[_current]),
        ],
      ),
    );
  }
}
