import 'package:flutter/material.dart';

import '../../../navigation_menu.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class ChatWithAdminScreen extends StatelessWidget {
  const ChatWithAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hardcoded chat data
    final List<Map<String, dynamic>> messages = [
      {
        'sender': 'user',
        'text': 'Halo, saya berencana camping di Gunung Bromo minggu depan tapi belum pernah berkemah sebelumnya. Apa yang harus saya persiapkan?',
        'time': '10:23',
        'isRead': true,
      },
      {
        'sender': 'admin',
        'text': 'Selamat pagi! Senang sekali anda tertarik untuk camping. Untuk pemula, ada beberapa hal penting yang perlu disiapkan:',
        'time': '10:25',
        'isRead': true,
      },
      {
        'sender': 'admin',
        'text': '1. Tenda yang sesuai dengan jumlah orang & cuaca\n2. Sleeping bag\n3. Matras\n4. Pakaian hangat (suhu di Bromo bisa mencapai 3°C)\n5. Lampu senter/headlamp\n6. Cooking set & kompor portable\n7. Persediaan air & makanan',
        'time': '10:26',
        'isRead': true,
      },
      {
        'sender': 'user',
        'text': 'Terima kasih infonya. Kalau untuk tenda, berapa ukuran yang cocok untuk 4 orang?',
        'time': '10:30',
        'isRead': true,
      },
      {
        'sender': 'admin',
        'text': 'Untuk 4 orang, sebaiknya sewa tenda berkapasitas 6 orang agar lebih leluasa menyimpan barang. Kami punya tenda dome 6 orang yang cocok untuk pemula karena mudah dipasang.',
        'time': '10:32',
        'isRead': true,
      },
      {
        'sender': 'admin',
        'isImage': true,
        'text': 'Tenda Dome 6 Orang.jpg',
        'time': '10:33',
        'isRead': true,
      },
      {
        'sender': 'user',
        'text': 'Bagus sekali. Berapa harga sewanya untuk 3 hari?',
        'time': '10:35',
        'isRead': true,
      },
      {
        'sender': 'admin',
        'text': 'Harga sewa tenda dome 6 orang adalah Rp. 85.000/hari. Untuk 3 hari menjadi Rp. 255.000. Jika Anda butuh perlengkapan camping lainnya, kami punya paket lengkap yang lebih hemat.',
        'time': '10:36',
        'isRead': false,
      },
    ];

    // FAQ data
    final List<Map<String, String>> faqs = [
      {
        'question': 'Cara pasang tenda?',
      },
      {
        'question': 'Tips berkemah untuk pemula?',
      },
      {
        'question': 'Paket camping lengkap',
      },
      {
        'question': 'Lokasi camping terdekat',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: TColors.accent,
              child: Icon(Icons.support_agent, color: Colors.white),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin CampShop',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Online - Biasanya membalas dalam 5 menit',
                  style: TextStyle(fontSize: 12, color: Colors.green),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [

          // Chat messages
          Expanded(
            child: Container(

              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final bool isAdmin = message['sender'] == 'admin';
                  final bool isImage = message.containsKey('isImage') && message['isImage'];

                  return Align(
                    alignment: isAdmin ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 12,
                        left: isAdmin ? 0 : 50,
                        right: isAdmin ? 50 : 0,
                      ),
                      child: Column(
                        crossAxisAlignment: isAdmin ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                        children: [
                          // Message bubble
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isAdmin ? Colors.white : TColors.primary,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: isImage
                                ? Container(
                              width: 200,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(TImages.productImage1),
                            )
                                : Text(
                              message['text'],
                              style: TextStyle(
                                color: isAdmin ? Colors.black : Colors.white,
                              ),
                            ),
                          ),

                          // Time and read status
                          Padding(
                            padding: const EdgeInsets.only(top: 4, right: 4, left: 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  message['time'],
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                if (!isAdmin) ...[
                                  SizedBox(width: 4),
                                  Icon(
                                    message['isRead'] ? Icons.done_all : Icons.done,
                                    size: 14,
                                    color: message['isRead'] ? TColors.primary : Colors.grey.shade600,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // FAQ quick replies
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border(
                top: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pertanyaan Umum Pemula:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: faqs.map((faq) {
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: TColors.secondary),
                            ),
                            child: Text(
                              faq['question']!,
                              style: TextStyle(color: TColors.primary, fontSize: 12),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Message input
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file),
                  color: Colors.grey.shade700,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Colors.grey.shade700,
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Tulis pesan...',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: TColors.primary,
                  radius: 20,
                  child: Icon(Icons.send, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),

          // Camp guide suggestions
         
        ],
      ),
      bottomNavigationBar: const NavigationMenu(currentIndex: 1),
    );
  }
}