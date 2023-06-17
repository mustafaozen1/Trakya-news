import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../helper/http_helper.dart';

part 'phone_login_view_model.g.dart';

class PhoneLoginViewModel = _PhoneLoginViewModelBase with _$PhoneLoginViewModel;

abstract class _PhoneLoginViewModelBase with Store {
  @observable
  bool buttonclick = false;

  @observable
  bool rememberCheck = false;
}
