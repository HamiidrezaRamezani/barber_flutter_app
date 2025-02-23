import 'package:barber_application/presentation/system_design/app_colors.dart';
import 'package:barber_application/presentation/system_design/app_images.dart';
import 'package:barber_application/presentation/system_design/app_typography.dart';
import 'package:flutter/cupertino.dart';

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
          (image == '')
              ? Image.asset(
                  AppImages.logo,
                  height: 42,
                )
              : Image.network(
                  image,
                  height: 42,
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
