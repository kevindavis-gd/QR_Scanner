import "package:http/http.dart" as http;
import "dart:async";
import "dart:convert";

class Data {
  Future<String> getData( String url) async {var response = await http.get(Uri.encodeFull(url));
    var data = json.decode(response.body);

    print(data);
  }

  Future<http.Response> postData() {
    var a = http.post(Uri.encodeFull('https://jsonplaceholder.typicode.com/posts/1'));

    print(a);
  }
}
