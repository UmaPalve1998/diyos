import 'dart:convert';

import 'package:diyos/Network/base_httpclient.dart';
import 'package:diyos/helper/api.dart';
import 'package:diyos/model/profile_model.dart';
import 'package:diyos/model/profile_request.dart';
import 'package:flutter/material.dart';

class ProfileRepository {


  Future<Profile> fetchProfile(BuildContext context,
      var requestModel) async {
    final response = await HttpClient.instance.post(
        PROFILE_DETAILS, requestModel, context);
    debugPrint("Banner Repository-> ${response}");
    return Profile.fromJson(json.decode(response));
  }

}