import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:trakya_news/constant/url_constant.dart';
import 'package:trakya_news/helper/http_helper.dart';
import 'package:trakya_news/helper/storage_helper.dart';
part 'notification_viewmodel.g.dart';

class NotificationsViewModel = _NotificationsViewModelBase
    with _$NotificationsViewModel;

abstract class _NotificationsViewModelBase with Store {
  @action

  Future postAlarm({date, type}) async {
    var userId = await StorageHelper.instance.getId();
    var model = await HttpHelper.httpPost(UrlConstant.postAlarm, {
      "user_id": userId,
      "date": date,
      "type": type
    });
    return model;
  }

  @action
  Future getAlarms() async {
    var userId = await StorageHelper.instance.getId();
    var model =
        await HttpHelper.httpGet(UrlConstant.getAlarms + userId.toString());
    return model;
  }

  @action
  Future deleteAlarms({date, type}) async {
    var userId = await StorageHelper.instance.getId();
    var model = await HttpHelper.httpDelete(
        urll: UrlConstant.deleteAlarm,
        sendBody: {"user_id": userId, "date": date, "type": type});
    return model;
  }
}
