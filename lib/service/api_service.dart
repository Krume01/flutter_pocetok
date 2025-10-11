import 'package:dio/dio.dart';
import 'package:flutter_pocetok/models/klient.dart';
import 'package:retrofit/retrofit.dart';
import '../models/advokat.dart'; // патеката до твојот модел
import '../models/case.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "http://localhost:5000/api/") // или IP/домен на твојот backend
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Најава на адвокат
  @POST("advokati/login")
  Future<Advokat> login(@Body() Map<String, dynamic> data);

  // Пример: враќа листа на сите адвокати
  @GET("advokati")
  Future<List<Advokat>> getAdvokati();

  @POST("predmeti")
Future<Case> addCase(@Body() Map<String, dynamic> caseData);

@GET("predmeti")
Future<List<Case>> getCases();

 @POST("klienti")
Future<Klient> addKlient(@Body() Map<String, dynamic> klientData);

@GET("klienti")
Future<List<Klient>> getKlienti();

@PUT("klienti/{id}")
Future<Klient> updateKlient(@Path("id") int id, @Body() Map<String, dynamic> klientData);



  // Слично за други табли:
  // Клиенти
  // @GET("klienti")
  // Future<List<Klient>> getKlienti();

  // Предмети
  // @GET("predmeti")
  // Future<List<Predmet>> getPredmeti();
}
