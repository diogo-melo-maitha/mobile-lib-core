import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/widgets/address/models/address.dart';

void main() {
  group('Address model tests', () {
    test('Check types of variables', () {
      final Address address = Address(
          address: 'street 7',
          cep: '12',
          city: 'Sao Paulo',
          complement: 'none',
          district: 'ZS',
          number: '1',
          state: 'SP');
      expect(address.cep, num.tryParse(address.cep).toString());
      expect(address.number, num.tryParse(address.number).toString());

      address.number = 'S/N';
      expect(address.number, isNot(int.tryParse(address.number)));
      expect(address.state, 'SP');
    });

    test('Check if completed', () {
      final Address address = Address(
          address: 'street 7',
          cep: '12',
          city: 'Sao Paulo',
          complement: 'none',
          district: 'ZS',
          number: '1',
          state: 'SP');
      expect(address.isCompleted(), true);

      address.city = '';
      expect(address.isCompleted(), false);
    });

    test('Populate with json', () {
      final Map<String, dynamic> result = {
        'address': 'street 7',
        'cep': '12',
        'city': 'Sao Paulo',
        'complement': 'none',
        'district': 'ZS',
        'number': '1',
        'state': 'SP',
      };
      final adr = Address.fromJson(result);
      expect(adr.address, result['address']);
      expect(adr.city, result['city']);
      expect('Sao Paulo', adr.toJson()['city']);
    });
  });
}
