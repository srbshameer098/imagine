import 'dart:convert';

import 'package:http/http.dart';
import 'package:imagine/Repository/Api/api_client.dart';
import 'package:imagine/Repository/ModelClass/ImagineModel.dart';

class ImagineApi {
  ApiClient apiClient = ApiClient();


  Future<ImagineModel> getTranslate(String text) async {
    String trendingpath = 'https://animimagine-ai.p.rapidapi.com/generateImage';
    var body = {
      "selected_model_id":"anything-v5",
      "selected_model_bsize":"512",
      "prompt":text
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return ImagineModel.fromJson(jsonDecode(response.body));
  }
}