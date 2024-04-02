import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velik/common/widgets/t_rounded_image.dart';
import 'package:velik/database/bike_db.dart';
import 'package:velik/model/bike.dart';
import 'package:velik/pages/about_page.dart';
import 'package:velik/utils/constants/colors.dart';
import 'package:velik/utils/theme/custom_themes/text_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<List<Bike>>? futureBikes;
  final bikeDB = BikeDB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBikes();
  }

  void fetchBikes() {
    setState(() {
      futureBikes = bikeDB.fetchFavorite();
    });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
          
          titleSpacing: 24,
          title: Text("Настройки"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0, left: 24, top: 16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: TColors.white,
                    ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Очистить избранное"),
                      Icon(Icons.delete_forever_outlined, size: 30,)
                    ],
                  ),
                  ),

                  SizedBox(height: 12,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const AboutPage()));
                    },
                    child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    color: TColors.white,
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("О приложении"),
                        SvgPicture.asset('assets/svg/logo.svg', width: 30,),
                      ],
                    ),
                    ),
                  ),
                ],
            ),
          )
        )
      );
}
