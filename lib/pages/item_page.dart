import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velik/common/widgets/t_promo_slider.dart';
import 'package:velik/common/widgets/t_rounded_image.dart';
import 'package:velik/database/bike_db.dart';
import 'package:velik/model/bike.dart';
import 'package:velik/utils/constants/colors.dart';


class ItemPage extends StatefulWidget {
  final int id;
  const ItemPage({super.key, required this.id});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {

  Future<List<Bike>>? futureBikes;
  final bikeDB = BikeDB();

  @override
  void initState() {
    super.initState();
    fetchBike();
  }

  void fetchBike() {
    setState(() {
      futureBikes = bikeDB.fetchBike(id: widget.id);
      
    });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    extendBodyBehindAppBar: true,
    
    appBar: AppBar(
          titleSpacing: 0,

          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Цвет статусной строки
      statusBarIconBrightness: Brightness.dark,
      ),
        ),
        
        body: FutureBuilder<List<Bike>>(
            future: futureBikes,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final bikes = snapshot.data!;
                final bike = bikes[0];

                return bikes.isEmpty
                    ? const Center(
                        child: Text('Нет велосипедов'),
                      )
                    : 
                    Stack(
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/svg/ellipse.png'),
                              alignment: Alignment.topLeft,                             
                            ),
                          ),
                          child: SafeArea(
                            child: SingleChildScrollView(
                              child: Stack(
                                children: [
                                 
                                 Positioned(
                                              top: 0,
                                              left: 20,
                                              width: 800,
                                              child: Text("${bike.brand} ${bike.name}", 
                                              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w100, color: TColors.textColor, fontFamily: "m_plus_extra"),
                                              textAlign: TextAlign.left,
                                              maxLines: 1,
                                              ),
                                            ),
                                            Positioned(
                                              top: 32,
                                              left: 20,
                                              
                                              child: Text(bike.type, 
                                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w100, color: TColors.textColorLight, fontFamily: "m_plus"),
                                              textAlign: TextAlign.left,),
                                            ),
                                            Positioned(
                                              top: 3,
                                              right: 20,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  await bikeDB.update(id: bike.id, favorite: bike.favorite);
                                                  setState(() {
                                                    bike.favorite == 1 ? bike.favorite = 0 : bike.favorite = 1;
                                                  });
                                                },
                                                child:  bike.favorite == 1 ? SvgPicture.asset("assets/svg/favorite_blue.svg", width: 35,)
                                              : SvgPicture.asset("assets/svg/favorite.svg", width: 35,),
                                              )
                                            ),
                                            
                                            Padding(
                                              padding: const EdgeInsets.only(top: 100),
                                              child: TPromoSlider(imageUrl1: bike.picture,
                                               imageUrl2: bike.picture2, imageUrl3: bike.picture3),
                                            ),
                                            Padding(padding: 
                                            const EdgeInsets.only(top: 370, left: 20, right: 20, bottom: 20),
                                            child: SingleChildScrollView(
                                              
                                                scrollDirection: Axis.vertical,
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    
                                          color: TColors.white,
                                          borderRadius: BorderRadius.circular(8)
                                          
                                        ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(24),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      
                                                      children: [
                                                      Text("Рама", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100, color: TColors.textColorLight), ),
                                                      Text(bike.frame, style: TextStyle(fontWeight: FontWeight.w900),),
                                                      SizedBox(height: 14,),
                                                                                  
                                                      Text("Вилка", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100, color: TColors.textColorLight), ),
                                                      Text(bike.fork, style: TextStyle(fontWeight: FontWeight.w900),),
                                                      SizedBox(height: 14,),
                                                                                  
                                                      Text("Количество скоростей", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100, color: TColors.textColorLight), ),
                                                      Text(bike.speed.toString(), style: TextStyle(fontWeight: FontWeight.w900),),
                                                      SizedBox(height: 14,),
                                                                                  
                                                      Text("Покрышки", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100, color: TColors.textColorLight), ),
                                                      Text(bike.tires, style: TextStyle(fontWeight: FontWeight.w900),),
                                                      SizedBox(height: 14,),
                                                                                  
                                                      Text("Тип тормозов", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100, color: TColors.textColorLight), ),
                                                      Text(bike.brake, style: TextStyle(fontWeight: FontWeight.w900),),
                                                      SizedBox(height: 14,),
                                                                                  
                                                      Text("Размер колес в дюймах", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100, color: TColors.textColorLight), ),
                                                      Text(bike.sizeOfWheels, style: TextStyle(fontWeight: FontWeight.w900),),
                                                      SizedBox(height: 14,),
                                                                                  
                                                      Text("Уровень оборудования", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100, color: TColors.textColorLight), ),
                                                      Text(bike.equipment, style: TextStyle(fontWeight: FontWeight.w900),),
                                                    ],),
                                                  ),
                                                )
                                            ),
                              
                                            )
                                    
                                 
                                ],
                              ),
                            ),
                          ),                
                        
                                        
                                      ),
                      ],
                    );
              }
            }),
      );
}
