import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

mixin Logger {
  bool get _canLog => kDebugMode;

  String _pretty(dynamic data) {
    try {
      if (data == null) return 'null';
      if (data is String) return data;
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (_) {
      return data.toString();
    }
  }

  void logRequest({
    required String url,
    required String method,
    dynamic data,
    dynamic headers,
  }) {
    if (!_canLog) return;

    log('🟦🟦🟦🟦🟦 REQUEST START 🟦🟦🟦🟦🟦', name: 'REQUEST');
    log('🔗 URL      👉 $url', name: 'REQUEST');
    log('🛠️ METHOD   👉 $method', name: 'REQUEST');
    log('🧾 HEADERS  👇\n${_pretty(headers)}', name: 'REQUEST');
    log('📦 BODY     👇\n${_pretty(data)}', name: 'REQUEST');
    log('🟦🟦🟦🟦🟦 REQUEST END 🟦🟦🟦🟦🟦', name: 'REQUEST');
  }

  void logResponse({
    required String url,
    int? statusCode,
    dynamic data,
  }) {
    if (!_canLog) return;

    log('🟩🟩🟩🟩🟩 RESPONSE START 🟩🟩🟩🟩🟩', name: 'RESPONSE');
    log('🔗 URL       👉 $url', name: 'RESPONSE');
    log('✅ STATUS    👉 $statusCode', name: 'RESPONSE');
    log('📥 DATA      👇\n${_pretty(data)}', name: 'RESPONSE');
    log('🟩🟩🟩🟩🟩 RESPONSE END 🟩🟩🟩🟩🟩', name: 'RESPONSE');
  }

  void logError({
    required String url,
    String? error,
    int? statusCode,
  }) {
    if (!_canLog) return;

    log('🟥🟥🟥🟥🟥 ERROR START 🟥🟥🟥🟥🟥', name: 'ERROR');
    log('🔗 URL       👉 $url', name: 'ERROR');
    log('❌ STATUS    👉 $statusCode', name: 'ERROR');
    log('🔥 ERROR     👇\n${_pretty(error)}', name: 'ERROR');
    log('🟥🟥🟥🟥🟥 ERROR END 🟥🟥🟥🟥🟥', name: 'ERROR');
  }
}
