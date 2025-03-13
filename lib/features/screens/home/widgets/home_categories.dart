import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'image': TImages.bagIcon, 'title': 'Ransel'},
    {'image': TImages.cookingIcon, 'title': 'Alat Masak'},
    {'image': TImages.shoeIcon, 'title': 'Jaket & Sepatu'},
    {'image': TImages.tentIcon, 'title': 'Tenda'},
    {'image': TImages.lampIcon, 'title': 'Penerangan'},
    {'image': TImages.bedIcon, 'title': 'Alat Tidur'},
    {'image': TImages.otherIcon, 'title': 'Lainnya'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: categories[index]['image'],
            title: categories[index]['title'],
            onTap: () {},
          );
        },
      ),
    );
  }
}
