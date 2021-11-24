import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String cep;
  String address;
  String number;
  String complement;
  String district;
  String city;
  String state;

  Address({
    required this.cep,
    required this.address,
    required this.number,
    required this.complement,
    required this.district,
    required this.city,
    required this.state,
  });

	bool isCompleted() {
		if (cep != '' && address != '' && number != '' && complement != '' && district != '' && city != '' && state != '') {
			return true;
		}
		return false;
	}

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}