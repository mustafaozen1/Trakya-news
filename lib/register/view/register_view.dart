import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:trakya_news/constant/url_constant.dart';
import 'package:trakya_news/helper/http_helper.dart';
import 'package:trakya_news/helper/toast_helper.dart';

import '../../constant/color_constant.dart';
import '../../login/view/login.dart';
import '../viewmodel/id_control_view_model.dart';
import "package:intl/src/intl/date_format.dart";

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? birthDate;

  TextEditingController usernameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  DateTime? selectedDate = DateTime.now();
  DateTime now = DateTime.now().toUtc().add(const Duration(hours: 3));
  String? showingDate;

  /*  Future getLocalData() async {
    preferences = await SharedPreferences.getInstance();
  } */

  @override
  Widget build(BuildContext context) {
    var _idControlViewModel = IdControlViewModel();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Observer(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstant.blackForGrad,
          ),
          body: SingleChildScrollView(
            child: Container(
              color: ColorConstant.blackForGrad,
              width: double.infinity,
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(flex: 1, child: _patronText()),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            width: Get.width * .8,
                            decoration: BoxDecoration(
                                color: ColorConstant.greyForGrad,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextField(
                                style: const TextStyle(color: Colors.white),
                                controller: nameController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[A-Za-zğıöşüĞİÖŞÜ]')),
                                ],
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: ColorConstant.white,
                                  ),
                                  border: InputBorder.none,
                                  labelText: 'Ad',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            width: Get.width * .8,
                            decoration: BoxDecoration(
                                color: ColorConstant.greyForGrad,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              controller: lastNameController,
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.start,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[A-Za-zğıöşıüĞİÖŞÜ]')),
                              ],
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: ColorConstant.white,
                                ),
                                border: InputBorder.none,
                                labelText: 'Soyad',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            width: Get.width * .8,
                            decoration: BoxDecoration(
                                color: ColorConstant.greyForGrad,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextField(
                                style: const TextStyle(color: Colors.white),
                                controller: usernameController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[A-Za-zğıöşüĞİÖŞÜ]')),
                                ],
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: ColorConstant.white,
                                  ),
                                  border: InputBorder.none,
                                  labelText: 'Kullanıcı Adı',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              width: Get.width * .8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstant.greyForGrad,
                              ),
                              child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.start,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    prefixText: "+90",
                                    icon: Icon(
                                      Icons.phone,
                                      color: ColorConstant.white,
                                    ),
                                    border: InputBorder.none,
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    labelText: 'Telefon Numarası / Mail Adresi',
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                  ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            width: Get.width * .8,
                            decoration: BoxDecoration(
                                color: ColorConstant.greyForGrad,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextField(
                                style: const TextStyle(color: Colors.white),
                                controller: mailController,
                                inputFormatters: [
                                  // FilteringTextInputFormatter.allow(
                                  //     RegExp(r'[A-Za-z_@-.]')),
                                ],
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.mail,
                                    color: ColorConstant.white,
                                  ),
                                  border: InputBorder.none,
                                  labelText: 'Mail Adresi',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        Observer(builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              width: Get.width * .8,
                              decoration: BoxDecoration(
                                  color: ColorConstant.greyForGrad,
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                controller: passwordController,
                                textAlign: TextAlign.start,
                                obscureText:
                                    !_idControlViewModel.passwordVisible,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _idControlViewModel.passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    color: ColorConstant.white.withOpacity(0.8),
                                    onPressed: () {
                                      _idControlViewModel.passwordVisible =
                                          !_idControlViewModel.passwordVisible;
                                    },
                                  ),
                                  icon: Icon(
                                    Icons.lock,
                                    color: ColorConstant.white,
                                  ),
                                  border: InputBorder.none,
                                  labelText: 'Şifre',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        }),
                        // SizedBox(
                        //     height: Get.height * 0.09,
                        //     child:
                        //         _DatePicker(screenWidth, idControlViewModel)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Get.width * 0.8,
                            height: Get.height * 0.065,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorConstant.whiteForGrad,
                            ),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: ColorConstant.whiteForGrad,
                                ),
                                onPressed: () async {
                                  var model = HttpHelper.httpPost(
                                      UrlConstant.registerUrl, {
                                    "name": nameController.text,
                                    "surname": lastNameController.text,
                                    "username": usernameController.text,
                                    "mail": mailController.text,
                                    "password": passwordController.text,
                                    "phone": phoneController.text
                                  }).then((value) {
                                    if (value.statusCode == 200) {
                                      ToastHelper.getTrueToast(
                                          "Kayıt İşlemi Başarılı.");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhoneLogin()));
                                    } else {
                                      ToastHelper.getFalseToast(
                                          "Bir sorun oluştu. Lütfen Daha Sonra Tekrar Deneyiniz.");
                                    }
                                  });
                                },
                                child: Text('Kayıt Ol',
                                    style: TextStyle(
                                        color: ColorConstant.blackForGrad,
                                        fontSize: 20))),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Zaten bir hesabım var.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(PhoneLogin());
                              },
                              child: Text(
                                'Giriş Yap',
                                style: TextStyle(
                                    color: Colors.yellow.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              style:
                                  TextButton.styleFrom(primary: Colors.yellow),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  // Padding _DatePickerOld(IdControlViewModel _idControlViewModel) {
  //   return Padding(
  //     padding: const EdgeInsets.all(4.0),
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
  //       width: Get.width * .8,
  //       decoration: BoxDecoration(
  //           color: ColorConstant.greyForGrad,
  //           borderRadius: BorderRadius.circular(8)),
  //       child: TextField(
  //         style: TextStyle(color: Colors.white),
  //         controller: _idControlViewModel.dateController,
  //         onTap: _presentDatePicker,
  //         keyboardType: TextInputType.none,
  //         textAlign: TextAlign.start,
  //         decoration: InputDecoration(
  //           icon: Icon(
  //             Icons.calendar_month,
  //             color: ColorConstant.white,
  //           ),
  //           border: InputBorder.none,
  //           labelText: 'Doğum Tarihi',
  //           labelStyle: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  IdControlViewModel idControlViewModel = IdControlViewModel();

  _presentDatePicker(IdControlViewModel idControlViewModel) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now().add(const Duration(days: 4)),
      // locale: Locale('tr', 'TR'),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      String formattedDate = DateFormat('MM.dd.yyyy').format(pickedDate);
      setState(() {
        birthDate = formattedDate;
        selectedDate = pickedDate;
      });
    });
  }

  Padding _DatePicker(
      double screenWidth, IdControlViewModel idControlViewModel) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          width: Get.width * .8,
          decoration: BoxDecoration(
              color: ColorConstant.greyForGrad,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
              TextButton(
                  onPressed: () {
                    _presentDatePicker(idControlViewModel);
                  },
                  child: Text(
                    birthDate == null ? "Doğum Tarihi Seçiniz" : birthDate!,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ))
            ],
          )),
    );
  }
}

class _patronText extends StatelessWidget {
  const _patronText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Trakya News',
        style: TextStyle(
            fontSize: 64,
            color: ColorConstant.white,
            fontWeight: FontWeight.w200));
  }
}
