// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AuthClient extends AuthClient {
  _$AuthClient([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthClient;

  @override
  Future<Response<dynamic>> loginUser(String email, String password) {
    final $url = '/api/login';
    final $body = <String, dynamic>{'email': email, 'password': password};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> registerUser(
      String email, String password, String passwordConfirmation) {
    final $url = '/api/register';
    final $body = <String, dynamic>{
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation
    };
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> logout(String accessToken) {
    final $url = '/api/logout';
    final $headers = {'Authorization': accessToken};
    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> refreshToken(String refreshToken) {
    final $url = '/api/refresh';
    final $body = <String, dynamic>{'refresh_token': refreshToken};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> saveUserInfo(
      String accessToken, String firstName, String lastName) {
    final $url = '/api/save_user_info';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{'name': firstName, 'last_name': lastName};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<dynamic>> saveUserInfoWithPhoto(
      String accessToken, String firstName, String lastName, String imageUrl) {
    final $url = '/api/save_user_info';
    final $headers = {'Authorization': accessToken};
    final $body = <String, dynamic>{
      'name': firstName,
      'last_name': lastName,
      'photo': imageUrl
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }
}
