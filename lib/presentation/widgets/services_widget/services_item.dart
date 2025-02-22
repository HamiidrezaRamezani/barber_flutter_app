import 'package:barber_application/presentation/system_design/app_colors.dart';
import 'package:barber_application/presentation/system_design/app_typography.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
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
            height: 8.0,
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
