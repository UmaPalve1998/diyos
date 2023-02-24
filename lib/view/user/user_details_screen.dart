import 'package:diyos/controller/profile_controller.dart';
import 'package:diyos/helper/SizeConfig.dart';
import 'package:diyos/view/components/profile_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/style.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
 late ProfileController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     controller = Get.put(ProfileController());
     controller.userData(context);

  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,
      backgroundColor: Colors.transparent,),
      body: Container(
        height: SizeConfig.screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.3,
              child: Stack(
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.25,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 100.0)),
                      gradient: LinearGradient(
                          // begin: Alignment(0.27379170060157776, 0.9999999403953552),
                          // end: Alignment(-0.7333934307098389, 6.3976601794024646e-15),
                          colors: [
                            kPrimaryColorDark,
                            kPrimaryColorLight,
                            kPrimaryColorExtraLight
                          ])
                    ),
                    alignment: Alignment.center,
                    child: Text("Profile",style: KH1.copyWith(color: Colors.white),),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height:  SizeConfig.screenWidth * 0.25,
                      width: SizeConfig.screenWidth * 0.25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        border:Border.all(color: TextColor)
                      ),
                      child: Icon(Icons.person,size: 50,),
                    ),
                    ),

                ],
              ),
            ),
            SizedBox(height: 10,),
            GetBuilder<ProfileController>(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileText(title: "Name", value: "${controller.userDatarResponse.data?.detailsWithCategory.name??"Not available"}"),
                      SizedBox(height: 10,),
                      Divider(color: TextColor.withOpacity(0.5),),
                      SizedBox(height: 10,),
                      ProfileText(title: "Mobile number", value: "${controller.userDatarResponse.data?.detailsWithCategory.phone??"Not available"}"),
                      SizedBox(height: 10,),
                      Divider(color: TextColor.withOpacity(0.5),),
                      SizedBox(height: 10,),
                      ProfileText(title: "Email ID", value: "${controller.userDatarResponse.data?.detailsWithCategory.emailId??"Not available"}"),
                    ],
                  ),
                );
              }
            )

          ],
        ),
      ),
    );
  }
}
