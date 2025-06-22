import 'dart:io';
import 'package:pinata_cloud_sdk/src/models/create_signed_upload_url_response.dart';
import 'package:pinata_cloud_sdk/src/models/upload_file_response.dart';

abstract class Upload {
  Future<UploadFileResponse> uploadFile({
    required File file,
    required String name,
    String? groupId,
    String network = 'private',
    Map<String, dynamic> keyValues = const {},
  });

  Future<CreateSignedUploadUrlResponse> signUpload({
    required int date,
    required int expires,
    required int maxFileSize,
    required List<String> allowMimeTypes,
    String? groupId,
    Map<String, dynamic> keyValues = const {},
    required String filename,
  });
}
