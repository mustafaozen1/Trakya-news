import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:trakya_news/helper/storage_helper.dart';

class HttpHelper {
  static Future httpPost(urll, Map sendBody) async {
    var token = await StorageHelper.instance.getToken();
    Uri url = Uri.parse(urll);
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(sendBody),
    );
    return response;
  }

  static Future httpGet(urll,) async {
    var token = await StorageHelper.instance.getToken();
    Uri url = Uri.parse(urll);
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "apikey": 'patronApiKey34_78',
        "Authorization": token.toString(),
      },
    );
    if (response.statusCode == 401) {
      throw HttpException(
        "Yetkisiz işlem ${response.statusCode}",
      );
    }
    if (response.statusCode != 200) {
      throw HttpException(
          "Beklenmeyen bir hata oluştu. ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      var body = await jsonDecode(response.body);
      return body;
    }
  }

  static Future httpGetToken(
    urll,
  ) async {
    var token = await StorageHelper.instance.getToken();
    Uri url = Uri.parse(urll);
    var response = await http.get(
      url,
      headers: {
        "Username": "Patron",
        "Password": "^Lw2T=!8_MWegdnh",
        "Content-Type": "application/json",
        "Authorization": token.toString(),
      },
    );
    if (response.statusCode == 401) {
      throw HttpException(
        "Yetkisiz işlem ${response.statusCode}",
      );
    }
    if (response.statusCode != 200) {
      throw HttpException(
          "Beklenmeyen bir hata oluştu. ${response.statusCode} ${url}");
    }
    if (response.statusCode == 200) {
      var body = await jsonDecode(response.body);
      return body;
    }
  }

  static Future httpDelete({urll, sendBody}) async {
    var token = await StorageHelper.instance.getToken();
    Uri url = Uri.parse(urll);
    var response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(sendBody),
    );
    return response;
  }
}
