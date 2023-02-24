class ProfileRequest {
  ProfileRequest({
    required this.empId,
    required this.companyId,
    required this.catName,
  });
  late final String empId;
  late final String companyId;
  late final bool catName;

  ProfileRequest.fromJson(Map<String, dynamic> json){
    empId = json['empId'];
    companyId = json['companyId'];
    catName = json['catName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['empId'] = empId;
    _data['companyId'] = companyId;
    _data['catName'] = catName;
    return _data;
  }
}