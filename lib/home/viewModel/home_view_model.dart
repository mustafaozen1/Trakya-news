import 'package:mobx/mobx.dart';
import 'package:trakya_news/helper/http_helper.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {

  
  Future fetchNewsByCategory(String categoryUrl) async {
    var model = HttpHelper.httpGet(categoryUrl);
    return model;
  }
}
