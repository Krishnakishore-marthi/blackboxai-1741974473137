import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppTheme(),
      child: Consumer<AppTheme>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: 'Focused Productivity Timer',
            theme: theme.currentTheme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
