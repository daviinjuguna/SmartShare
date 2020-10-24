
import 'dart:io';

import 'package:SmartShare/core/utils/constants.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:http/io_client.dart' as http;

part 'post_client.chopper.dart';

@ChopperApi(baseUrl: '/')
@LazySingleton()
abstract class PostClient extends ChopperService {
  
  @factoryMethod
  static PostClient create(){
    final client = ChopperClient(
        baseUrl: BASE_URL,
        services: [_$PostClient()],
        converter: JsonConverter(),
        client: http.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 120),
        ),
        interceptors: [
          HeadersInterceptor({'Accept': 'application/json'}),
          HttpLoggingInterceptor()
        ]);
    return _$PostClient(client);
  }

  @Post(path:"api/posts/create")  //!single GetPostModel
  @multipart
  Future<Response> createUserPost(
    @Header('Authorization') String accessToken,
    @Part("desc") String postDescription,
    @PartFile("photo") String imageUrl //!nullable
  );

  // @Post(path:"api/posts/create")
  // @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  // Future<Response> createUserPostWithPhoto(
  //   @Header('Authorization') String accessToken,
  //   @Field("desc") String postDescription,
  //
  // );

  @Get(path:"api/posts") //! List GetPostModel
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> getPost(
    @Header('Authorization') String accessToken,
  );

  @Get(path:"api/posts/my_posts")
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> getMyPost(
    @Header('Authorization') String accessToken,
  );

  @Post(path:"api/posts/update")//!usess authsuccessmodel
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> editPosts(
    @Header('Authorization') String accessToken,
    @Field("id") int postId,
    @Field("desc") String postDescription,
  );

  @Post(path:"api/posts/delete")//!usess authsuccessmodel
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> deletePosts(
    @Header('Authorization') String accessToken,
    @Field("id") int postId,
  );

  @Post(path: "api/posts/like") //!uses AuthSuccessModell
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response> likePost(
    @Header('Authorization') String accessToken,
    @Field("id") int postId
  );
}