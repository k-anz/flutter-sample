import 'dart:async';
import 'dart:convert';
import 'dart:io';

class ItemService {
  static const _uri =
      'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?applicationId=&keyword=';

  HttpClient _httpClient;
  String _searchWord;

  Map<String, String> queryParameters;

  ItemService(String searchWord) {
    _httpClient = new HttpClient();
    _searchWord = searchWord;
  }

  Future<List<String>> getItems({Map<String, String> queryParameters}) async {
    try {
      String _url = _uri + Uri.encodeQueryComponent(_searchWord);

      HttpClientRequest request = await _httpClient.getUrl(Uri.parse(_url));
      HttpClientResponse response = await request.close();
      StringBuffer buffer = new StringBuffer();
      await for (String a in response.transform(utf8.decoder)) {
        buffer.write(a);
      }
      var items = jsonDecode(buffer.toString());
      List<String> result = new List();

      List hoge = items['Items'];
      hoge.forEach((element) => print(element['Item']['itemName']));
      hoge.forEach((element) => result.add(element['Item']['itemName'].toString()));

      return result;

    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic e) {
    print(e);
    return new Exception('Server error; cause: $e');
  }
}
