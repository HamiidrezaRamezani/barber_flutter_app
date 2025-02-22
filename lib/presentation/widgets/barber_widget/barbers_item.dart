import 'package:barber_application/presentation/system_design/app_icons.dart';
import 'package:barber_application/presentation/system_design/app_images.dart';
import 'package:barber_application/presentation/system_design/app_sizes.dart';
import 'package:barber_application/presentation/system_design/app_typography.dart';
import 'package:barber_application/presentation/system_design/screen_size.dart';
import 'package:barber_application/presentation/ui/core/ui_models/barbers_ui_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../system_design/app_colors.dart';

class BarbersItem extends StatelessWidget {
  final List<BarbersUiModels> items;
  final int index;

  const BarbersItem({super.key, required this.items, required this.index});

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
                    child: CachedNetworkImage(
                      imageUrl: items[index].avatar,
                      height: 42,
                      width: 42,
                      fit: BoxFit.cover,
                      useOldImageOnUrlChange: false,
                      fadeInDuration: Duration(milliseconds: 300),
                      placeholderFadeInDuration: Duration(milliseconds: 300),
                      maxWidthDiskCache: 100,
                      // بهینه‌سازی کش برای کاهش مصرف رم
                      maxHeightDiskCache: 100,
                      placeholder: (context, url) => SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          AppImages.logo, // عکس پیش‌فرض
                          height: 42,
                          width: 42,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                    SizedBox(
                      width: context.width * 0.45,
                      child: Text(
                        items[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.subheading(
                            color: AppColors.primaryTextColor),
                      ),
                    ),
                    (items[index].isShop == false)
                        ? Container()
                        : SvgPicture.asset(AppIcons.tickIcon)
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        items[index].services.join(', '),
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.body(
                            color: AppColors.secondaryTextColor),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      "${items[index].distance.toString()} Kms",
                      style: AppTypography.caption(
                          color: AppColors.primaryBtnColor),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      height: 16.0,
                      width: 1.0,
                      color: AppColors.secondaryTextColor,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: Text(
                      items[index].address,
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
                        "${items[index].rate}",
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
