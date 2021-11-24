import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/address/address_widget.dart';
import 'package:tm_lib_core/widgets/address/models/address.dart';

class CepFromRequestModel {
  String cep;
  String city;
  String neighborhood;
  String state;
  String street;

  CepFromRequestModel({
    required this.cep,
    required this.city,
    required this.neighborhood,
    required this.state,
    required this.street,
  });
}

void main() {
	const key = Key('key');

	group('AddressWidget tests', () {
		final data = Address(
			address: 'Teste',
			cep: '13318-000',
			city: 'Cidade',
			complement: '',
			district: 'Bairro',
			number: '1',
			state: 'SP'
		);

		testWidgets('AddressWidget is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          AddressWidget(
            key: key,
            callback: (value) {},
						isEnable: true,
						searchCep: (a) {},
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });

		testWidgets('AddressWidget is properly created with data', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          AddressWidget(
            key: key,
            callback: (value) {},
						isEnable: true,
						searchCep: (a) {},
						data: data,
          ),
        ),
      );
			expect(find.byKey(key), findsOneWidget);
    });

		testWidgets('AddressWidget CEP on change', (tester) async {
			final returnData = CepFromRequestModel(
				cep: '1111-111',
				city: 'city',
				neighborhood: 'neighborhood',
				state: 'state',
				street: 'street'
			);

			int testValue = 0;
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          AddressWidget(
            key: key,
            callback: (value) {},
						isEnable: true,
						searchCep: (a) {
							testValue++;
							return returnData;
						},
						data: data,
						isDebug: true,
          ),
        ),
      );

			await tester.enterText(find.byKey(AddressWidget.cepTextFieldKey), '11111-111');
			await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

			expect(testValue, 1);
			testValue = 0;
    });

		testWidgets('AddressWidget Endereço on change', (tester) async {
			int testValue = 0;
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          AddressWidget(
            key: key,
            callback: (value) {
							testValue++;
						},
						isEnable: true,
						searchCep: (a) {},
						data: data,
          ),
        ),
      );

			await tester.enterText(find.byKey(AddressWidget.addressTextFieldKey), 'Teste');
			await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

			expect(testValue, 1);
			testValue = 0;
    });

		testWidgets('AddressWidget Numero on change', (tester) async {
			int testValue = 0;
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          AddressWidget(
            key: key,
            callback: (value) {
							testValue++;
						},
						isEnable: true,
						searchCep: (a) {},
						data: data,
          ),
        ),
      );

			await tester.enterText(find.byKey(AddressWidget.numberTextFieldKey), '1');
			await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

			expect(testValue, 1);
			testValue = 0;
    });

		testWidgets('AddressWidget Complemento on change', (tester) async {
			int testValue = 0;
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          AddressWidget(
            key: key,
            callback: (value) {
							testValue++;
						},
						isEnable: true,
						searchCep: (a) {},
						data: data,
          ),
        ),
      );

			await tester.enterText(find.byKey(AddressWidget.complementTextFieldKey), 'Teste');
			await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

			expect(testValue, 2);
			testValue = 0;
    });

		testWidgets('AddressWidget Bairro on change', (tester) async {
			int testValue = 0;
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          AddressWidget(
            key: key,
            callback: (value) {
							testValue++;
						},
						isEnable: true,
						searchCep: (a) {},
						data: data,
          ),
        ),
      );

			await tester.enterText(find.byKey(AddressWidget.districtTextFieldKey), 'Teste');
			await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

			expect(testValue, 2);
			testValue = 0;
    });

		testWidgets('AddressWidget Cidade on change', (tester) async {
			int testValue = 0;
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          AddressWidget(
            key: key,
            callback: (value) {
							testValue++;
						},
						isEnable: true,
						searchCep: (a) {},
						data: data,
          ),
        ),
      );

			await tester.enterText(find.byKey(AddressWidget.cityTextFieldKey), 'Teste');
			await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

			expect(testValue, 2);
			testValue = 0;
    });
	});
}