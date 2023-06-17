import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import 'package:http/http.dart' as http;
import '../model/tc_auth_model.dart';
part 'id_control_view_model.g.dart';

class IdControlViewModel = _IdControlViewModelBase with _$IdControlViewModel;

abstract class _IdControlViewModelBase with Store {
  @observable
  bool isLoading = true;

  @observable
  bool passwordVisible = false;
}
