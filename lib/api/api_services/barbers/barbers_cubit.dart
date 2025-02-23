import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network_config.dart';
import '../../models/barbers_model.dart';
import 'barbers_bloc.dart';

class BarbersCubit extends Cubit<BarbersState> {
  final Dio _dio = Dio();

  BarbersCubit() : super(BarbersInitial());

  Future<void> fetchBarbers() async {
    emit(BarbersLoading());
    try {
      final response =
      await _dio.get(ConfigNetwork.baseUrl + ConfigNetwork.barbersUrl);
      if (response.statusCode == 200) {

        final barberResponse = BarberResponse.fromJson(response.data);

        emit(BarbersLoaded(barberResponse.results));
      } else {
        emit(BarbersError('Failed to load services'));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          emit(BarbersError('Barbers not found (404)'));
        } else if (e.response!.statusCode == 500) {
          emit(BarbersError('Server error (500). Please try again later.'));
        } else {
          emit(BarbersError('An error occurred: ${e.response!.statusCode}'));
        }
      } else {
        emit(BarbersError('Network error: ${e.message}'));
      }
    } catch (e) {
      print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
      print(e);
      print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
      emit(BarbersError('An unexpected error occurred: $e'));
    }
  }
}
