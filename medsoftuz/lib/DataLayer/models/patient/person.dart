
class Person {

  String person_id;
  String lastname;
  String firstname;
  String middlename;
  String birthdate;
  String registrationdate;
  Object passport;
  String address;
  String phone;

	Person.fromJsonMap(Map<String, dynamic> map): 
		person_id = map["person_id"],
		lastname = map["lastname"],
		firstname = map["firstname"],
		middlename = map["middlename"],
		birthdate = map["birthdate"],
		registrationdate = map["registrationdate"],
		passport = map["passport"],
		address = map["address"],
		phone = map["phone"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['person_id'] = person_id;
		data['lastname'] = lastname;
		data['firstname'] = firstname;
		data['middlename'] = middlename;
		data['birthdate'] = birthdate;
		data['registrationdate'] = registrationdate;
		data['passport'] = passport;
		data['address'] = address;
		data['phone'] = phone;
		return data;
	}
}
