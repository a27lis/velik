import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velik/utils/constants/colors.dart';
import 'package:velik/utils/theme/theme.dart';

void main() {
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ),
      body: Center(
        child: Text(
          'Проверка шрифта',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
