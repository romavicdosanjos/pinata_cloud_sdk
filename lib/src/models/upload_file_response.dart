class UploadFileResponse {
  Data? data;

  UploadFileResponse({this.data});

  UploadFileResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? cid;
  String? createdAt;
  int? size;
  int? numberOfFiles;
  String? mimeType;
  String? userId;
  String? groupId;
  bool? isDuplicate;

  Data({
    this.id,
    this.name,
    this.cid,
    this.createdAt,
    this.size,
    this.numberOfFiles,
    this.mimeType,
    this.userId,
    this.groupId,
    this.isDuplicate,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cid = json['cid'];
    createdAt = json['created_at'];
    size = json['size'];
    numberOfFiles = json['number_of_files'];
    mimeType = json['mime_type'];
    userId = json['user_id'];
    groupId = json['group_id'];
    isDuplicate = json['is_duplicate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cid'] = cid;
    data['created_at'] = createdAt;
    data['size'] = size;
    data['number_of_files'] = numberOfFiles;
    data['mime_type'] = mimeType;
    data['user_id'] = userId;
    data['group_id'] = groupId;
    data['is_duplicate'] = isDuplicate;
    return data;
  }
}
