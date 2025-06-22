import 'package:pinata_cloud_sdk/src/api/api_impl.dart';
import 'package:pinata_cloud_sdk/src/services/uploads/upload.dart';
import 'package:pinata_cloud_sdk/src/services/uploads/upload_impl.dart';

class PinataCloudSdk {
  late final Upload upload;

  PinataCloudSdk({required String token}) {
    final headers = {'Authorization': 'Bearer $token'};

    upload = UploadImpl(
      api: ApiImpl(
        baseUrl: 'https://uploads.pinata.cloud/v3',
        defaultHeaders: headers,
      ),
    );
  }
}
