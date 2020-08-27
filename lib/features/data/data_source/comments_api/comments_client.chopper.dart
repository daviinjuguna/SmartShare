// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CommentClient extends CommentClient {
  _$CommentClient([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CommentClient;

  @override
  Future<Response<dynamic>> createComments(
      String accessToken, int postId, String comments) {
    final $url = '/api/comments/create';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{'id': postId, 'comment': comments};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> editComments(
      String accessToken, int commentId, String comments) {
    final $url = '/api/comments/update';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{'id': commentId, 'comment': comments};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> deleteComments(String accessToken, int commentId) {
    final $url = '/api/comments/delete';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{'id': commentId};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }
}
