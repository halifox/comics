import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import 'copy_manga_dto.dart';
import 'copy_manga_preferences.dart';

class CopyMangaInterceptor extends Interceptor {
  CopyMangaInterceptor(this.preferences);

  final CopyMangaPreferences preferences;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 3));

    final now = DateTime.now();
    final timestamp = now.millisecondsSinceEpoch ~/ 1000;
    final secret = base64Decode('M2FmMDg1OTAzMTEwMzJlZmUwNjYwNTUwYTA1NjNhNTM=');
    final signature = Hmac(
      sha256,
      secret,
    ).convert(utf8.encode(timestamp.toString())).toString();
    final token = preferences.token;

    options.headers.addAll({
      'User-Agent': 'COPY/3.0.6',
      'source': 'copyApp',
      'deviceinfo': preferences.getOrCreateDeviceInfo(),
      'dt':
          '${now.year}.${now.month.toString().padLeft(2, '0')}.${now.day.toString().padLeft(2, '0')}',
      'platform': '3',
      'referer': 'com.copymanga.app-3.0.6',
      'version': '3.0.6',
      'device': preferences.getOrCreateDevice(),
      'pseudoid': preferences.getOrCreatePseudoId(),
      'Accept': 'application/json',
      'region': preferences.region,
      'authorization': token == null ? 'Token' : 'Token $token',
      'umstring': 'b4c89ca4104ea9a97750314d791520ac',
      'x-auth-timestamp': timestamp.toString(),
      'x-auth-signature': signature,
    });
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final result = CopyMangaResponse.fromJson(response.data);

    if (result.code == 200) {
      response.data = result.results;
      handler.next(response);
      return;
    }

    final errorResponse = Response<dynamic>(
      requestOptions: response.requestOptions,
      data: response.data,
      headers: response.headers,
      statusCode: result.code,
      statusMessage: result.message,
      redirects: response.redirects,
      extra: response.extra,
    );
    handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: errorResponse,
        type: DioExceptionType.badResponse,
        error: result.message,
        message: result.message,
      ),
    );
  }
}
