import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quiz_1/utils/constants/colors.dart';
import 'package:quiz_1/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Teks selalu muncul
      currentIndex: currentIndex,
      onTap: (index) {
        // Tidak ada aksi ketika item ditekan
      },
      backgroundColor: darkMode ? TColors.black : Colors.white,
      selectedItemColor: darkMode ? TColors.white : TColors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Iconsax.message), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Iconsax.heart), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Iconsax.receipt), label: 'Transaksi'),
        BottomNavigationBarItem(icon: Icon(Iconsax.shopping_cart), label: 'Keranjang'),
      ],
    );
  }
}