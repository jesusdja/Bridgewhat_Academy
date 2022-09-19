import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestStatic extends http.BaseClient {
  final http.Client _client = http.Client();

  RequestStatic();

  Uri endpoint(String url) {
    return Uri.parse("https://platform-backend.staging.bridgewhat.com/public/api/$url");
  }

  void _logEndpoint(String method, String url) {
    debugPrint('[${method.toUpperCase().toString()}] ${endpoint(url).toString()}');
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Content-type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    request.headers['Cache-Control'] = 'no-cache';

    return _client.send(request);
  }

  @override
  Future<http.Response> head(url, {Map<String, String>? headers}) {
    _logEndpoint('head', url.toString());
    return _client.head(endpoint(url.toString()), headers: headers);
  }

  @override
  Future<http.Response> get(url, {Map<String, String>? headers}) {
    _logEndpoint('get', url.toString());
    return _client.get(endpoint(url.toString()), headers: headers);
  }

  @override
  Future<http.Response> post(url,{Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('post', url.toString());
    return _client.post(endpoint(url.toString()),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> put(url,{Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('put', url.toString());
    return _client.put(endpoint(url.toString()),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> delete(url,{Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('delete', url.toString());
    return _client.delete(endpoint(url.toString()),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> patch(url,{Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('patch', url.toString());
    return _client.patch(endpoint(url.toString()),
        headers: headers, body: body, encoding: encoding);
  }
}
