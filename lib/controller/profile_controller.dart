import 'dart:convert';

import 'package:diyos/Network/base_httpclient.dart';
import 'package:diyos/repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Network/api_response.dart';
import '../helper/api.dart';
import '../model/profile_model.dart';
import '../model/profile_request.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  // List<Profile> userData = <Profile>[].obs;

  late ProfileRepository _profile;
  ApiResponse<Profile> _userDatarResponse = ApiResponse.init('Login');
  ApiResponse<Profile> get userDatarResponse => _userDatarResponse;


  ProfileController() {
    _profile = ProfileRepository();
  }

  userData(BuildContext context) async {
    ProfileRequest profile = new ProfileRequest(companyId: "6", empId: "DEM000002", catName: true);

    _userDatarResponse = ApiResponse.loading('Loading...');
    try {
      Profile response = await _profile.fetchProfile(context,json.encode(profile));
      debugPrint("Banner pro ${response}");
      _userDatarResponse = ApiResponse.completed(response);
    update();
    } catch (e) {
      debugPrint('Error----> \n$e');
      _userDatarResponse = ApiResponse.error("Error");
      update();
    }
  }

}