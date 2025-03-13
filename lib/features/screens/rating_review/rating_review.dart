import 'package:flutter/material.dart';

import 'package:quiz_1/utils/constants/colors.dart';
import 'package:quiz_1/utils/constants/image_strings.dart';

import '../../../navigation_menu.dart';

class ItemReviewScreen extends StatelessWidget {
  const ItemReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hardcoded review data
    final List<Map<String, dynamic>> reviews = [
      {
        'name': 'Budi Santoso',
        'date': '10 Mar 2025',
        'rating': 5,
        'comment': 'Tenda bagus, kualitas premium. Cukup untuk 8 orang dan tahan angin kencang saat camping di Gunung Bromo.',
        'avatar': 'BS',
      },
      {
        'name': 'Siti Rahayu',
        'date': '28 Feb 2025',
        'rating': 4,
        'comment': 'Tenda nyaman dipakai untuk keluarga. Pemasangan mudah tapi agak berat untuk dibawa hiking.',
        'avatar': 'SR',
      },
      {
        'name': 'Agus Wijaya',
        'date': '15 Feb 2025',
        'rating': 5,
        'comment': 'Sangat puas dengan sewa tenda ini. Kondisi bersih dan tidak ada kerusakan. Sudah 2x sewa dan selalu memuaskan.',
        'avatar': 'AW',
      },
      {
        'name': 'Dewi Kusuma',
        'date': '5 Feb 2025',
        'rating': 3,
        'comment': 'Tenda cukup bagus, tapi ada sedikit sobekan kecil di bagian pintu yang sedikit mengganggu.',
        'avatar': 'DK',
      },
    ];

    // Calculate average rating
    double averageRating = reviews.map((r) => r['rating'] as int).reduce((a, b) => a + b) / reviews.length;

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item summary
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  // Item thumbnail
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(TImages.productImage1),
                  ),
                  SizedBox(width: 16),
                  // Item details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tenda Kemah 4 Orang',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Rp. 1.200.000',
                          style: TextStyle(
                            fontSize: 16,
                            color: TColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Review summary
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  // Average rating
                  Column(
                    children: [
                      Text(
                        averageRating.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade800,
                        ),
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < averageRating.floor()
                                ? Icons.star
                                : (index < averageRating
                                ? Icons.star_half
                                : Icons.star_border),
                            color: Colors.amber,
                            size: 20,
                          );
                        }),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${reviews.length} ulasan',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 32),
                  // Rating bars
                  Expanded(
                    child: Column(
                      children: List.generate(5, (index) {
                        final ratingCount = reviews.where((r) => r['rating'] == 5 - index).length;
                        final percentage = reviews.isEmpty ? 0.0 : ratingCount / reviews.length;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Row(
                            children: [
                              Text(
                                '${5 - index}',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.star, color: Colors.amber, size: 14),
                              SizedBox(width: 8),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: percentage,
                                  backgroundColor: Colors.grey.shade300,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '$ratingCount',
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            // Filter buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterChip(
                      label: Text('Semua'),
                      selected: true,
                      onSelected: (bool selected) {},
                      backgroundColor: Colors.grey.shade200,
                      selectedColor: TColors.secondary,
                      checkmarkColor: TColors.primary,
                    ),
                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('5★'),
                      selected: false,
                      onSelected: (bool selected) {},
                      backgroundColor: Colors.grey.shade200,
                    ),
                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('4★'),
                      selected: false,
                      onSelected: (bool selected) {},
                      backgroundColor: Colors.grey.shade200,
                    ),
                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('3★'),
                      selected: false,
                      onSelected: (bool selected) {},
                      backgroundColor: Colors.grey.shade200,
                    ),
                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('2★'),
                      selected: false,
                      onSelected: (bool selected) {},
                      backgroundColor: Colors.grey.shade200,
                    ),
                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('1★'),
                      selected: false,
                      onSelected: (bool selected) {},
                      backgroundColor: Colors.grey.shade200,
                    ),
                    SizedBox(width: 8),
                    FilterChip(
                      label: Text('Dengan Foto'),
                      selected: false,
                      onSelected: (bool selected) {},
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ],
                ),
              ),
            ),

            // Divider
            Divider(thickness: 8, color: Colors.grey.shade200),

            // Reviews list
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reviews.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Reviewer info
                      Row(
                        children: [
                          // Avatar
                          CircleAvatar(
                            backgroundColor: TColors.secondary,
                            child: Text(
                              review['avatar'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 12),
                          // Name and date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                review['date'],
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),

                      // Rating stars
                      Row(
                        children: List.generate(5, (starIndex) {
                          return Icon(
                            starIndex < review['rating']
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 18,
                          );
                        }),
                      ),
                      SizedBox(height: 8),

                      // Review text
                      Text(
                        review['comment'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                        ),
                      ),

                      // Review photos (if any)
                      if (index == 0) // Only add photos to the first review for demo
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(3, (photoIndex) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Image.asset(TImages.productImage1),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),

                      // Helpful button
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.thumb_up_outlined, size: 16),
                              label: Text('Membantu'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.grey.shade700,
                                side: BorderSide(color: Colors.grey.shade300),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            // Load more button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text('Lihat Lebih Banyak'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: TColors.primary,
                    side: BorderSide(color: TColors.secondary),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ),
            ),

            // Add review button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: IconTheme(
                  data: const IconThemeData(color: Colors.white), // Warna ikon diatur putih
                  child: const Icon(Icons.rate_review),
                ),
                label: const Text(
                  'Tulis Ulasan',
                  style: TextStyle(color: Colors.white), // Warna teks diatur putih
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // Warna teks dan ikon (default)
                  backgroundColor: TColors.primary, // Warna background tombol
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 50), // Lebar penuh
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Border radius
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationMenu(currentIndex: 0,),
    );
  }
}