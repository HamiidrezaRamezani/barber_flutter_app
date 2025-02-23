import 'package:barber_application/presentation/system_design/app_colors.dart';
import 'package:barber_application/presentation/system_design/app_images.dart';
import 'package:barber_application/presentation/system_design/app_sizes.dart';
import 'package:barber_application/presentation/system_design/app_typography.dart';
import 'package:barber_application/presentation/system_design/screen_size.dart';
import 'package:barber_application/presentation/widgets/barber_widget/barbers_widget.dart';
import 'package:barber_application/presentation/widgets/services_widget/services_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../api/api_services/barbers/barbers_bloc.dart';
import '../../../../api/api_services/barbers/barbers_cubit.dart';
import '../../../widgets/filter_widget/filters_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 170,
              width: context.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 140, child: Image.asset(AppImages.logo)),
                  ),
                  Positioned(
                      right: 0.0,
                      top: 13,
                      child: Container(
                        height: 30.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppSizes.btnBorder)),
                            color: AppColors.whiteColor.withOpacity(0.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: AppColors.whiteColor,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              "Ranchview",
                              style: AppTypography.body(
                                  color: AppColors.secondaryTextColor),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              height: 48.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.boxBorder),
                  color: AppColors.whiteColor),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              "Search in Barbers, Location and servicess ...",
                          hintStyle: AppTypography.body(
                              color: AppColors.secondaryTextColor)),
                    )),
                    Container(
                      height: 37.0,
                      width: 37.0,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.boxBorder),
                          color: AppColors.primaryBtnColor),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            SizedBox(
              height: 70,
              child: ServicesWidget(),
            ),
            SizedBox(
              height: 32.0,
            ),
            Container(
                height: 170,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppSizes.imageBorder)),
                          child: Image.asset(AppImages.banner)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  color: AppColors.whiteColor.withOpacity(0.3),
                                  width: 1.0),
                              borderRadius:
                                  BorderRadius.circular(AppSizes.imageBorder)),
                          padding: EdgeInsets.all(13.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.my_location,
                                    color: AppColors.whiteColor,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Nearby You",
                                    style: AppTypography.heading(
                                        color: AppColors.whiteColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Find the nearest Barbar Shop to you on the map",
                                    style: AppTypography.body(
                                        color: AppColors.secondaryTextColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 44.0,
                                    width: 132.0,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryBtnColor,
                                        borderRadius: BorderRadius.circular(
                                            AppSizes.btnBorder)),
                                    child: Center(
                                      child: Text(
                                        "View the map",
                                        style: AppTypography.button(
                                            color: AppColors.whiteColor),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 32.0,
            ),
            BlocProvider(
              create: (_) => BarbersCubit()..fetchBarbers(),
              child: BlocBuilder<BarbersCubit, BarbersState>(
                builder: (context, state) {
                  int barberCount = 0;
                  if (state is BarbersLoaded) {
                    barberCount = state.barber.length;
                  }

                  return Column(
                    children: [
                      FiltersWidget(
                        listOfItemsLength: barberCount.toString(),
                        onFilterSelected: (selectedService) {
                          context
                              .read<BarbersCubit>()
                              .fetchBarbers(serviceType: selectedService);
                        },
                      ),
                      SizedBox(height: 21.0),
                      BarbersWidget(),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 26.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Scroll ro Load more",
                  style: AppTypography.caption(
                      color: AppColors.secondaryTextColor),
                )
              ],
            ),
            SizedBox(
              height: 82.0,
            ),
          ],
        ),
      ),
    );
  }
}
