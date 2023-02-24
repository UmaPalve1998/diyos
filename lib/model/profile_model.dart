// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.success,
    this.msg,
    this.empDetails,
    required this.detailsWithCategory,
    required this.loginDetails,
    this.profileImage,
    this.imageUrl,
  });

  bool success;
  dynamic msg;
  dynamic empDetails;
  DetailsWithCategory detailsWithCategory;
  LoginDetails loginDetails;
  dynamic profileImage;
  dynamic imageUrl;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    success: json["success"],
    msg: json["msg"],
    empDetails: json["empDetails"],
    detailsWithCategory: DetailsWithCategory.fromJson(json["detailsWithCategory"]),
    loginDetails: LoginDetails.fromJson(json["loginDetails"]),
    profileImage: json["profileImage"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
    "empDetails": empDetails,
    "detailsWithCategory": detailsWithCategory.toJson(),
    "loginDetails": loginDetails.toJson(),
    "profileImage": profileImage,
    "imageUrl": imageUrl,
  };
}

class DetailsWithCategory {
  DetailsWithCategory({
    this.sosNumber,
    required this.empStatus,
    required this.empFatherName,
    required this.aadhaarid,
    required this.panNo,
    this.insurancePolicy,
    required this.empUanNumber,
    required this.empBankAcNo,
    required this.reportingManager,
    required this.gpsTracking,
    this.reportView,
    required this.catName,
    required this.clientCatId,
    required this.name,
    required this.address,
    required this.branch,
    required this.shiftStartTime,
    required this.shiftEndTime,
    required this.shift,
    required this.sitePostedTo,
    required this.createdDateTime,
    required this.phone,
    required this.gender,
    this.modifiedBy,
    required this.createdBy,
    required this.companyId,
    required this.roleId,
    required this.empId,
    required this.designation,
    required this.emailId,
    required this.oldEmpid,
    required this.dob,
    required this.doj,
    required this.area,
    required this.isActive,
    this.modifiedDateTime,
  });

  dynamic sosNumber;
  int empStatus;
  String empFatherName;
  String aadhaarid;
  String panNo;
  dynamic insurancePolicy;
  String empUanNumber;
  String empBankAcNo;
  String reportingManager;
  bool gpsTracking;
  dynamic reportView;
  String catName;
  String clientCatId;
  String name;
  String address;
  String branch;
  String shiftStartTime;
  String shiftEndTime;
  String shift;
  String sitePostedTo;
  DateTime createdDateTime;
  String phone;
  String gender;
  dynamic modifiedBy;
  String createdBy;
  String companyId;
  String roleId;
  String empId;
  int designation;
  String emailId;
  String oldEmpid;
  DateTime dob;
  DateTime doj;
  String area;
  String isActive;
  dynamic modifiedDateTime;

  factory DetailsWithCategory.fromJson(Map<String, dynamic> json) => DetailsWithCategory(
    sosNumber: json["sosNumber"],
    empStatus: json["empStatus"],
    empFatherName: json["empFatherName"],
    aadhaarid: json["aadhaarid"],
    panNo: json["panNo"],
    insurancePolicy: json["insurancePolicy"],
    empUanNumber: json["empUANNumber"],
    empBankAcNo: json["empBankAcNo"],
    reportingManager: json["reportingManager"],
    gpsTracking: json["gpsTracking"],
    reportView: json["reportView"],
    catName: json["catName"],
    clientCatId: json["clientCatId"],
    name: json["name"],
    address: json["address"],
    branch: json["branch"],
    shiftStartTime: json["shiftStartTime"],
    shiftEndTime: json["shiftEndTime"],
    shift: json["shift"],
    sitePostedTo: json["sitePostedTo"],
    createdDateTime: DateTime.parse(json["createdDateTime"]),
    phone: json["phone"],
    gender: json["gender"],
    modifiedBy: json["modifiedBy"],
    createdBy: json["createdBy"],
    companyId: json["companyId"],
    roleId: json["roleId"],
    empId: json["empId"],
    designation: json["designation"],
    emailId: json["emailId"],
    oldEmpid: json["oldEmpid"],
    dob: DateTime.parse(json["dob"]),
    doj: DateTime.parse(json["doj"]),
    area: json["area"],
    isActive: json["isActive"],
    modifiedDateTime: json["modifiedDateTime"],
  );

  Map<String, dynamic> toJson() => {
    "sosNumber": sosNumber,
    "empStatus": empStatus,
    "empFatherName": empFatherName,
    "aadhaarid": aadhaarid,
    "panNo": panNo,
    "insurancePolicy": insurancePolicy,
    "empUANNumber": empUanNumber,
    "empBankAcNo": empBankAcNo,
    "reportingManager": reportingManager,
    "gpsTracking": gpsTracking,
    "reportView": reportView,
    "catName": catName,
    "clientCatId": clientCatId,
    "name": name,
    "address": address,
    "branch": branch,
    "shiftStartTime": shiftStartTime,
    "shiftEndTime": shiftEndTime,
    "shift": shift,
    "sitePostedTo": sitePostedTo,
    "createdDateTime": createdDateTime.toIso8601String(),
    "phone": phone,
    "gender": gender,
    "modifiedBy": modifiedBy,
    "createdBy": createdBy,
    "companyId": companyId,
    "roleId": roleId,
    "empId": empId,
    "designation": designation,
    "emailId": emailId,
    "oldEmpid": oldEmpid,
    "dob": dob.toIso8601String(),
    "doj": doj.toIso8601String(),
    "area": area,
    "isActive": isActive,
    "modifiedDateTime": modifiedDateTime,
  };
}

class LoginDetails {
  LoginDetails({
    required this.id,
    required this.empId,
    required this.userName,
    required this.password,
    required this.createdDateTime,
    this.updatedDateTime,
    this.emailId,
    required this.companyId,
    this.clientId,
    required this.role,
    required this.pushCode,
    required this.lastSeen,
    required this.rated,
    required this.phoneNumber,
  });

  String id;
  String empId;
  String userName;
  String password;
  String createdDateTime;
  dynamic updatedDateTime;
  dynamic emailId;
  String companyId;
  dynamic clientId;
  String role;
  String pushCode;
  DateTime lastSeen;
  bool rated;
  String phoneNumber;

  factory LoginDetails.fromJson(Map<String, dynamic> json) => LoginDetails(
    id: json["id"],
    empId: json["empId"],
    userName: json["userName"],
    password: json["password"],
    createdDateTime: json["createdDateTime"],
    updatedDateTime: json["updatedDateTime"],
    emailId: json["emailId"],
    companyId: json["companyId"],
    clientId: json["clientId"],
    role: json["role"],
    pushCode: json["pushCode"],
    lastSeen: DateTime.parse(json["lastSeen"]),
    rated: json["rated"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "empId": empId,
    "userName": userName,
    "password": password,
    "createdDateTime": createdDateTime,
    "updatedDateTime": updatedDateTime,
    "emailId": emailId,
    "companyId": companyId,
    "clientId": clientId,
    "role": role,
    "pushCode": pushCode,
    "lastSeen": lastSeen.toIso8601String(),
    "rated": rated,
    "phoneNumber": phoneNumber,
  };
}
