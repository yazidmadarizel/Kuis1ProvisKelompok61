import 'package:flutter/material.dart';
import 'package:quiz_1/common/widgets/appbar/appbar.dart';
import 'package:quiz_1/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:quiz_1/common/widgets/texts/section_heading.dart';
import 'package:quiz_1/navigation_menu.dart';
import 'package:quiz_1/utils/constants/colors.dart';
import 'package:quiz_1/utils/constants/image_strings.dart';
import 'package:quiz_1/utils/constants/sizes.dart';

class PackagePurchaseScreen extends StatelessWidget {
  const PackagePurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Paket Perkemahan'),
        crossAxisAlignment: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: const PrimaryHeaderContainer(
                height: 400,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image(
                        image: AssetImage(TImages.promoBanner1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Paket Perkemahan Lengkap',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    children: [
                      Text(
                        'Rp 1.200.000',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary,
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Text(
                        'Rp 1.500.000',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: TColors.secondary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                        ),
                        child: Text(
                          '20% Off',
                          style: TextStyle(
                            color: TColors.secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Text(
                    'Paket lengkap untuk kebutuhan berkemah Anda. Termasuk tenda, ransel, alat masak, dan perlengkapan lainnya.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const SectionHeading(title: 'Item dalam Paket', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Column(
                    children: [
                      _buildPackageItem(TImages.productImage1, 'Tenda 4 Orang', 'Tenda waterproof kapasitas 4 orang'),
                      _buildPackageItem(TImages.productImage2, 'Ransel 50L', 'Ransel tahan air dengan kapasitas 50L'),
                      _buildPackageItem(TImages.productImage3, 'Sleeping Bag', 'Sleeping bag nyaman untuk cuaca dingin'),
                      _buildPackageItem(TImages.productImage4, 'Alat Masak Portable', 'Set alat masak lengkap untuk outdoor'),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Tombol ditekan");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.primary,
                      ),
                      child: const Text(
                        'Beli Sekarang',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationMenu(currentIndex: 0),
    );
  }

  Widget _buildPackageItem(String image, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
            child: Image(
              image: AssetImage(image),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
