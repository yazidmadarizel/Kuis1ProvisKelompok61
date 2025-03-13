import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quiz_1/common/widgets/appbar/appbar.dart';
import 'package:quiz_1/common/widgets/product/cart/cart_item.dart';
import 'package:quiz_1/common/widgets/icons/circular_icon.dart';
import 'package:quiz_1/utils/constants/image_strings.dart';
import 'package:quiz_1/utils/constants/sizes.dart';
import 'package:quiz_1/utils/helpers/helper_functions.dart';
import 'package:quiz_1/utils/constants/colors.dart';

import '../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../common/widgets/texts/price_text.dart';
import '../../../navigation_menu.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(

        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ), crossAxisAlignment: null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SingleChildScrollView(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
              itemBuilder: (_, index) => Column(
                children: [
                  const CartItem(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddRemoveButton(),
                      PriceText(amount: 1200000),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Checkout Rp6.000.000'),
              ),
            ),
          ),
          const NavigationMenu(currentIndex: 4),
        ],
      ),


    );
  }
}