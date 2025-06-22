class CreateSignedUploadUrlResponse {
  String? data;

  CreateSignedUploadUrlResponse({this.data});

  CreateSignedUploadUrlResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }
}
