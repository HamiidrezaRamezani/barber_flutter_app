import 'package:barber_application/presentation/system_design/screen_size.dart';
import 'package:barber_application/presentation/ui/core/ui_models/barbers_ui_models.dart';
import 'package:barber_application/presentation/widgets/barber_widget/barbers_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_services/barbers/barbers_bloc.dart';
import '../../../api/api_services/barbers/barbers_cubit.dart';
import '../../system_design/app_colors.dart';
import '../../system_design/app_sizes.dart';
import 'barber_shimmer_loading.dart';

class BarbersWidget extends StatefulWidget {
  const BarbersWidget({super.key});

  @override
  State<BarbersWidget> createState() => _BarbersWidgetState();
}

class _BarbersWidgetState extends State<BarbersWidget> {
  List<BarbersUiModels> barbersListItems = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarbersCubit, BarbersState>(
      builder: (context, state) {
        if (state is BarbersLoading) {
          return BarbersShimmerLoading();
        } else if (state is BarbersLoaded) {
          List<BarbersUiModels> barbersListItems = state.barber.map((element) {
            return BarbersUiModels(
              name: element.fullname,
              slug: element.slug,
              address: element.address,
              services: element.services,
              avatar: element.avatar,
              distance: element.distance,
              isShop: element.isShop,
              rate: element.rate,
            );
          }).toList();

          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: barbersListItems.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return BarbersItem(
                items: barbersListItems,
                index: index,
              );
            },
          );
        } else if (state is BarbersError) {
          return Container(
            height: 70.0,
            width: context.width,
            decoration: BoxDecoration(
              color: AppColors.errorColor,
              borderRadius: BorderRadius.circular(AppSizes.boxBorder),
            ),
            child: Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        } else {
          return Center(child: Text('Unexpected state'));
        }
      },
    );
  }

// @override
// Widget build(BuildContext context) {
//   return BlocProvider(
//     create: (_) => BarbersCubit()..fetchBarbers(),
//     child: BlocBuilder<BarbersCubit, BarbersState>(
//       builder: (context, state) {
//         if (state is BarbersLoading) {
//           barbersListItems.clear();
//           return BarbersShimmerLoading();
//         } else if (state is BarbersLoaded) {
//           for (var element in state.barber) {
//             barbersListItems.add(BarbersUiModels(
//                 name: element.fullname,
//                 slug: element.slug,
//                 address: element.address,
//                 services: element.services,
//                 avatar: element.avatar,
//                 distance: element.distance,
//                 isShop: element.isShop,
//                 rate: element.rate));
//           }
//           return Column(
//             children: [
//               FiltersWidget(
//                 listOfItemsLength: state.barber.length.toString(),
//                 onFilterSelected: (selectedService){
//                   print("selectedService111111111111");
//                   print(selectedService);
//                   context.read<BarbersCubit>().fetchBarbers(serviceType: selectedService);
//                   print("selectedService111111111111");
//                 },
//               ),
//               SizedBox(
//                 height: 21.0,
//               ),
//               ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemCount: state.barber.length,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (BuildContext context, int index) {
//                     return BarbersItem(
//                       items: barbersListItems,
//                       index: index,
//                     );
//                   }),
//             ],
//           );
//         } else if (state is BarbersError) {
//           return Container(
//             height: 70.0,
//             width: context.width,
//             decoration: BoxDecoration(
//                 color: AppColors.errorColor,
//                 borderRadius: BorderRadius.circular(AppSizes.boxBorder)
//             ),
//             child: Center(
//               child: Text(
//                 state.message,
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           );
//         } else {
//           return Center(child: Text('Unexpected state'));
//         }
//       },
//     ),
//   );
// }
}
