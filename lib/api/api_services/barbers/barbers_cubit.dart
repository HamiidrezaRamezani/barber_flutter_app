import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/network_config.dart';
import '../../models/barbers_model.dart';
import 'barbers_bloc.dart';

class BarbersCubit extends Cubit<BarbersState> {
  late Dio _dio;

  BarbersCubit() : super(BarbersInitial()) {
    _initDio();
  }

  Future<void> _initDio() async {
    final dir = await getTemporaryDirectory();
    final cacheStore = HiveCacheStore(dir.path);

    final cacheOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.refreshForceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.high,
    );

    _dio = Dio(BaseOptions(
      baseUrl: ConfigNetwork.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ))..interceptors.add(DioCacheInterceptor(options: cacheOptions));

    fetchBarbers(); // درخواست را پس از مقداردهی ارسال کن
  }

  Future<void> fetchBarbers() async {
    emit(BarbersLoading());
    try {
      final response = await _dio.get(
        ConfigNetwork.barbersUrl,
        options: Options(extra: {'cachePolicy': CachePolicy.refresh}),
      );

      if (response.statusCode == 200) {
        final barberResponse = BarberResponse.fromJson(response.data);
        emit(BarbersLoaded(barberResponse.results));
      } else {
        emit(BarbersError('Failed to load barbers'));
      }
    } on DioException catch (e) {
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
      print("error: $e");
    }
  }
}
