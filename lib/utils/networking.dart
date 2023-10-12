import 'dart:convert';
import 'package:hiaki_admin/model/support_list.dart';
import 'package:http/http.dart' as http;
import 'data_bucket.dart';

class Networking {
  static final Networking _instance = Networking._internal();

  static Networking getInstance() => _instance;

  // named constructor
  Networking._internal();

  // Need to be changed
  var _host = 'http://103.157.218.115/Hiaki_Client/hs/Hiaki_Client/';
  String _userName = 'Administrator';
  String _password = '';

  Networking setHost(String host) {
    _host = host;
    return _instance;
  }

  Networking setUserName(String userName) {
    _userName = userName;
    return _instance;
  }

  Future<dynamic> getMetadata(String userName, String password) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$userName:$password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};

    final response = await http.get(Uri.parse('$_host/V1/metadata_admin'),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      setAccount(username: userName, password: password);
      dynamic value = jsonDecode(response.body);
      dynamic dataUser = value['Metadata'][1]['UserName'][0];
      DataBucket.getInstance().setDataProfile(dataUser);
      dynamic dataSupport = value['Metadata'][0]['SupportList'];
      DataBucket.getInstance().setSupportPending(dataSupport);
      DataBucket.getInstance().setSupportProgress(dataSupport);
      DataBucket.getInstance().setSupportHistory(dataSupport);
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  Future<dynamic> reloadMetadata() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};

    final response = await http.get(Uri.parse('$_host/V1/metadata_admin'),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      dynamic value = jsonDecode(response.body);
      dynamic dataUser = value['Metadata'][1]['UserName'][0];
      DataBucket.getInstance().setDataProfile(dataUser);
      dynamic dataSupport = value['Metadata'][0]['SupportList'];
      DataBucket.getInstance().setSupportPending(dataSupport);
      DataBucket.getInstance().setSupportProgress(dataSupport);
      DataBucket.getInstance().setSupportHistory(dataSupport);
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  void setAccount({String username = "", String password = ""}) {
    _userName = username;
    _password = password;
  }

  Future<String> updateStatus(UpdateStatus object) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    // http: //103.157.218.115/CoffeeRoastery/hs/CoffeeRoastery/V1/CoffeeProduct?CoffeeProductCode=0001

    final response = await http.put(Uri.parse('$_host/V1/maintenance_admin'),
        headers: requestHeaders, body: jsonEncode(object.toJson()));

    if (response.statusCode == 200) {
      return "Success";
    } else {
      return response.statusCode.toString();
    }
  }

  Future<String> updateProfile(UpdateStatus object) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    // http: //103.157.218.115/CoffeeRoastery/hs/CoffeeRoastery/V1/CoffeeProduct?CoffeeProductCode=0001

    final response = await http.put(Uri.parse('$_host/V1/maintenance_admin'),
        headers: requestHeaders, body: jsonEncode(object.toJson()));

    if (response.statusCode == 200) {
      return "Success";
    } else {
      return response.statusCode.toString();
    }
  }

  Future<dynamic> createProduct(var object) async {
    // String basicAuth =
    //     'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    // Map<String, String> requestHeaders = {'authorization': basicAuth};

    final response =
        await http.post(Uri.parse('$_host/V1/CoffeeProduct'), body: object);

    return response.statusCode;
  }

  Future<dynamic> deleteAPI(String token, String productCode) async {
    // String basicAuth =
    //     'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    // Map<String, String> requestHeaders = {'authorization': basicAuth};

    final response = await http.delete(Uri.parse(
        '$_host/V1/CoffeeProduct?Token=$token&SerialNumber=$productCode'));

    return response.statusCode;
  }

  Future<dynamic> reloadData(String token) async {
    // String basicAuth =
    //     'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    // Map<String, String> requestHeaders = {'authorization': basicAuth};

    final response =
        await http.get(Uri.parse('$_host/V1/ReloadAdministrator?Token=$token'));
    if (response.statusCode == 200) {
      dynamic value = jsonDecode(response.body);
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
}
