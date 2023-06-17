// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhoneLoginViewModel on _PhoneLoginViewModelBase, Store {
  late final _$buttonclickAtom =
      Atom(name: '_PhoneLoginViewModelBase.buttonclick', context: context);

  @override
  bool get buttonclick {
    _$buttonclickAtom.reportRead();
    return super.buttonclick;
  }

  @override
  set buttonclick(bool value) {
    _$buttonclickAtom.reportWrite(value, super.buttonclick, () {
      super.buttonclick = value;
    });
  }

  late final _$rememberCheckAtom =
      Atom(name: '_PhoneLoginViewModelBase.rememberCheck', context: context);

  @override
  bool get rememberCheck {
    _$rememberCheckAtom.reportRead();
    return super.rememberCheck;
  }

  @override
  set rememberCheck(bool value) {
    _$rememberCheckAtom.reportWrite(value, super.rememberCheck, () {
      super.rememberCheck = value;
    });
  }

  @override
  String toString() {
    return '''
buttonclick: ${buttonclick},
rememberCheck: ${rememberCheck}
    ''';
  }
}
