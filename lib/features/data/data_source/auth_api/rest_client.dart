import 'dart:io';

import 'package:SmartShare/core/utils/constants.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:http/io_client.dart' as http;

part 'rest_client.chopper.dart';

@ChopperApi(baseUrl: '/')
@LazySingleton()
abstract class AuthClient extends ChopperService{

  @factoryMethod
  static AuthClient create(){
    final client = ChopperClient(
        baseUrl: BASE_URL,
        services: [_$AuthClient()],
        converter: JsonConverter(),
        client: http.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 120),
        ),
        interceptors: [
          HeadersInterceptor({'Accept': 'application/json'}),
          HttpLoggingInterceptor()
        ]);
    return _$AuthClient(client);
  }

  @Post(path: 'api/login')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> loginUser(
    @Field("email") String email,
    @Field("password") String password
  );

  @Post(path: 'api/register')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> registerUser(
    @Field("email") String email,
    @Field("password") String password,
    @Field("password_confirmation") String passwordConfirmation
  );

  @Post(path: 'api/logout')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> logout(
    @Header('Authorization') String accessToken,
    // @Body() Map<String, dynamic> body,
  );

  @Post(path:"api/refresh")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> refreshToken(
    @Field("refresh_token") String refreshToken
  );

  @Post(path:"api/save_user_info")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> saveUserInfo(
    @Header('Authorization') String accessToken,
    @Field("name") String firstName,
    @Field("last_name") String lastName,
  );

  @Post(path:"api/save_user_info")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> saveUserInfoWithPhoto(
    @Header('Authorization') String accessToken,
    @Field("name") String firstName,
    @Field("last_name") String lastName,
    @Field("photo") String imageUrl
  );

  @Post(path: "api/recover_password")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> recoverPassword(
    @Field("email") String email,
  );

  @Post(path:"api/change_password")//!uses AuthSuccessModel
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> changePassword(
    @Field("pin") int pin,
    @Field("password") String password,
  );
}