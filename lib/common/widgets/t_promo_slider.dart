import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:velik/common/widgets/t_circular_container.dart';
import 'package:velik/common/widgets/t_rounded_image.dart';
import 'package:velik/features/controllers/home_controller.dart';
import 'package:velik/pages/bikes_page.dart';
import 'package:velik/pages/item_page.dart';
import 'package:velik/utils/constants/colors.dart';

class TPromoSlider extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();
  
  TPromoSlider({
    super.key,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
    

  });
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  

  @override
  Widget build(BuildContext context) {
    
    
    final controller = Get.put(HomeController());
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 24, right: 24),
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, _) =>
                          controller.updatePageIndicator(index),
                          initialPage: 0),
                          
                  items: [
                    GestureDetector(
                      onTap: () {
                        if (imageUrl1 == "assets/images/gallery1.png") {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ItemPage(id: 1)),
                        );
                        } else {}
                      },
                      child: TRoundedImage(imageUrl: imageUrl1, backgroundColor: Colors.transparent,)),
                    GestureDetector(
                      onTap: () {
                        if (imageUrl2 == "assets/images/gallery2.png") {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ItemPage(id: 3)),
                        );
                        } else {}
                      },
                      child: TRoundedImage(imageUrl: imageUrl3, backgroundColor: Colors.transparent,)),
                      GestureDetector(
                      onTap: () {
                        if (imageUrl3 == "assets/images/gallery3.png") {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ItemPage(id: 7)),
                        
                        );
                        } else {}
                      },
                      child: TRoundedImage(imageUrl: imageUrl2, backgroundColor: Colors.transparent,)),
                    
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                  child: Obx(
                    () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < 3; i++)
                          TCircularContainer(
                            width: controller.carousalCurrentIndex.value == i
                                    ? 35
                                    : 10,
                            height: 5,
                            margin: const EdgeInsets.only(right: 3),
                            backgroundColor:
                                controller.carousalCurrentIndex.value == i
                                    ? TColors.textColorLight
                                    : TColors.lightGrey,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
