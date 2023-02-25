import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helper/api.dart';
import '../view/components/common_dailog.dart';
import 'app_exception.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  bool isOpen = true;

  showErrorMessage({message, context, isExit}) {
    debugPrint("isOpen $isOpen");
    if (isOpen) {
      isOpen = !isOpen;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CommonDialog(
              title: "Error from server!",
              messageText: message,
              positiveButtonCallBack: isExit
                  ? () {
                      isOpen = !isOpen;
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      } else {
                        exit(0);
                      }
                    }
                  : () {
                      isOpen = !isOpen;
                      Navigator.pop(context);
                    },
            );
          });
    }
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  //post method calling
  Future<dynamic> post(String endPoint, var body, BuildContext context ) async {
    var uri = Uri.parse(BASE_URL + endPoint);
    // var requestBody=json.decode(body);
    bool isOffline = await check();
    debugPrint("post url--> ${uri} ${body}");
    debugPrint("Network ${isOffline}");
    try {
      if (!isOffline) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CommonDialog(
                messageText:
                    "Couldn't load. Make Sure your phone has an Internet connection and try again.",
              );
            });
      } else {
        var response = await http.post(uri,
            body: body,
            headers:  {
              HttpHeaders.contentTypeHeader: "application/json",
              "Connection": "Keep-Alive",
              "Keep-Alive": "timeout=5, max=1000"
            }

        );
        print("${response.persistentConnection} ");
        print("${response.request} ");
        print("${response.headers} ");
        return _processResponse(
            response, API_METHOD.POST, context, endPoint, body);
      }
    } on SocketException {
      throw FetchDataException("No Interent Connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api not responded in time", uri.toString());
    } catch (e) {
      debugPrint('error ${e}');
    }
  }

  //delete method caling

  //response method calling
  dynamic _processResponse(http.Response response, API_METHOD api_method,
      BuildContext context, String endPoint, dynamic body) async {
    //debugPrint("Process response ${response.body}");
    debugPrint("Status code ${response.statusCode}");
    debugPrint("endPoint ${endPoint}");
    switch (response.statusCode) {
      case 200:

        // var reponseJson = utf8.decode(response.bodyBytes);
        var reponseJson = response.body;
        debugPrint("response--> ${jsonDecode(reponseJson)}");
        return reponseJson;
      case 400:
        var reponseJson = response.body;
        return reponseJson;

      case 404:
        showErrorMessage(
            context: context,
            message: "Data not found: Something went wrong",
            isExit: false);
        throw GenericException("Internal Server Error: ${response.statusCode}",
            response.request!.url.toString());
      case 403:
        Fluttertoast.showToast(msg: "Session Expired");
        showErrorMessage(
            context: context, message: "Session Expired", isExit: false);
        // SPManager.instance.logout();
        // Get.offAll(Login());
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      case 502:
        showErrorMessage(
            context: context,
            message: "Internal Server Error: Something went wrong",
            isExit: false);
        throw GenericException("Internal Server Error: ${response.statusCode}",
            response.request!.url.toString());
      case 503:
        showErrorMessage(
            context: context, message: "Maintainence message", isExit: true);
        throw GenericException("Maintainence message: ${response.statusCode}",
            response.request!.url.toString());
      default:
        throw BadRequestException(
            "Error occured with code : ${response.statusCode}",
            response.request!.url.toString());
    }
  }

  dynamic _processResponseDoc(
    http.Response response,
  ) {
    //debugPrint("Process response ${response.body}");
    //debugPrint("Status code ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        var reponseJson = json.encode(base64.encode(response.bodyBytes));
        return reponseJson;
        break;
      case 400:
        var reponseJson = utf8.decode(response.bodyBytes);
        return reponseJson;
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 404:
        var reponseJson = utf8.decode(response.bodyBytes);
        return reponseJson;

      case 401:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw BadRequestException(
            "Error occured with code : ${response.statusCode}",
            response.request!.url.toString());
    }
  }
}

enum API_METHOD { GET, GET_WITH_REQUEST, POST, DELETE, PUT }
