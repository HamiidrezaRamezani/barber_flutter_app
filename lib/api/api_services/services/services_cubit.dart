import 'package:barber_application/api/api_services/services/services_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network_config.dart';
import '../../models/services_model.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final Dio _dio = Dio();

  ServicesCubit() : super(ServicesInitial());

  Future<void> fetchServices() async {
    emit(ServicesLoading());
    try {
      final response =
          await _dio.get(ConfigNetwork.baseUrl + ConfigNetwork.servicesUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<ServiceModel> services = data
            .map((serviceJson) => ServiceModel.fromJson(serviceJson))
            .toList();
        emit(ServicesLoaded(services));
      } else {
        emit(ServicesError('Failed to load services'));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          emit(ServicesError('Services not found (404)'));
        } else if (e.response!.statusCode == 500) {
          emit(ServicesError('Server error (500). Please try again later.'));
        } else {
          emit(ServicesError('An error occurred: ${e.response!.statusCode}'));
        }
      } else {
        emit(ServicesError('Network error: ${e.message}'));
      }
    } catch (e) {
      emit(ServicesError('An unexpected error occurred: $e'));
    }
  }
}
