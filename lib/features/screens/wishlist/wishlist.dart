import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quiz_1/common/widgets/appbar/appbar.dart';
import 'package:quiz_1/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:quiz_1/navigation_menu.dart';
import 'package:quiz_1/utils/constants/sizes.dart';
import 'package:quiz_1/utils/device/device_utility.dart';
import 'package:quiz_1/utils/helpers/helper_functions.dart';

import '../../../common/widgets/layout/grid_layout.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.add),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                itemCount: campingProducts.length,
                itemBuilder: (_, index) => ProductCardVertical(
                  product: campingProducts[index],
                  icon: Iconsax.bookmark, // Ikon hati
                  iconColor: Colors.white, // Warna ikon merah
                ),
              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationMenu(currentIndex: 2), // Sesuaikan index untuk navigasi
    );
  }
}