// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    cep: json['cep'] as String,
    address: json['address'] as String,
    number: json['number'] as String,
    complement: json['complement'] as String,
    district: json['district'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'cep': instance.cep,
      'address': instance.address,
      'number': instance.number,
      'complement': instance.complement,
      'district': instance.district,
      'city': instance.city,
      'state': instance.state,
    };
