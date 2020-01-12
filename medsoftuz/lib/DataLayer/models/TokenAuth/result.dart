
class Result {

  String token;

	Result.fromJsonMap(Map<String, dynamic> map): 
		token = map["token"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['token'] = token;
		return data;
	}
}
