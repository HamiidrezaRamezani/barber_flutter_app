import 'package:barber_application/presentation/system_design/app_sizes.dart';
import 'package:barber_application/presentation/system_design/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BarbersShimmerLoading extends StatelessWidget {
  const BarbersShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only( bottom: AppSizes.largeMarginPadding),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(AppSizes.boxBorder)),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.smallMarginPadding,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 30.0,
                          width: context.width * 0.65,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.smallMarginPadding,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 30.0,
                          width: context.width * 0.65,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.smallMarginPadding,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 30.0,
                          width: context.width * 0.65,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            );
          },
        ),
    );
  }
}
