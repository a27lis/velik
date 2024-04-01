import 'package:flutter/material.dart';
import 'package:velik/database/bike_db.dart';
import 'package:velik/model/bike.dart';

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




  // return Column(
  //                           children: [
  //                             Container(
  //                               width: 151,
  //                               height: 100,
  //                               child: Stack(
  //                                 children: [
  //                                   Positioned(
  //                                     left: 0,
  //                                     top: 0,
  //                                     child: Container(
  //                                       width: 151,
  //                                       height: 100,
  //                                       decoration: ShapeDecoration(
  //                                         color: Colors.white,
  //                                         shape: RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(16),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   Positioned(
  //                                     left: 41,
  //                                     top: 36,
  //                                     child: Container(
  //                                       width: 70,
  //                                       height: 49,
  //                                       decoration: BoxDecoration(
  //                                         image: DecorationImage(
  //                                           image: AssetImage(
  //                                               bike.picture),
  //                                           fit: BoxFit.fill,
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   Positioned(
  //                                     left: 14,
  //                                     top: 8,
  //                                     child: Text(
  //                                       bike.brand + " " +bike.name,
  //                                       style: TextStyle(
  //                                         color: Color(0xFF2A344D),
  //                                         fontSize: 14,
  //                                         fontFamily: 'Rounded Mplus 1c',
  //                                         fontWeight: FontWeight.w900,
  //                                         height: 0,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   Positioned(
  //                                     left: 14,
  //                                     top: 23,
  //                                     child: Text(
  //                                       bike.type,
  //                                       style: TextStyle(
  //                                         color: Color(0xFFB5B5B5),
  //                                         fontSize: 10,
  //                                         fontFamily: 'Rounded Mplus 1c',
  //                                         fontWeight: FontWeight.w500,
  //                                         height: 0,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   Positioned(
  //                                     left: 131,
  //                                     top: 10,
  //                                     child: Container(
  //                                       width: 12,
  //                                       height: 12,
  //                                       child: Stack(
  //                                         children: [
  //                                           Positioned(
  //                                             left: 0,
  //                                             top: 0,
  //                                             child: Container(
  //                                               width: 12,
  //                                               height: 12,
  //                                               child: Stack(
  //                                                 children: [
  //                                                   Positioned(
  //                                                     left: 0,
  //                                                     top: 0,
  //                                                     child: 
  //                                                     bike.favorite == 1 ? 
  //                                                     SvgPicture.asset("assets/svg/favorite_blue.svg" ,
  //                                                     width: 12,
  //                                                     height: 12,) : SvgPicture.asset("assets/svg/favorite.svg", height: 12, width: 12)
  //                                                   )  , 
  //                                                 ],
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ],
  //                         );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('bikes'),
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
                        child: Text('no bikes'),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: bikes.length,
                        itemBuilder: (context, index) {
                          final bike = bikes[index];
                          return Column(
                            children: [
                              Container(
                                width: 151,
                                height: 93,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 151,
                                        height: 93,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 41,
                                      top: 36,
                                      child: Container(
                                        width: 70,
                                        height: 49,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                bike.picture),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 14,
                                      top: 8,
                                      child: Text(
                                        bike.brand + bike.name,
                                        style: TextStyle(
                                          color: Color(0xFF2A344D),
                                          fontSize: 10,
                                          fontFamily: 'Rounded Mplus 1c',
                                          fontWeight: FontWeight.w900,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 14,
                                      top: 23,
                                      child: Text(
                                        'Ригид',
                                        style: TextStyle(
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 6,
                                          fontFamily: 'Rounded Mplus 1c',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 131,
                                      top: 10,
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 12,
                                                height: 12,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 0,
                                                      top: 0,
                                                      child: Container(
                                                        width: 12,
                                                        height: 12,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color.fromARGB(255, 155, 22, 22)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
              }
            }),
      );
}
