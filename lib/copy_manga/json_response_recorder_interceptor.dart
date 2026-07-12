import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class JsonResponseRecorderInterceptor extends Interceptor {
  JsonResponseRecorderInterceptor({Directory? outputDirectory})
    : outputDirectory = outputDirectory;

  final Directory? outputDirectory;
  Future<void> writeQueue = Future<void>.value();

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    writeQueue = writeQueue
        .then((_) => writeResponse(response: response))
        .catchError((Object error, StackTrace stackTrace) {
          debugPrint('记录请求与响应失败：$error\n$stackTrace');
        });

    handler.next(response);
  }

  Future<void> writeResponse({required Response<dynamic> response}) async {
    final responseJson = normalizeJson(data: response.data);
    if (responseJson == null) return;

    final outputDirectory = await resolveOutputDirectory();
    await outputDirectory.create(recursive: true);

    final request = response.requestOptions;
    final localTime = DateTime.now();
    final recordedAt = localTime.toUtc();
    final filePrefix = buildFilePrefix(timestamp: localTime, request: request);
    final encoder = const JsonEncoder.withIndent('  ');

    final exchangeFile = File(
      '${outputDirectory.path}${Platform.pathSeparator}'
      '${filePrefix}_exchange.http',
    );
    await exchangeFile.writeAsString(
      buildHttpExchange(
        response: response,
        responseJson: responseJson,
        recordedAt: recordedAt,
        encoder: encoder,
      ),
      flush: true,
    );

    debugPrint('请求记录目录：${outputDirectory.absolute.path}');
    debugPrint('完整请求与响应文件：${exchangeFile.absolute.path}');
  }

  String buildHttpExchange({
    required Response<dynamic> response,
    required Object responseJson,
    required DateTime recordedAt,
    required JsonEncoder encoder,
  }) {
    final request = response.requestOptions;
    final requestBody = formatBody(body: request.data, encoder: encoder);
    final responseBody = encoder.convert(responseJson);
    final buffer = StringBuffer()
      ..writeln('# Recorded at ${recordedAt.toIso8601String()}')
      ..writeln('### Request')
      ..writeln('${request.method} ${request.uri} HTTP/1.1')
      ..write(formatHeaders(headers: request.headers));

    if (requestBody.isNotEmpty) {
      buffer
        ..writeln()
        ..writeln(requestBody);
    }

    buffer
      ..writeln()
      ..writeln('### Response')
      ..writeln(
        'HTTP/1.1 ${response.statusCode ?? ''} ${response.statusMessage ?? ''}',
      )
      ..write(formatHeaders(headers: response.headers.map))
      ..writeln()
      ..writeln(responseBody);
    return buffer.toString();
  }

  String formatHeaders({required Map<String, dynamic> headers}) {
    final buffer = StringBuffer();
    for (final entry in headers.entries) {
      final value = entry.value;
      if (value is Iterable) {
        for (final item in value) {
          buffer.writeln('${entry.key}: $item');
        }
      } else {
        buffer.writeln('${entry.key}: $value');
      }
    }
    return buffer.toString();
  }

  String formatBody({required dynamic body, required JsonEncoder encoder}) {
    if (body == null) return '';
    if (body is String) return body;
    return encoder.convert(normalizeValue(value: body));
  }

  Future<Directory> resolveOutputDirectory() async {
    if (outputDirectory != null) return outputDirectory!;
    final externalCacheDirectories = await getExternalCacheDirectories();
    final cacheDirectory = externalCacheDirectories?.isNotEmpty == true
        ? externalCacheDirectories!.first
        : await getApplicationCacheDirectory();
    return Directory(
      '${cacheDirectory.path}${Platform.pathSeparator}'
      'copy_manga_records',
    );
  }

  String buildFilePrefix({
    required DateTime timestamp,
    required RequestOptions request,
  }) {
    final readableTime = [
      '${timestamp.year.toString().padLeft(4, '0')}-'
          '${timestamp.month.toString().padLeft(2, '0')}-'
          '${timestamp.day.toString().padLeft(2, '0')}',
      '${timestamp.hour.toString().padLeft(2, '0')}-'
          '${timestamp.minute.toString().padLeft(2, '0')}-'
          '${timestamp.second.toString().padLeft(2, '0')}-'
          '${timestamp.microsecond.toString().padLeft(6, '0')}',
    ].join('_');
    final value = [readableTime, request.method, request.uri.path].join('_');
    return value.replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');
  }

  Object? normalizeJson({required dynamic data}) {
    if (data is Map || data is List) return normalizeValue(value: data);

    if (data is String) {
      try {
        final decoded = jsonDecode(data);
        return decoded is Map || decoded is List
            ? normalizeValue(value: decoded)
            : null;
      } on FormatException {
        return null;
      }
    }

    return null;
  }

  Object? normalizeValue({required dynamic value}) {
    if (value == null || value is num || value is bool || value is String) {
      return value;
    }
    if (value is Map) {
      return value.map(
        (key, item) => MapEntry(key.toString(), normalizeValue(value: item)),
      );
    }
    if (value is Iterable) {
      return value.map((item) => normalizeValue(value: item)).toList();
    }
    if (value is FormData) {
      return <String, Object?>{
        'fields': <String, Object?>{
          for (final field in value.fields) field.key: field.value,
        },
        'files': [
          for (final file in value.files)
            <String, Object?>{
              'field': file.key,
              'filename': file.value.filename,
              'content_type': file.value.contentType?.toString(),
              'length': file.value.length,
            },
        ],
      };
    }
    return value.toString();
  }
}
