import 'package:barber_application/presentation/system_design/app_colors.dart';
import 'package:barber_application/presentation/system_design/app_images.dart';
import 'package:barber_application/presentation/system_design/app_typography.dart';
import 'package:flutter/cupertino.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          Image.asset(AppImages.logo, height: 42,),
          SizedBox(height: 8.0,),
          Text("HAIRCUT", style: AppTypography.body(color: AppColors.secondaryTextColor),)
        ],
      ),
    );
  }
}
