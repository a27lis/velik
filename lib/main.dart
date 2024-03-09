import 'package:flutter/material.dart';

import 'package:velik/common/widgets/t_promo_slider.dart';

import 'package:velik/utils/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          leading: Transform.translate(
            offset: const Offset(24, 0),
            child: SvgPicture.asset('assets/svg/logo.svg'),
          ),
          titleSpacing: 32,
          title: const Text("VELIK"),
        ),
        body: const SingleChildScrollView(
          child: TPromoSlider(),
        ));
  }
}
