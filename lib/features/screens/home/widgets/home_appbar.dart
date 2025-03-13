import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/product/icon/profile_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
        crossAxisAlignment: CrossAxisAlignment.start,
        title: Column(
          children: [
            Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.headlineSmall?.apply(color: TColors.grey),),
            Text(TTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.labelMedium?.apply(color: TColors.grey),),

          ],
        ),
        actions:[
          ProfileIcon(onPressed: (){}, iconColor: TColors.white,),

        ]
    );
  }
}

