import 'package:flutter/material.dart';
import '../widgets/timer_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Focused Productivity Timer'),
      ),
      body: Center(
        child: TimerWidget(),
      ),
    );
  }
}
