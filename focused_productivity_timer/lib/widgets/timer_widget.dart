import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _duration = 1500; // 25 minutes
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _duration),
    );
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _controller.forward();
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
    });
    _controller.stop();
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Text(
              '${(_duration - _controller.value * _duration) ~/ 60}:${(_duration - _controller.value * _duration) % 60}',
              style: TextStyle(fontSize: 48),
            );
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isRunning ? null : _startTimer,
              child: Text('Start'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: _isRunning ? _pauseTimer : null,
              child: Text('Pause'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: _resetTimer,
              child: Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
