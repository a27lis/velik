import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velik/database/bike_db.dart';
import 'package:velik/model/bike.dart';
import 'package:velik/pages/item_page.dart';
import 'package:velik/utils/constants/colors.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
          title: const Text("Избранное"),
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
                child: ListView.builder(
                  shrinkWrap: true,
                  //physics:  const NeverScrollableScrollPhysics(),
                  
                              itemCount: bikes.length,
                              itemBuilder: (context, index) {
                                final bike = bikes[index];
                                return GestureDetector(
                                  onTap: () async {
                                await Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ItemPage(id: bike.id)));
                                setState(() {
                                  fetchBikes();
                                });
                                  },
                                  child: Container(
                                    width: 180,
                                    margin: EdgeInsets.only(bottom: 8),
                                   
                                    decoration: BoxDecoration(
                                            color: TColors.white,
                                            borderRadius: BorderRadius.circular(16)
                                            
                                          ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 52,
                                          padding: const EdgeInsets.all(8),
                                          child: Stack(
                                            children: [                               
                                               //text
                                              Positioned(
                                                top: 5,
                                                left: 0,
                                                width: 260,
                                                child: Text("${bike.brand} ${bike.name}", 
                                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: TColors.textColor, fontFamily: "m_plus"),
                                                textAlign: TextAlign.left,
                                                maxLines: 1,
                                                ),
                                              ),
                                              
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: GestureDetector(
                                              onTap: () async {
                                                await bikeDB.update(id: bike.id, favorite: bike.favorite);
                                                setState(() {
                                                  bike.favorite == 1 ? bike.favorite = 0 : bike.favorite = 1;
                                                });
                                              },
                                              child:  bike.favorite == 1 ? SvgPicture.asset("assets/svg/favorite_blue.svg", width: 25,)
                                            : SvgPicture.asset("assets/svg/favorite.svg", width: 25,),
                                            ),
                                              ),
                                  
                                            ],
                                          ),
                                          
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                      
                            ),
              );
              }
            }),
      );
}
