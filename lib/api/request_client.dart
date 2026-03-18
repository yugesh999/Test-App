import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../api/response.dart' as responseAPI;
import '../entity/error_container.dart';
import '../main.dart';
import '../shared/services/internet_connection.dart';
import '../shared/services/show_error_widget.dart';
import '../shared/singletons/baseurl_singleton.dart';

class RequestClient {
  static RequestClient? _instance;
  late Dio _dio;

  factory RequestClient() {
    _instance = RequestClient._internal();
    return _instance!;
  }

  RequestClient._internal() {
    final options = BaseOptions(
      validateStatus: (status) {
        return status! < 501;
      },

      // baseUrl: 'https://cec8c877-f26b-4aee-ad47-6e56c83f58d2.mock.pstmn.io',
      // baseUrl: 'https://95a521c0-9b64-48c3-ad94-6db0ed1be6b0.mock.pstmn.io',
      baseUrl: BaseURL.getInstance.getBaseUrl(),

      connectTimeout: const Duration(seconds: _timeoutInSeconds), // 5 seconds
      receiveTimeout: const Duration(seconds: _timeoutInSeconds), // 3 seconds
    );
    _dio = Dio(options)
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: false,
          requestBody: false,
          responseBody: false,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
  }

  static const int _timeoutInSeconds = 60;

  Future<dynamic> get(
    String url,
    Map<String, String> headers, {
    Map<String, dynamic>? queryParameters,
  }) async {
    var isInternet = await CheckInternetConnection().isInternet();
    debugPrint('-------------------------------');
    debugPrint('GET Request');
    debugPrint(url);
    debugPrint(headers.toString());
    debugPrint('-------------------------------');
    if (isInternet) {
      _dio.options.headers = headers;
      final response = await _dio.get(url, queryParameters: queryParameters);
      if (!url.contains('login')) {
        apiHandleFunction(response.toString(), response.statusCode!);
      }
      return response;
    } else {
      showErrorMessage(
        "No Internet Connection",
        navigatorKey.currentContext!,
        type: "internet",
      );
      return 800;
    }
  }

  Future<dynamic> post(
    String url,
    Map<String, String> headers, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    var isInternet = await CheckInternetConnection().isInternet();
    debugPrint('-------------------------------');
    debugPrint('POST Request');
    debugPrint(url);
    debugPrint(headers.toString());
    debugPrint('-------------------------------');
    if (isInternet) {
      _dio.options.headers = headers;
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      if (!url.contains("login")) {
        apiHandleFunction(response.toString(), response.statusCode!);
      }
      return response;
    } else {
      showErrorMessage(
        "No Internet Connection",
        navigatorKey.currentContext!,
        type: "internet",
      );
      return 800;
    }
  }

  Future<dynamic> patch(
    String url,
    Map<String, String> headers, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    var isInternet = await CheckInternetConnection().isInternet();
    debugPrint('-------------------------------');
    debugPrint('POST Request');
    debugPrint(url);
    debugPrint(headers.toString());
    debugPrint('-------------------------------');
    if (isInternet) {
      _dio.options.headers = headers;
      final response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      if (!url.contains("login")) {
        apiHandleFunction(response.toString(), response.statusCode!);
      }
      return response;
    } else {
      showErrorMessage(
        "No Internet Connection",
        navigatorKey.currentContext!,
        type: "internet",
      );
      return 800;
    }
  }

  Future<dynamic> put(
    String url,
    Map<String, String> headers, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    var isInternet = await CheckInternetConnection().isInternet();
    debugPrint('-------------------------------');
    debugPrint('POST Request');
    debugPrint(url);
    debugPrint(headers.toString());
    debugPrint('-------------------------------');
    if (isInternet) {
      _dio.options.headers = headers;
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      if (!url.contains("login")) {
        apiHandleFunction(response.toString(), response.statusCode!);
      }
      return response;
    } else {
      showErrorMessage(
        "No Internet Connection",
        navigatorKey.currentContext!,
        type: "internet",
      );
      return 800;
    }
  }

  Future<dynamic> delete(
    String url,
    Map<String, String> headers, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    var isInternet = await CheckInternetConnection().isInternet();
    debugPrint('-------------------------------');
    debugPrint('POST Request');
    debugPrint(url);
    debugPrint(headers.toString());
    debugPrint('-------------------------------');
    if (isInternet) {
      _dio.options.headers = headers;
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      if (!url.contains("login")) {
        apiHandleFunction(response.toString(), response.statusCode!);
      }
      return response;
    } else {
      showErrorMessage(
        "No Internet Connection",
        navigatorKey.currentContext!,
        type: "internet",
      );
      return 800;
    }
  }

  apiHandleFunction(String response, int statusCode) {
    if (statusCode.toString()[0] == "2") {
      return;
    } else if (statusCode == 401) {
      showErrorMessage(
        "Please login again.",
        navigatorKey.currentContext!,
        type: "auth",
      );
    } else if (statusCode == 500) {
      final dynamic object = json.decode(response);
      final code = ErrorContainer.fromJson(object as Map<String, dynamic>);

      showErrorMessage(code.message, navigatorKey.currentContext!);
    } else if (statusCode == 503) {
    } else if (statusCode == 400) {
      if (response != "Success") {
        final dynamic object = json.decode(response);
        final code = ErrorContainer.fromJson(object as Map<String, dynamic>);

        showErrorMessage(code.message, navigatorKey.currentContext!);
      }
    } else if (statusCode == 404) {
      showErrorMessage("Not Found", navigatorKey.currentContext!);
    } else {
      final dynamic object = json.decode(response);
      try {
        final code = ErrorContainer.fromJson(object as Map<String, dynamic>);

        showErrorMessage(code.message, navigatorKey.currentContext!);
      } catch (ex) {}
    }
  }
}
