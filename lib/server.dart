import 'package:http/http.dart' as http;
import 'dart:convert';

class Server {
  final url = "https://6728a249270bd0b975568bf6.mockapi.io/api/prodct";

  Future<void> addData(Map data) async {
    await http.post(Uri.parse(url), headers: {'Content-Type': 'application/json'},body: json.encode(data));
  }

  Future<dynamic> getData({productId = null}) async {
    var urlDes = productId != null ? '$url?product_id=$productId' : url;
    var response = await http.get(Uri.parse(urlDes));
    var data = json.decode(response.body);
    return data;
  }

  Future<void> updateData(int productId, Map data) async {
    await http.put(Uri.parse('$url/$productId'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data));
  }

  Future<void> deleteData(productId) async {
    await http.delete(Uri.parse('$url/$productId'));
  }
}
