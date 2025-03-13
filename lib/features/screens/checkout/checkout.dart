import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quiz_1/common/widgets/appbar/appbar.dart';
import 'package:quiz_1/utils/constants/sizes.dart';
import 'package:quiz_1/utils/constants/colors.dart';

import '../../../navigation_menu.dart';
import '../../../utils/constants/image_strings.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(

        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        crossAxisAlignment: null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Product item
              Container(
                padding: const EdgeInsets.all(TSizes.md),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Product Image
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(TSizes.sm),
                        image: const DecorationImage(
                          image: AssetImage(TImages.productImage1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),

                    // Product Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [

                              const SizedBox(width: 4),
                              Text(
                                'Tenda Kemah 4 Orang',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: TSizes.xs),
                          Text(
                            'Jumlah: 11 Warna: Hijau',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Promo Code
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Punya kode promo? Masukkan ke sini',
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        elevation: 0,
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                        ),
                      ),
                      child: const Text('Apply'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Price Details
              Column(
                children: [
                  // Subtotal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Rp14.640.000',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Shipping Fee
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Biaya Pengiriman',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Rp50.000',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Tax Fee
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pajak',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Rp1.464.000',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Divider
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Order Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Pesanan',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Rp16.154.000',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Payment Method Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Metode Pembayaran',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextButton(
                        onPressed: null,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.purple,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text('Ubah'),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.sm),

                  // PayPal option
                  Container(
                    padding: const EdgeInsets.all(TSizes.md),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 30,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(TSizes.xs),
                            border: Border.all(color: Colors.grey.withOpacity(0.2)),
                          ),
                          child: const Center(
                            child: Text(
                              'PayPal',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Shipping Address Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Alamat Pengiriman',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextButton(
                        onPressed: null,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.purple,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text('Ubah'),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.sm),

                  // Address Container
                  Container(
                    padding: const EdgeInsets.all(TSizes.md),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Al-Huda',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: TSizes.sm),

                        // Phone Number
                        Row(
                          children: [
                            const Icon(Icons.phone, size: 18, color: Colors.grey),
                            const SizedBox(width: TSizes.sm),
                            Text(
                              '+12317805928',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: TSizes.sm),

                        // Address
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 18, color: Colors.grey),
                            const SizedBox(width: TSizes.sm),
                            Expanded(
                              child: Text(
                                '45561 Cilimus, Bandung, Jawa Barat, Indonesia',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(TSizes.cardRadiusLg),
                topRight: Radius.circular(TSizes.cardRadiusLg),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Checkout Rp1.200.000'),
              ),
            ),
          ),
          const NavigationMenu(currentIndex: 4),
        ],
      ),

    );
  }
}