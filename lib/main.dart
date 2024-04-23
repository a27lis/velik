import 'package:flutter/material.dart';
import 'package:velik/pages/favorite_page.dart';
import 'package:velik/pages/main_page.dart';
import 'package:velik/pages/settings_page.dart';
import 'package:velik/utils/constants/colors.dart';

import 'package:velik/utils/theme/theme.dart';


void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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

  int _selectedIndex = 1;

  final List<Widget> _children = [
    const FavoritePage(),
    const MainPageBody(),
    const SettingsPage(),
    // Добавьте здесь другие экраны
 ];



  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: _children[_selectedIndex],
      
        bottomNavigationBar: BottomNavigationBar(
          
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Избранное"),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size: 26,), label: "Главная"),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Настройки",),
          ],
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: onTabTapped,
          selectedItemColor: TColors.accent,
          backgroundColor: TColors.background,
          unselectedItemColor: TColors.textColor,
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(fontFamily: 'm_plus', fontSize: 14, fontWeight: FontWeight.bold),
        ),
        );
  }
}


