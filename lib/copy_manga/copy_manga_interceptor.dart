import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import 'copy_manga_dto.dart';

class CopyMangaInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // await Future<void>.delayed(const Duration(seconds: 3));

    final now = DateTime.now();
    final timestamp = now.millisecondsSinceEpoch ~/ 1000;
    final date = [
      now.year.toString().padLeft(4, '0'),
      now.month.toString().padLeft(2, '0'),
      now.day.toString().padLeft(2, '0'),
    ].join('.');
    final secret = base64Decode('M2FmMDg1OTAzMTEwMzJlZmUwNjYwNTUwYTA1NjNhNTM=');
    final signature = Hmac(
      sha256,
      secret,
    ).convert(utf8.encode(timestamp.toString())).toString();
    options.headers.addAll({
      // "accept": "application/json",
      // "accept-encoding": "gzip",
      // "accept-language": "",
      // "authorization": "Token",
      // "content-type": "application/x-www-form-urlencoded",
      "device": "SP1A.210812.016.C2",
      "deviceinfo": "Pixel 3-blueline",
      "dt": date,
      "host": options.uri.host,
      "platform": "3",
      "pseudoid": "zo8UmdTAkNZRJ7Vs",
      "referer": "com.copymanga.app-3.0.9",
      "region": "0",
      "source": "copyApp",
      "umstring": "b4c89ca4104ea9a97750314d791520ac",
      "user-agent": "COPY/3.0.9",
      "version": "3.0.9",
      "versioncode": "83",
      "webp": "1",
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
