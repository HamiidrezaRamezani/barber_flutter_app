import 'package:barber_application/api/models/barbers_model.dart';
import 'package:equatable/equatable.dart';

abstract class BarbersState extends Equatable {
  @override
  List<Object> get props => [];
}

class BarbersInitial extends BarbersState {}

class BarbersLoading extends BarbersState {}

class BarbersLoaded extends BarbersState {
  final List<BarberModel> barber;

  BarbersLoaded(this.barber);

  @override
  List<Object> get props => [barber];
}

class BarbersError extends BarbersState {
  final String message;

  BarbersError(this.message);

  @override
  List<Object> get props => [message];
}
