import 'package:equatable/equatable.dart';
import '../../models/services_model.dart';

abstract class ServicesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final List<ServiceModel> services;

  ServicesLoaded(this.services);

  @override
  List<Object> get props => [services];
}

class ServicesError extends ServicesState {
  final String message;

  ServicesError(this.message);

  @override
  List<Object> get props => [message];
}
