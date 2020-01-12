
class PatientSearchResult {

  String id;
  String lastname;
  String firstname;
  String middlename;
  String birthdate;
  String sex;
  Object passport;
  String country;
  Object region;
  Object district;
  String address;
  String phone;
  String registrationdate;
  String person_type;
  String current_standart_phase;
  Object work;
  Object direction;
  Object order_num;
  Object order_date;
  String diagnosis;
  String agreement;
  String invoice;
  String invoice_date;
  Object state;
  Object freecategory;
  String parent_person_id;
  Object closedate;
  Object parent_person_data_id;
  Object passport_pfl;

	PatientSearchResult.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		lastname = map["lastname"],
		firstname = map["firstname"],
		middlename = map["middlename"],
		birthdate = map["birthdate"],
		sex = map["sex"],
		passport = map["passport"],
		country = map["country"],
		region = map["region"],
		district = map["district"],
		address = map["address"],
		phone = map["phone"],
		registrationdate = map["registrationdate"],
		person_type = map["person_type"],
		current_standart_phase = map["current_standart_phase"],
		work = map["work"],
		direction = map["direction"],
		order_num = map["order_num"],
		order_date = map["order_date"],
		diagnosis = map["diagnosis"],
		agreement = map["agreement"],
		invoice = map["invoice"],
		invoice_date = map["invoice_date"],
		state = map["state"],
		freecategory = map["freecategory"],
		parent_person_id = map["parent_person_id"],
		closedate = map["closedate"],
		parent_person_data_id = map["parent_person_data_id"],
		passport_pfl = map["passport_pfl"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['lastname'] = lastname;
		data['firstname'] = firstname;
		data['middlename'] = middlename;
		data['birthdate'] = birthdate;
		data['sex'] = sex;
		data['passport'] = passport;
		data['country'] = country;
		data['region'] = region;
		data['district'] = district;
		data['address'] = address;
		data['phone'] = phone;
		data['registrationdate'] = registrationdate;
		data['person_type'] = person_type;
		data['current_standart_phase'] = current_standart_phase;
		data['work'] = work;
		data['direction'] = direction;
		data['order_num'] = order_num;
		data['order_date'] = order_date;
		data['diagnosis'] = diagnosis;
		data['agreement'] = agreement;
		data['invoice'] = invoice;
		data['invoice_date'] = invoice_date;
		data['state'] = state;
		data['freecategory'] = freecategory;
		data['parent_person_id'] = parent_person_id;
		data['closedate'] = closedate;
		data['parent_person_data_id'] = parent_person_data_id;
		data['passport_pfl'] = passport_pfl;
		return data;
	}
}
