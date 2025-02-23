import 'package:barber_application/presentation/system_design/screen_size.dart';
import 'package:barber_application/presentation/widgets/filter_widget/filter_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../api/api_services/services/services_bloc.dart';
import '../../../api/api_services/services/services_cubit.dart';
import '../../system_design/app_colors.dart';
import '../../system_design/app_icons.dart';
import '../../system_design/app_sizes.dart';
import '../../system_design/app_typography.dart';
import '../../ui/core/ui_models/filter_ui_model.dart';
import 'filter_item.dart';

class FiltersWidget extends StatefulWidget {
  final String listOfItemsLength;
  final Function(String) onFilterSelected;

  const FiltersWidget(
      {super.key,
      required this.listOfItemsLength,
      required this.onFilterSelected});

  @override
  State<FiltersWidget> createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  bool isOpenFilter = false;

  int selectedFilterItems = 0;

  List<FilterUiModel> filterUiSelectItems = [];

  List<String> selectedFiltersItemTextToServer = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesCubit()..fetchServices(),
      child: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoading) {
            filterUiSelectItems.clear();
            return FilterShimmerLoading();
          } else if (state is ServicesError) {
            // برای بخش ارور هندلینگ
            return Container(
              height: 32.0,
              width: context.width,
              decoration: BoxDecoration(
                  color: AppColors.errorColor,
                  borderRadius: BorderRadius.circular(AppSizes.boxBorder)),
              child: Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.white, fontSize: AppSizes.heading3FontSize),
                ),
              ),
            );
          } else if (state is ServicesLoaded) {
            for (var element in state.services) {
              filterUiSelectItems.add(FilterUiModel(
                  name: element.title, slug: element.slug, isSelect: false));
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.listOfItemsLength} Barber Shop/barbers",
                      style: AppTypography.heading(color: AppColors.whiteColor),
                    ),
                    InkWell(
                      borderRadius:
                          BorderRadius.circular(AppSizes.tabBorderRadius),
                      onTap: () {
                        setState(() {
                          isOpenFilter = !isOpenFilter;
                        });
                      },
                      child: Container(
                        height: 32,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.tabBorderRadius),
                          color: (isOpenFilter)
                              ? AppColors.whiteColor
                              : Colors.transparent,
                          border: Border.all(
                              width: 1.0,
                              color: AppColors.whiteColor.withOpacity(0.8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.filterIcon,
                              color: (isOpenFilter)
                                  ? AppColors.primaryTextColor
                                  : AppColors.whiteColor,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              (selectedFilterItems == 0)
                                  ? "Filters"
                                  : "Filters $selectedFilterItems",
                              style: AppTypography.body(
                                  color: (isOpenFilter)
                                      ? AppColors.primaryTextColor
                                      : AppColors.whiteColor),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                (isOpenFilter == true)
                    ? Container(
                        height: 42,
                        margin: EdgeInsets.only(
                            top: AppSizes.extraLargeMarginPadding),
                        width: context.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: filterUiSelectItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: AppSizes.smallMarginPadding,
                                    top: 4.0,
                                    bottom: 4.0),
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(
                                        AppSizes.tabBorderRadius),
                                    onTap: () {
                                      selectedItemFilter(index);
                                    },
                                    child: FilterItem(
                                        filterUiSelectItems:
                                            filterUiSelectItems,
                                        index: index)),
                              );
                            }),
                      )
                    : Container()
              ],
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  void selectedItemFilter(int index) {
    setState(() {
      filterUiSelectItems[index].isSelect =
          !filterUiSelectItems[index].isSelect;
    });

    if (filterUiSelectItems[index].isSelect) {
      setState(() {
        selectedFilterItems += 1;
      });
    } else {
      setState(() {
        selectedFilterItems -= 1;
      });
    }

    toggleFilter(filterUiSelectItems[index].slug);
  }

  void toggleFilter(String slug) {
    setState(() {
      if (selectedFiltersItemTextToServer.contains(slug)) {
        selectedFiltersItemTextToServer.remove(slug);
      } else {
        selectedFiltersItemTextToServer.add(slug);
      }
    });

    String filtersQuery = selectedFiltersItemTextToServer.join(",");
    widget.onFilterSelected(filtersQuery);
  }
}
