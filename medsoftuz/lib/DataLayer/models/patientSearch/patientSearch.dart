import 'package:medsoftuz/DataLayer/models/patientSearch/patientSearchResult.dart';

class PatientSearch {

  int id;
  String jsonrpc;
  String method;
  List<PatientSearchResult> result;

	PatientSearch.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		jsonrpc = map["jsonrpc"],
		method = map["method"],
		result = List<PatientSearchResult>.from(map["result"].map((it) => PatientSearchResult.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['jsonrpc'] = jsonrpc;
		data['method'] = method;
		data['result'] = result != null ? 
			this.result.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
