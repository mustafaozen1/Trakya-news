import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:trakya_news/constant/url_constant.dart';
import 'package:trakya_news/helper/http_helper.dart';
import 'package:trakya_news/helper/toast_helper.dart';
import '../../constant/color_constant.dart';
import '../../helper/storage_helper.dart';
import '../../home/view/home_view.dart';
import '../../register/view/register_view.dart';
import '../viewmodel/phone_login_view_model.dart';

class PhoneLogin extends StatefulWidget {
  var rememberCheck;

  PhoneLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  PhoneLoginViewModel phoneLoginViewModel = PhoneLoginViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: ColorConstant.blackForGrad,
            width: double.infinity,
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * .1,
                ),
                Text('TRAKYA News',
                    style: TextStyle(
                        fontSize: 64,
                        color: ColorConstant.white,
                        fontWeight: FontWeight.w200)),
                SizedBox(
                  height: screenHeight * .10,
                ),
                _phoneTextField(phoneController: _phoneController),
                _passwordTextField(passwordController: _passwordController),
                Observer(builder: (_) {
                  return phoneLoginViewModel.buttonclick
                      ? const CircularProgressIndicator()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: Get.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstant.whiteForGrad,
                              ),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    primary: ColorConstant.whiteForGrad,
                                  ),
                                  onPressed: () async {
                                    var model = HttpHelper.httpPost(
                                        UrlConstant.loginUrl, {
                                      "data": _phoneController.text,
                                      "password": _passwordController.text
                                    }).then((value) async {
                                      if (value.statusCode == 200) {
                                        if (value.body == "True") {
                                          var userId = await HttpHelper.httpGet(
                                              UrlConstant.getUserId + _phoneController.text);
                                          StorageHelper.instance.saveId(userId[0][0]);
                                          var userIDD = await StorageHelper.instance.getId();
                                          ToastHelper.getTrueToast(
                                              "Giriş İşlemi Başarılı.");
                                          Navigator.push(context,MaterialPageRoute(
                                          builder: (context) =>HomeView()));
                                        }
                                      }
                                      if (value.body == "False") {
                                        ToastHelper.getTrueToast(
                                            "Kullanıcı adı veya şifre hatalı.");
                                      }
                                    });
                                  },
                                  child: Text('Giriş Yap',
                                      style: TextStyle(
                                          color: ColorConstant.deepBlue,
                                          fontSize: 20)))),
                        );
                }),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                const SignInRow(),
                // const ForgotPasswordRow()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordRow extends StatelessWidget {
  const ForgotPasswordRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Şifremi Unuttum',
            style: TextStyle(
                color: Colors.yellow.shade600,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(primary: Colors.yellow),
        )
      ],
    );
  }
}

class SignInRow extends StatelessWidget {
  const SignInRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Hesabınız yok mu?',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterView()));
          },
          child: Text(
            'Kayıt Olun',
            style: TextStyle(
                color: Colors.yellow.shade600,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          style: TextButton.styleFrom(primary: Colors.yellow),
        )
      ],
    );
  }
}

class _passwordTextField extends StatefulWidget {
  const _passwordTextField({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  State<_passwordTextField> createState() => _passwordTextFieldState();
}

class _passwordTextFieldState extends State<_passwordTextField> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        width: Get.width * .8,
        decoration: BoxDecoration(
            color: ColorConstant.greyForGrad,
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: widget._passwordController,
          onTap: () {},
          textAlign: TextAlign.start,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              color: ColorConstant.white.withOpacity(0.8),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            icon: Icon(
              Icons.lock,
              color: ColorConstant.white,
            ),
            border: InputBorder.none,
            labelText: 'Şifre',
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _phoneTextField extends StatefulWidget {
  const _phoneTextField({
    Key? key,
    required TextEditingController phoneController,
  })  : _phoneController = phoneController,
        super(key: key);

  final TextEditingController _phoneController;

  @override
  State<_phoneTextField> createState() => _phoneTextFieldState();
}

class _phoneTextFieldState extends State<_phoneTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          width: Get.width * .8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorConstant.greyForGrad,
          ),
          child: TextField(
              // inputFormatters: [
              //   LengthLimitingTextInputFormatter(10),
              // ],
              style: const TextStyle(color: Colors.white),
              controller: widget._phoneController,
              // keyboardType: TextInputType.number,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                // prefixText: "+90",
                icon: Icon(
                  Icons.phone,
                  color: ColorConstant.white,
                ),
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.white),
                labelText: 'Telefon Numarası / Kullanıcı Adı / Mail',
                labelStyle: const TextStyle(color: Colors.white),
              ))),
    );
  }
}
