import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class JsonResponseRecorderInterceptor extends Interceptor {
  JsonResponseRecorderInterceptor({Directory? outputDirectory})
    : _outputDirectory = outputDirectory ?? _defaultOutputDirectory();

  final Directory _outputDirectory;

  static Directory _defaultOutputDirectory() {
    final userProfile = Platform.environment['USERPROFILE'];
    final root = userProfile?.isNotEmpty == true
        ? '${userProfile!}${Platform.pathSeparator}Documents'
        : Directory.current.path;
    return Directory('$root${Platform.pathSeparator}开发');
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (Platform.isWindows) {
      try {
        await _writeResponse(response);
      } on Object catch (error, stackTrace) {
        debugPrint('记录响应 JSON 失败：$error\n$stackTrace');
      }
    }

    handler.next(response);
  }

  Future<void> _writeResponse(Response<dynamic> response) async {
    final json = _normalizeJson(response.data);
    if (json == null) return;

    await _outputDirectory.create(recursive: true);

    final request = response.requestOptions;
    final timestamp = DateTime.now().toUtc().toIso8601String();
    final fileName = [
      timestamp,
      request.method,
      request.uri.path,
    ].join('_').replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');

    final file = File(
      '${_outputDirectory.path}${Platform.pathSeparator}$fileName.json',
    );
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(json),
      flush: true,
    );

    debugPrint('响应 JSON 已保存：${file.path}');
  }

  Object? _normalizeJson(dynamic data) {
    if (data is Map || data is List) return data;

    if (data is String) {
      try {
        final decoded = jsonDecode(data);
        return decoded is Map || decoded is List ? decoded : null;
      } on FormatException {
        return null;
      }
    }

    return null;
  }
}
