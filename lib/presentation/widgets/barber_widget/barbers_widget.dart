import 'package:barber_application/presentation/widgets/barber_widget/barbers_item.dart';
import 'package:flutter/material.dart';

class BarbersWidget extends StatefulWidget {
  const BarbersWidget({super.key});

  @override
  State<BarbersWidget> createState() => _BarbersWidgetState();
}

class _BarbersWidgetState extends State<BarbersWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 8,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return BarbersItem();
        });
  }
}
