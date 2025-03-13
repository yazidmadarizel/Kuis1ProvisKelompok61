import 'package:flutter/material.dart';
import 'package:quiz_1/features/screens/transaction/transaction.dart';

import 'features/screens/paket_hemat/paket_hemat.dart';
import 'features/screens/cart/cart.dart';
import 'features/screens/checkout/checkout.dart';
import 'features/screens/chat/chat.dart';
import 'features/screens/detail_item/detail_item.dart';
import 'features/screens/home/home.dart';
import 'features/screens/rating_review/rating_review.dart';
import 'features/screens/transaction/transaction.dart';
import 'features/screens/wishlist/wishlist.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Provis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Quiz UI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('No Kelompok Praktikum: 61', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNavigationButton(context, 'Halaman Depan', const HomeScreen()),
              _buildNavigationButton(context, 'Rincian Item', const DetailItemScreen()),
              _buildNavigationButton(context, 'Rating Item', const ItemReviewScreen()),
              _buildNavigationButton(context, 'Chat', const ChatWithAdminScreen()),
              _buildNavigationButton(context, 'Wishlist', const WishlistScreen()),
              _buildNavigationButton(context, 'Keranjang', const CartScreen()),
              _buildNavigationButton(context, 'Checkout', const CheckoutScreen()),
              _buildNavigationButton(context, 'Pembelian Paket', const PackagePurchaseScreen()),
              _buildNavigationButton(context, 'Monitor Pesanan', const TransactionListScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
        child: Text(title),
      ),
    );
  }
}
