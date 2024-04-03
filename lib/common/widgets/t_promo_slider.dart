import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velik/common/widgets/t_circular_container.dart';
import 'package:velik/common/widgets/t_rounded_image.dart';
import 'package:velik/features/controllers/home_controller.dart';
import 'package:velik/utils/constants/colors.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

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
                  options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, _) =>
                          controller.updatePageIndicator(index)),
                  items: const [
                    TRoundedImage(imageUrl: "assets/images/gallery1.png"),
                    TRoundedImage(imageUrl: "assets/images/gallery2.png"),
                    TRoundedImage(imageUrl: "assets/images/gallery3.png"),
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
