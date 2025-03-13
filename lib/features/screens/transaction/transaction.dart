import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quiz_1/features/screens/transaction/widgets/custom_app_bar.dart';
import 'package:quiz_1/common/widgets/appbar/appbar.dart';
import 'package:quiz_1/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:quiz_1/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:quiz_1/common/widgets/texts/section_heading.dart';
import 'package:quiz_1/utils/constants/colors.dart';
import 'package:quiz_1/utils/constants/sizes.dart';
import 'package:quiz_1/navigation_menu.dart';

import '../../../utils/constants/image_strings.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});



  @override
  _TransactionListScreenState createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

// Add these controllers in your state class
  late ScrollController _outerController;
  late ScrollController _innerController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _outerController = ScrollController();
    _innerController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _outerController.dispose();
    _innerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _outerController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: PrimaryHeaderContainer(
                height: 200,
                child: Column(
                  children: [
                    // Custom AppBar for Transaction List
                    CustomAppBar(
                      title: Text(
                        'Daftar Transaksi',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Iconsax.notification, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const SearchContainer(text: 'Cari transaksi'),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: TColors.primary,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: TColors.primary,
                  tabs: const [
                    Tab(text: 'Semua'),
                    Tab(text: 'Dalam Proses'),
                    Tab(text: 'Pengembalian'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            // All Transactions Tab
            _buildTransactionList(
              [
                _buildTransactionItem(
                  orderNumber: 'INV/20250313/001',
                  date: '13 Mar 2025',
                  price: 'Rp 1.200.000',
                  status: 'Selesai',
                  statusColor: Colors.green,
                  imageUrl: TImages.productImage1,
                  productName: 'Tenda Camping 4 Orang',
                ),
                _buildTransactionItem(
                  orderNumber: 'INV/20250312/092',
                  date: '12 Mar 2025',
                  price: 'Rp 850.000',
                  status: 'Dalam Pengiriman',
                  statusColor: Colors.blue,
                  imageUrl: TImages.productImage2,
                  productName: 'Ransel Hiking 50L',
                ),
                _buildTransactionItem(
                  orderNumber: 'INV/20250310/045',
                  date: '10 Mar 2025',
                  price: 'Rp 600.000',
                  status: 'Dikembalikan',
                  statusColor: Colors.red,
                  imageUrl: TImages.productImage3,
                  productName: 'Sleeping Bag',
                ),
                _buildTransactionItem(
                  orderNumber: 'INV/20250308/023',
                  date: '8 Mar 2025',
                  price: 'Rp 400.000',
                  status: 'Selesai',
                  statusColor: Colors.green,
                  imageUrl: TImages.productImage4,
                  productName: 'Kompor Portable',
                ),
              ],

            ),

            // In Process Tab
            _buildTransactionList(
              [
                _buildTransactionItem(
                  orderNumber: 'INV/20250312/092',
                  date: '12 Mar 2025',
                  price: 'Rp 1.200.000',
                  status: 'Dalam Pengiriman',
                  statusColor: Colors.blue,
                  imageUrl: TImages.productImage1,
                  productName: 'Tenda Camping 4 Orang',
                ),
                _buildTransactionItem(
                  orderNumber: 'INV/20250311/033',
                  date: '11 Mar 2025',
                  price: 'Rp 500.000',
                  status: 'Dikemas',
                  statusColor: Colors.orange,
                  imageUrl: TImages.productImage2,
                  productName: 'Ransel Hiking 50 L',
                ),
              ],

            ),


            // Returns Tab
            _buildTransactionList(
              [
                _buildTransactionItem(
                  orderNumber: 'INV/20250310/045',
                  date: '10 Mar 2025',
                  price: 'Rp 600.000',
                  status: 'Dikembalikan',
                  statusColor: Colors.red,
                  imageUrl: TImages.productImage3,
                  productName: 'Sleeping Bag',
                  returnReason: 'Ukuran tidak sesuai',
                ),
                _buildTransactionItem(
                  orderNumber: 'INV/20250305/018',
                  date: '5 Mar 2025',
                  price: 'Rp 400.000',
                  status: 'Pengembalian Diproses',
                  statusColor: Colors.amber,
                  imageUrl: TImages.productImage4,
                  productName: 'Kompor Portable',
                  returnReason: 'Barang cacat',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationMenu(currentIndex: 3),
    );
  }

  Widget _buildTransactionList(List<Widget> items, {ScrollController? controller}) {
    return ListView(
      controller: controller,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      children: items,
    );
  }

  Widget _buildTransactionItem({
    required String orderNumber,
    required String date,
    required String price,
    required String status,
    required Color statusColor,
    required String imageUrl,
    required String productName,
    String? returnReason,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order header
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderNumber,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Product details
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Row(
              children: [
                // Product image
                ClipRRect(
                  borderRadius: BorderRadius.circular(TSizes.sm),
                  child: Image.asset(
                    imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),

                // Product details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: TSizes.xs),
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),

                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm,
                    vertical: TSizes.xs / 2,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(TSizes.sm),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Return reason (if any)
          if (returnReason != null)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.md,
                vertical: TSizes.sm,
              ),
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Alasan Pengembalian:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: TSizes.xs / 2),
                  Text(returnReason),
                ],
              ),
            ),

          // Action buttons
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Track Order Button
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: TColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                    ),
                  ),
                  child: Text(
                    'Lacak',
                    style: TextStyle(color: TColors.primary),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),

                // Buy Again / Return Details Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                    ),
                  ),
                  child: Text(
                    returnReason != null ? 'Detail' : 'Beli Lagi',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Delegate for SliverPersistentHeader
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return false;
  }
}