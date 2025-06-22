import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pinata_cloud_sdk/src/api/api.dart';
import 'package:pinata_cloud_sdk/src/models/create_signed_upload_url_response.dart';
import 'package:pinata_cloud_sdk/src/models/upload_file_response.dart';
import 'package:pinata_cloud_sdk/src/services/uploads/upload.dart';

class UploadImpl implements Upload {
  final Api api;

  UploadImpl({required this.api});

  @override
  Future<UploadFileResponse> uploadFile({
    required File file,
    required String name,
    String? groupId,
    String network = 'private',
    Map<String, dynamic> keyValues = const {},
  }) async {
    final fields = <String, String>{
      'network': network,
      'name': name,
      'keyvalues': jsonEncode(keyValues),
      if (groupId != null) 'group_id': groupId,
    };

    final multipartFile = await http.MultipartFile.fromPath(
      'file',
      file.path,
      filename: file.uri.pathSegments.last,
    );

    final streamedResponse = await api.postMultipartForm(
      'files',
      fields: fields,
      files: [multipartFile],
    );

    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return UploadFileResponse.fromJson(json);
    } else {
      throw HttpException(
        'Error to upload: ${response.statusCode} - ${response.body}',
      );
    }
  }

  @override
  Future<CreateSignedUploadUrlResponse> signUpload({
    required int date,
    required int expires,
    required int maxFileSize,
    required List<String> allowMimeTypes,
    String? groupId,
    Map<String, dynamic> keyValues = const {},
    required String filename,
  }) async {
    final body = jsonEncode({
      'date': date,
      'expires': expires,
      'max_file_size': maxFileSize,
      'allow_mime_types': allowMimeTypes,
      'group_id': groupId,
      'keyvalues': keyValues,
      'filename': filename,
    });

    final response = await api.postEndpoint('files/sign', body: body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CreateSignedUploadUrlResponse.fromJson(json);
    } else {
      throw HttpException(
        'Error signing upload: ${response.statusCode} - ${response.body}',
      );
    }
  }
}
