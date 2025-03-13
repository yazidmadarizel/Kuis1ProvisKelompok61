import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quiz_1/features/screens/home/widgets/home_appbar.dart';
import 'package:quiz_1/features/screens/home/widgets/home_categories.dart';
import 'package:quiz_1/features/screens/home/widgets/product_slider.dart';
import 'package:quiz_1/navigation_menu.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/product/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              height: 400,
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  SearchContainer(text: 'Cari Item'),
                  SizedBox(height: TSizes.spaceBtwItems),
                  SectionHeading(
                    title: 'Kategori',
                    showActionButton: false,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  HomeCategories(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),

              child: Column(

                children: [
                  SectionHeading(title: 'Paket Promo', onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SectionHeading(title: 'Item Populer', onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  GridLayout(
                    itemCount: campingProducts.length,
                    itemBuilder: (_, index) => ProductCardVertical(
                      product: campingProducts[index],
                      icon: Iconsax.shopping_cart, // Ikon keranjang belanja
                      iconColor: TColors.white, // Warna ikon putih
                    ),
                  ),




                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationMenu(currentIndex: 0,),
    );
  }
}


