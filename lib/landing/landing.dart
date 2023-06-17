import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:trakya_news/landing/landing_viewmodel.dart';

import '../constant/color_constant.dart';
import '../helper/storage_helper.dart';
import '../login/view/login.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String? rememberCheck;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permissionCheck();
    // Future.delayed(Duration(seconds: 2), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => PhoneLogin()));
    // });
  }

  LandingViewModel landingVM = LandingViewModel();

  permissionCheck() async {
    var notifiPermission = await Permission.notification.isGranted;
    if (notifiPermission) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PhoneLogin()));
    } else {
      _dialogBuilder(context);
    }
  }

  _signUpCheck() async {
    var id = await StorageHelper.instance.getId();
    var token = await StorageHelper.instance.getToken();

    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAll(PhoneLogin());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(color: ColorConstant.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Trakya News',
                style: TextStyle(
                  color: ColorConstant.white,
                  fontSize: 40,
                )),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      barrierColor: ColorConstant.whiteForGrad,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('TRAKYA NEWS'),
          content: const Text(
              'Bu uygulamayı kullanabilmek için gerekli iznleri vermeniz gerekmektedir. Lütfen izin ayarlarınızı kontrol edin.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Uygulamayı Kapat'),
              onPressed: () {
                exit(0);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('İzin Ayarlarını Düzenle'),
              onPressed: () {
                openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }
}
