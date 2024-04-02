import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velik/common/widgets/t_promo_slider.dart';
import 'package:velik/common/widgets/t_rounded_image.dart';
import 'package:velik/database/bike_db.dart';
import 'package:velik/model/bike.dart';
import 'package:velik/pages/bikes_page.dart';
import 'package:velik/utils/constants/colors.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({
    super.key,
  });


  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  Future<List<Bike>>? futureBikes;
  final bikeDB = BikeDB();

   @override
  void initState() {
    super.initState();
    fetchBikes();
    
  }
  void fetchBikes() {
    setState(() {
      futureBikes = bikeDB.fetchAll();
      
    });
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
          title: Text("VELIK"),
        ),

    body: FutureBuilder(
                  future: futureBikes,
                 builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: TColors.textColor));
                } else {
                  final bikes = snapshot.data!;
                  return bikes.isEmpty
                      ? const Center(
                          child: Text('Нет велосипедов'),
                        )
                      : SingleChildScrollView(
      child: Column(
        children: [
          const TPromoSlider(),
          Padding(
            padding: const EdgeInsets.only(right: 27, top: 40),
            child: 
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const BikesPage()));
              },
              child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Посмотреть все', style: TextStyle(fontSize: 16, color: TColors.textColor)), // Текст
                const SizedBox(width: 10), // Отступ между иконкой и текстом
                SvgPicture.asset('assets/svg/arrow_right.svg'), // Иконка
                  ],
            ),
            )
            
            
            
          ),
    
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: GridView.builder(
              shrinkWrap: true,
              physics:  const NeverScrollableScrollPhysics(),
              
                          itemCount: bikes.length >= 4 ? 4 : bikes.length,
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
          ),
        ],
      ),
    );
    
                }
                 
                            })
  
   ); 
  }
}