import 'dart:io';

import 'package:SmartShare/core/utils/constants.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:http/io_client.dart' as http;

part 'comments_client.chopper.dart';

@ChopperApi(baseUrl: '/')
@LazySingleton()
abstract class CommentClient extends ChopperService {
  
  @factoryMethod
  static CommentClient create(){
    final client = ChopperClient(
        baseUrl: BASE_URL,
        services: [_$CommentClient()],
        converter: JsonConverter(),
        client: http.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 120),
        ),
        interceptors: [
          HeadersInterceptor({'Accept': 'application/json'}),
          HttpLoggingInterceptor()
        ]);
    return _$CommentClient(client);
  }

  @Post(path:"api/comments/create")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> createComments(
    @Header('Authorization') String accessToken,
    @Field("id") int postId,
    @Field("comment") String comments,
  );

  @Post(path:"api/comments/update")//!usess authsuccessmodel
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> editComments(
    @Header('Authorization') String accessToken,
    @Field("id") int commentId,
    @Field("comment") String comments,
  );

  @Post(path:"api/comments/delete")//!usess authsuccessmodel
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> deleteComments(
    @Header('Authorization') String accessToken,
    @Field("id") int commentId,
  );
}