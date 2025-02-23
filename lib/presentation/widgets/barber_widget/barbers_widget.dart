import 'package:barber_application/presentation/ui/core/ui_models/barbers_ui_models.dart';
import 'package:barber_application/presentation/widgets/barber_widget/barbers_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../api/api_services/barbers/barbers_bloc.dart';
import '../../../api/api_services/barbers/barbers_cubit.dart';
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
    return BlocProvider(
      create: (_) => BarbersCubit()..fetchBarbers(),
      child: BlocBuilder<BarbersCubit, BarbersState>(
        builder: (context, state) {
          if (state is BarbersLoading) {
            barbersListItems.clear();
            return BarbersShimmerLoading();
          } else if (state is BarbersLoaded) {
            for (var element in state.barber) {
              barbersListItems.add(BarbersUiModels(
                  name: element.fullname,
                  slug: element.slug,
                  address: element.address,
                  services: element.services,
                  avatar: element.avatar,
                  distance: element.distance,
                  isShop: element.isShop,
                  rate: element.rate));
            }
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: state.barber.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return BarbersItem(
                    items: barbersListItems,
                    index: index,
                  );
                });
          } else if (state is BarbersError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }
}
