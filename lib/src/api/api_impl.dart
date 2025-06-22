import 'package:http/http.dart' as http;
import 'package:pinata_cloud_sdk/src/api/api.dart';

class ApiImpl implements Api {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  ApiImpl({required this.baseUrl, this.defaultHeaders = const {}});

  Uri _buildUri(String path, Map<String, dynamic>? queryParameters) {
    return Uri.parse('$baseUrl$path').replace(
      queryParameters: queryParameters?.map(
        (k, v) => MapEntry(k, v.toString()),
      ),
    );
  }

  Map<String, String> _buildHeaders(Map<String, String>? headers) {
    return {...defaultHeaders, ...?headers};
  }

  @override
  Future<http.Response> getEndpoint(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _buildUri(path, queryParameters);
    return await http.get(uri, headers: _buildHeaders(headers));
  }

  @override
  Future<http.Response> postEndpoint(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _buildUri(path, queryParameters);
    return await http.post(uri, headers: _buildHeaders(headers), body: body);
  }

  @override
  Future<http.StreamedResponse> postMultipartForm(
    String path, {
    required Map<String, String> fields,
    required List<http.MultipartFile> files,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl$path');

    final request = http.MultipartRequest('POST', uri)
      ..fields.addAll(fields)
      ..files.addAll(files)
      ..headers.addAll(_buildHeaders(headers));

    return await request.send();
  }

  @override
  Future<http.Response> putEndpoint(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _buildUri(path, queryParameters);
    return await http.put(uri, headers: _buildHeaders(headers), body: body);
  }

  @override
  Future<http.Response> patchEndpoint(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _buildUri(path, queryParameters);
    return await http.patch(uri, headers: _buildHeaders(headers), body: body);
  }

  @override
  Future<http.Response> deleteEndpoint(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _buildUri(path, queryParameters);
    return await http.delete(uri, headers: _buildHeaders(headers), body: body);
  }
}
