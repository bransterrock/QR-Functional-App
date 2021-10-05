import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:qrapp/domain/qr_code/model/seed_model.dart';
import 'package:qrapp/domain/qr_code/model/validator_model.dart';

part 'qr_code_repo.g.dart';

@RestApi(baseUrl: "https://powerful-refuge-70768.herokuapp.com/api")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

//Get Request for Seed
  @GET("/seed")
  Future<Seed> getSeed();

//Post Request for Scanned Code
  @POST("/validateQR")
  Future<bool> validateQR(@Body() QrValidateModel validateQR);
}
