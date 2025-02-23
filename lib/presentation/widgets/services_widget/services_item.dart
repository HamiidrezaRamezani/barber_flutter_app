import 'package:barber_application/presentation/system_design/app_colors.dart';
import 'package:barber_application/presentation/system_design/app_typography.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../system_design/app_sizes.dart';

class ServicesItem extends StatelessWidget {
  final String title;
  final String slug;
  final String image;

  const ServicesItem(
      {super.key,
      required this.title,
      required this.slug,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSizes.largeMarginPadding, right: AppSizes.largeMarginPadding),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: image,
            height: 42,
            useOldImageOnUrlChange: false,
            fadeInDuration: Duration(milliseconds: 300),
            placeholderFadeInDuration: Duration(milliseconds: 300),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) {
              return Icon(Icons.error);
            },
          ),
          SizedBox(
            height: AppSizes.smallMarginPadding,
          ),
          Text(
            title,
            style: AppTypography.body(color: AppColors.secondaryTextColor),
          )
        ],
      ),
    );
  }
}
