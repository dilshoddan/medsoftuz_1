import 'package:medsoftuz/DataLayer/models/patient/person.dart';

class PatientResult {

  Person person;

	PatientResult.fromJsonMap(Map<String, dynamic> map):
		person = Person.fromJsonMap(map["person"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['person'] = person == null ? null : person.toJson();
		return data;
	}
}
