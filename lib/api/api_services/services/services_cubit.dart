import 'package:barber_application/api/api_services/services/services_bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/network_config.dart';
import '../../models/services_model.dart';

class ServicesCubit extends Cubit<ServicesState> {
  late Dio _dio;

  ServicesCubit() : super(ServicesInitial()) {
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
    ))
      ..interceptors.add(DioCacheInterceptor(options: cacheOptions));

    fetchServices();
  }

  Future<void> fetchServices() async {
    emit(ServicesLoading());
    try {
      final response = await _dio.get(
        ConfigNetwork.servicesUrl,
        options: Options(extra: {'cachePolicy': CachePolicy.refresh}),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        List<ServiceModel> services = data
            .map((serviceJson) => ServiceModel.fromJson(serviceJson))
            .toList();
        emit(ServicesLoaded(services));
      } else {
        emit(ServicesError('Failed to load services'));
      }
    } on DioException catch (e) {
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
