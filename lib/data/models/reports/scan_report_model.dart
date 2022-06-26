class ScanReportModel {
  String? status;
  List<Response>? response;

  ScanReportModel({this.status, this.response});

  ScanReportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? id;
  String? guardId;
  String? jobId;
  String? chekpointNo;
  String? jobName;
  String? jobAddress;
  String? uniqueCode;
  String? geotag;
  String? checkpointDateTime;

  Response(
      {this.id,
        this.guardId,
        this.jobId,
        this.chekpointNo,
        this.jobName,
        this.jobAddress,
        this.uniqueCode,
        this.geotag,
        this.checkpointDateTime});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guardId = json['guard_id'];
    jobId = json['job_id'];
    chekpointNo = json['chekpoint_no'];
    jobName = json['job_name'];
    jobAddress = json['job_address'];
    uniqueCode = json['unique_code'];
    geotag = json['geotag'];
    checkpointDateTime = json['checkpoint_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['guard_id'] = guardId;
    data['job_id'] = jobId;
    data['chekpoint_no'] = chekpointNo;
    data['job_name'] = jobName;
    data['job_address'] = jobAddress;
    data['unique_code'] = uniqueCode;
    data['geotag'] = geotag;
    data['checkpoint_date_time'] = checkpointDateTime;
    return data;
  }
}
