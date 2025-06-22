import 'package:http/http.dart' as http;

abstract class Api {
  Future<http.Response> getEndpoint(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<http.Response> postEndpoint(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Map<String, dynamic>? queryParameters,
  });

  Future<http.StreamedResponse> postMultipartForm(
    String path, {
    required Map<String, String> fields,
    required List<http.MultipartFile> files,
    Map<String, String>? headers,
  });

  Future<http.Response> putEndpoint(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Map<String, dynamic>? queryParameters,
  });

  Future<http.Response> patchEndpoint(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Map<String, dynamic>? queryParameters,
  });

  Future<http.Response> deleteEndpoint(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Map<String, dynamic>? queryParameters,
  });
}
