import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("О приложении"),
        titleSpacing: 0,
         leading: IconButton(
    icon: Transform.scale(
      scale: 1, // Масштаб иконки
      child: SvgPicture.asset('assets/svg/arrow_back.svg'),
    ),
    onPressed: () {
      Navigator.of(context).pop(); // Возвращаемся на предыдущую страницу
    },
 ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text("Это приложение разработано студентом группы МОАИС-О-21/1 Лисейкиной Анастасией на курсе по мобильной разработке с помощью фреймворка Flutter",
        textAlign: TextAlign.center, ),
      ),
    ); }
}