import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../image/rounded_images.dart';
import '../../texts/product_title_text.dart';

class Product {
  final String title;
  final String brand;
  final String imageUrl;
  final double price;
  final double rating;

  Product({
    required this.title,
    required this.brand,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}

final List<Product> campingProducts = [
  Product(
    title: 'Tenda Camping 4 Orang',
    brand: 'OutdoorGear',
    imageUrl: TImages.productImage1,
    price: 1200000,
    rating: 4.8,
  ),
  Product(
    title: 'Ransel Hiking 50L',
    brand: 'AdventurePro',
    imageUrl: TImages.productImage2,
    price: 850000,
    rating: 4.7,
  ),
  Product(
    title: 'Sleeping Bag -10°C',
    brand: 'CozyCamp',
    imageUrl: TImages.productImage3,
    price: 600000,
    rating: 4.9,
  ),
  Product(
    title: 'Kompor Portable',
    brand: 'CampFire',
    imageUrl: TImages.productImage4,
    price: 400000,
    rating: 4.6,
  ),
];

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(TSizes.sm),
      itemCount: campingProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: TSizes.sm,
        mainAxisSpacing: TSizes.sm,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return ProductCardVertical(product: campingProducts[index]);
      },
    );
  }
}

class ProductCardVertical extends StatelessWidget {
  final Product product;
  final IconData icon; // Tambahkan parameter ikon
  final Color iconColor; // Tambahkan parameter warna ikon

  const ProductCardVertical({
    super.key,
    required this.product,
    this.icon = Iconsax.shopping_cart, // Default ikon
    this.iconColor = TColors.white, // Default warna ikon
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedContainer(
              height: 150,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(
                    imageUrl: product.imageUrl,
                    applyImageRadius: true,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: CircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: product.title),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        'by ${product.brand}',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: TSizes.xs),
                      const Icon(Iconsax.star5, color: Colors.amber, size: TSizes.iconXs),
                      Text(
                        product.rating.toString(),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\Rp${product.price.toStringAsFixed(0)}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          decoration: const BoxDecoration(
                            color: TColors.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.productImageRadius),
                            ),
                          ),
                          child: Center(
                            child: CustomIcon(
                              icon: icon, // Gunakan ikon yang diterima dari parameter
                              color: iconColor, // Gunakan warna ikon yang diterima dari parameter
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const CustomIcon({
    super.key,
    required this.icon,
    required this.color,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}