import 'package:medsoftuz/DataLayer/models/TokenAuth/result.dart';

class UserAuth {

  int id;
  String jsonrpc;
  String method;
  Result result;

	UserAuth.fromJson(Map<String, dynamic> map):
		id = map["id"],
		jsonrpc = map["jsonrpc"],
		method = map["method"],
		result = Result.fromJsonMap(map["result"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['jsonrpc'] = jsonrpc;
		data['method'] = method;
		data['result'] = result == null ? null : result.toJson();
		return data;
	}
}
