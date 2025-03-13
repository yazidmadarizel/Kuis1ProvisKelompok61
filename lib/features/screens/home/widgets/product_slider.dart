import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_1/features/controllers/home_controller.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/image/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Center(
          child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    TCircularContainer(
                      width: 20,
                      margin: const EdgeInsets.only(right: 10),
                      height: 4,
                      backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                    ),

                ],
              )),
        )


      ],
    );
  }
}

