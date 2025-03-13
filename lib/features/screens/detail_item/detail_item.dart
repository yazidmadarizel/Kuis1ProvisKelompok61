import 'package:flutter/material.dart';
import 'package:quiz_1/utils/constants/colors.dart';
import 'package:quiz_1/utils/constants/image_strings.dart';
import 'package:quiz_1/utils/constants/sizes.dart';

import '../../../navigation_menu.dart';

class DetailItemScreen extends StatelessWidget {
  const DetailItemScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const String itemImage = TImages.productImage1;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Image.asset(itemImage)),
              ),
            ),

            /// Product Details
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Rating and Price

                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            '5.0 (199)',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Price
                  Text(
                    'Rp1.200.000',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Product Name
                  Text(
                    'Tenda Camping 4 Orang',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Stock Status
                  Text(
                    'Stok: 99',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),



                  /// Color Selection
                  Text(
                    'Warna',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: TColors.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: TColors.secondary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),



                  /// Description
                  Text(
                    'Deskripsi',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    'Tenda kemah berkapasitas 4 orang yang luas, tahan air, dan cocok untuk berkemah bersama keluarga atau kelompok.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Add to Bag Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // No action
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, // Warna teks
                        backgroundColor: TColors.primary, // Warna background
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Border radius
                        ),
                      ),
                      child: const Text('Tambahkan ke Keranjang'),
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // No action
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: TColors.primary, // Warna teks
                        side: BorderSide(color: TColors.primary), // Warna border
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Border radius
                        ),
                      ),
                      child: const Text('Checkout'),
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

  /// Helper method to build size selection boxes
  Widget _buildSizeBox(String size) {
    return Container(
      width: 60,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: TColors.darkGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(size),
    );
  }
}