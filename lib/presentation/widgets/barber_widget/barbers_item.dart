import 'package:barber_application/presentation/system_design/app_icons.dart';
import 'package:barber_application/presentation/system_design/app_images.dart';
import 'package:barber_application/presentation/system_design/app_sizes.dart';
import 'package:barber_application/presentation/system_design/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../system_design/app_colors.dart';

class BarbersItem extends StatelessWidget {
  const BarbersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFFFFFF).withOpacity(0.7),
            Color(0xFFFFFFFF).withOpacity(0.3),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(AppSizes.boxBorder)),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.boxBorder)),
        child: Row(
          children: [
            SizedBox(
              height: 120.0,
              width: 120.0,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.imageBorder),
                    child: Image.asset(
                      AppImages.user,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "William Rojer Salon",
                      style: AppTypography.subheading(
                          color: AppColors.primaryTextColor),
                    ), 
                    SizedBox(width: 5.0,), 
                    SvgPicture.asset(AppIcons.tickIcon)
                  ],
                ),
                SizedBox(height: 6.0,),
                Row(
                  children: [
                    Text(
                      "Haircut ,Face Shave ,Skin Fades",
                      style: AppTypography.body(
                          color: AppColors.secondaryTextColor),
                    )
                  ],
                ),
                SizedBox(height: 12.0,),
                Row(
                  children: [
                    Text(
                      "5.0 Kms",
                      style: AppTypography.caption(
                          color: AppColors.primaryBtnColor),
                    ),
                    SizedBox(width: 5.0,),
                    Container(
                      height: 16.0,
                      width: 1.0,
                      color: AppColors.secondaryTextColor,
                    ),
                    SizedBox(width: 5.0,),
                    Expanded(child: Text(
                      "Haircut ,Face Shave ,Skin Fades",
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.body(
                          color: AppColors.secondaryTextColor),
                    ))
                  ],
                ),
              ],
            )),
            SizedBox(
              width: 8.0,
            ),
            Column(
              children: [
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  width: 32,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        color: AppColors.goldColor,
                        size: 12.0,
                      ),
                      Text(
                        "4.1",
                        style: AppTypography.subheading6(
                            color: AppColors.goldColor),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}
