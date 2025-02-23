import 'package:barber_application/presentation/system_design/app_colors.dart';
import 'package:barber_application/presentation/system_design/app_sizes.dart';
import 'package:barber_application/presentation/system_design/screen_size.dart';
import 'package:barber_application/presentation/widgets/services_widget/services_item.dart';
import 'package:barber_application/presentation/widgets/services_widget/services_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_services/services/services_bloc.dart';
import '../../../api/api_services/services/services_cubit.dart';

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesCubit()..fetchServices(),
      child: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoading) {
            return ServicesShimmerLoading();
          } else if (state is ServicesError) {
            // برای بخش ارور هندلینگ
            return Container(
              height: 70.0,
              width: context.width,
              decoration: BoxDecoration(
                color: AppColors.errorColor,
                borderRadius: BorderRadius.circular(AppSizes.boxBorder)
              ),
              child: Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            );
          } else if (state is ServicesLoaded) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.services.length,
                itemBuilder: (BuildContext context, int index) {
                  final service = state.services[index];
                  return ServicesItem(
                    title: service.title,
                    image: service.icon != null ? service.icon! : '',
                    slug: service.slug,
                  );
                });
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
