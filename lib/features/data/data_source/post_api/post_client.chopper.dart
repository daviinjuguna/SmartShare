// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PostClient extends PostClient {
  _$PostClient([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PostClient;

  @override
  Future<Response<dynamic>> createUserPost(
      String accessToken, String postDescription) {
    final $url = '/api/posts/create';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{'desc': postDescription};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> createUserPostWithPhoto(
      String accessToken, String postDescription, String imageUrl) {
    final $url = '/api/posts/create';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{'desc': postDescription, 'photo': imageUrl};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> getPost(String accessToken) {
    final $url = '/api/posts';
    final $headers = {'Authorization': accessToken};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> getMyPost(String accessToken) {
    final $url = '/api/posts/my_posts';
    final $headers = {'Authorization': accessToken};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> editPosts(
      String accessToken, int postId, String postDescription) {
    final $url = '/api/posts/update';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{'id': postId, 'desc': postDescription};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> deletePosts(String accessToken, int postId) {
    final $url = '/api/posts/delete';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{'id': postId};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> likePost(String accessToken, int postId) {
    final $url = '/api/posts/like';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{'id': postId};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }
}
