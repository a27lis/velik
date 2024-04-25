import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velik/database/bike_db.dart';
import 'package:velik/model/bike.dart';
import 'package:velik/utils/constants/colors.dart';


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
          title: const Text("Настройки"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0, left: 24, top: 16),
            child: Column(
              children: [
                
                  GestureDetector(
                    onTap: () {
                      showDialog(
                      context: context, 
                      builder: (_) {
                        return AlertDialog(
                         
                          backgroundColor: TColors.white,
                          content: const Text("Очистить избранное?",
                          style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                          actions: <Widget>[
                            TextButton(onPressed: () {Navigator.of(context).pop();},
                            
                             style: TextButton.styleFrom(
                                   minimumSize: Size.zero,
                                    padding:const EdgeInsets.only(right: 20),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                            
                             child: const Text('Нет', style: TextStyle(color: TColors.textColor, fontSize: 18, fontWeight: FontWeight.normal),),),
                             TextButton(onPressed: () async {
                               await bikeDB.undoFavorite();
                               Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                   minimumSize: Size.zero,
                                   padding: const EdgeInsets.only(right: 5),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                            
                             child: const Text('Да', style: TextStyle(color: TColors.textColor, fontSize: 18, fontWeight: FontWeight.normal))),
                          ],

                        );
                      });
                    },
                    child: Container(
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
                  ),
                

                  const SizedBox(height: 12,),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                      context: context, 
                      builder: (_) {
                        return const AlertDialog(
                            backgroundColor: TColors.white,
                          content: Text("Это приложение разработано студентом группы МОАИС-О-21/1 Лисейкиной Анастасией на курсе по мобильной разработке с помощью фреймворка Flutter",
                          style: TextStyle(), textAlign: TextAlign.center,),

                        );
                      });
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
