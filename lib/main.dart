import 'package:barber_application/api/api_services/barbers/barbers_cubit.dart';
import 'package:barber_application/presentation/ui/screens/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/api_services/services/services_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ServicesCubit()..fetchServices()),
      BlocProvider(create: (context) => BarbersCubit()..fetchBarbers()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IndexScreen(),
    );
  }
}
