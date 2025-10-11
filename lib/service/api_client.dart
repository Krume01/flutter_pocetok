import 'package:dio/dio.dart';
import 'api_service.dart';

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  static ApiService getService() {
    return ApiService(
      _dio,
      baseUrl: "http://10.0.2.2:5000/api/", 
      // ⚠️ Ако користиш Android емулатор:
      //     користи 10.0.2.2 наместо localhost
      // ⚠️ Ако користиш физички телефон:
      //     стави IP адреса на компјутерот (на пример: 192.168.1.5)
    );
  }
}
