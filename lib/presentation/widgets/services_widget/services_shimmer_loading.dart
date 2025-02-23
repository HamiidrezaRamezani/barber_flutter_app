import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../system_design/app_sizes.dart';

class ServicesShimmerLoading extends StatelessWidget {
  const ServicesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                left: AppSizes.largeMarginPadding,
                right: AppSizes.largeMarginPadding),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 42,
                    width: 42,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: AppSizes.smallMarginPadding,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 12.0,
                    width: 80.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
