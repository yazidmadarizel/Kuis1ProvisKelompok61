import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../image/rounded_images.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Gambar Produk
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 68,
          height: 68,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: Theme.of(context).brightness ==
              Brightness.dark
              ? Colors.grey[800]!
              : Colors.white,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Nama, Harga, & Ukuran Produk
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Flexible(
                child: ProductTitleText(
                  title: 'Tenda Kemah 4 Orang',
                  maxLines: 1,
                ),
              ),

              /// Atribut Produk
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Warna: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Hijau  ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}