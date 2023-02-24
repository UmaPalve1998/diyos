import 'package:diyos/helper/style.dart';
import 'package:flutter/material.dart';

import '../../helper/SizeConfig.dart';


class CommonDialog extends StatefulWidget {
  final String? messageText;
  final String? title;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final bool? isNegativeButtonShow;
  final VoidCallback? positiveButtonCallBack;
  final VoidCallback? negativeButtonCallBack;

  const CommonDialog({
    Key? key,
    required this.messageText,
    this.title,
    this.positiveButtonText,
    this.negativeButtonText,
    this.isNegativeButtonShow,
    this.positiveButtonCallBack,
    this.negativeButtonCallBack,


  }) :
        super(key: key);

  @override
  _CommonDialogState createState() => _CommonDialogState();
}

class _CommonDialogState extends State<CommonDialog> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SimpleDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      elevation: 0,
      backgroundColor: Colors.transparent,
      children: [

     Container(
      width: SizeConfig.screenWidth / 1.2,
                padding:  const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color:  Colors.white,
                  borderRadius:  BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 8),
                      child: Text(
                        widget.title??'',
                        maxLines: 1,
                        style: KH3_medium.copyWith(
                            fontSize:14
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 8,bottom: 16),
                      child: Text(
                        widget.messageText??'',
                        maxLines: 4,
                        style: KH3_medium.copyWith(
                            fontSize:14
                        ),
                      ),
                    ),
                    const SizedBox(height: 28,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        InkWell(
                          onTap: widget.positiveButtonCallBack,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            margin: const EdgeInsets.only(bottom: 8),
                            width: (SizeConfig.screenWidth / 2) - 90,
                            padding: const EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              color: kPrimaryColorDark,
                              borderRadius: BorderRadius.all(Radius.circular(34)),
                            ),
                            child: Center(
                              child:
                                  Text(widget.positiveButtonText??'OK', style: KH3_medium.copyWith(color: Colors.white, fontSize:16)),
                            ),
                          ),
                        ),
                       if(widget.isNegativeButtonShow??false)
                         InkWell(
                           onTap: widget.negativeButtonCallBack,
                           child: Container(
                             alignment: Alignment.bottomCenter,
                             margin: const EdgeInsets.only(bottom: 8),
                             width: (SizeConfig.screenWidth / 2) - 90,
                             padding: const EdgeInsets.all(9),
                             child: Center(
                               child:
                               Text(widget.negativeButtonText??'Cancel', style: KH3_bold.copyWith(color: Colors.white,
                                   fontSize:16
                               )),
                             ),
                             decoration: BoxDecoration(
                               color: kPrimaryColorDark,
                               borderRadius: BorderRadius.all(Radius.circular(34)),
                             ),
                           ),
                         )
                       ,
                      ],
                    ),
                  ],
                ),
              ),
            // ),

      ],
    );
  }
}
