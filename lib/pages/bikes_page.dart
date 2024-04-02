import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velik/common/widgets/t_rounded_image.dart';
import 'package:velik/database/bike_db.dart';
import 'package:velik/model/bike.dart';
import 'package:velik/utils/constants/colors.dart';
import 'package:velik/utils/theme/custom_themes/text_theme.dart';

class BikesPage extends StatefulWidget {
  const BikesPage({super.key});

  @override
  State<BikesPage> createState() => _BikesPageState();
}

class _BikesPageState extends State<BikesPage> {
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
      futureBikes = bikeDB.fetchAll();
    });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
    icon: Transform.scale(
      scale: 1, // Масштаб иконки
      child: SvgPicture.asset('assets/svg/arrow_back.svg'),
    ),
    onPressed: () {
      Navigator.of(context).pop(); // Возвращаемся на предыдущую страницу
    },
 ),
 automaticallyImplyLeading: false, // Отключаем автоматическое добавление иконки "назад"
          
          title: const Text('Все велосипеды',
          style: TextStyle(fontFamily: 'm_plus', fontWeight: FontWeight.bold),
          ),
          
        ),
        body: FutureBuilder<List<Bike>>(
            future: futureBikes,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final bikes = snapshot.data!;

                return bikes.isEmpty
                    ? const Center(
                        child: Text('Нет велосипедов'),
                      )
                    : Padding(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: GridView.builder(
                  shrinkWrap: true,
                  //physics:  const NeverScrollableScrollPhysics(),
                  
                              itemCount: bikes.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemBuilder: (context, index) {
                                final bike = bikes[index];
                                return Container(
                                  width: 180,
                                 
                                  decoration: BoxDecoration(
                                          color: TColors.white,
                                          borderRadius: BorderRadius.circular(16)
                                          
                                        ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 160,
                                        padding: const EdgeInsets.all(8),
                                        child: Stack(
                                          children: [
                                            //image

                                            Center(

                                              child: TRoundedImage(imageUrl: bike.picture, backgroundColor: TColors.white, padding: EdgeInsets.only(top: 34),),
                                            ),
                                            
                                            //text
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              width: 120,
                                              child: Text("${bike.brand} ${bike.name}", 
                                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w100, color: TColors.textColor, fontFamily: "m_plus_extra"),
                                              textAlign: TextAlign.left,
                                              maxLines: 1,
                                              ),
                                            ),
                                            Positioned(
                                              top: 16,
                                              left: 0,
                                              
                                              child: Text(bike.type, 
                                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100, color: TColors.textColorLight, fontFamily: "m_plus"),
                                              textAlign: TextAlign.left,),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: bike.favorite == 1 ? SvgPicture.asset("assets/svg/favorite_blue.svg", width: 25,) : SvgPicture.asset("assets/svg/favorite.svg", width: 25,),
                                            ),

                                          ],
                                        ),
                                        
                                      )
                                    ],
                                  ),
                                );
                              },
                      
                            ),
              );
              }
            }),
      );
}
