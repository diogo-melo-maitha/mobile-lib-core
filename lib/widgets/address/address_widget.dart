import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../configuration/tm_colors.dart';
import '../../tm_lib_core.dart';
import '../../utils/format_utils.dart';
import '../../utils/static_data_utils.dart';
import '../loading/rotate_sticks.dart';
import 'models/address.dart';


class AddressWidget extends StatefulWidget {
  static const Key cepTextFieldKey = Key('cepTextFieldKey');
  static const Key addressTextFieldKey = Key('addressTextFieldKey');
  static const Key numberTextFieldKey = Key('numberTextFieldKey');
  static const Key complementTextFieldKey = Key('complementTextFieldKey');
  static const Key districtTextFieldKey = Key('districtTextFieldKey');
  static const Key cityTextFieldKey = Key('cityTextFieldKey');

	final Function(String) searchCep;
	final Function(Address) callback;
	final bool isEnable;
	Address? data;
	final bool isDebug;

	AddressWidget({
		Key? key,
		required this.searchCep,
		required this.callback,
		required this.isEnable,
		this.data,
		this.isDebug = false
	}) : super(key: key);

	@override
	_AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
	bool loading = false;
	String state = '';
	Address? address;

	MaskTextInputFormatter cepMaskFormatter = MaskTextInputFormatter(mask: FormatUtils.postalCodeMask);
  MaskTextInputFormatter stateMaskFormatter = MaskTextInputFormatter(mask: '##', filter: {'#': RegExp(r'[a-zA-Z]')});

  TextEditingController cepController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();

	@override
  void initState() {
		if (widget.data != null) {
			_setTextFieldValues(widget.data!);
		}
    super.initState();
  }

	Future _searchCep(String cep) async {
		try {
			setState(() {
		  loading = true;
			});
			final data = await widget.searchCep(cep);

			address = Address(
				address: data.street,
				cep: data.cep,
				city: data.city,
				district: data.neighborhood,
				state: data.state,
				complement: '',
				number: ''
			);

			setState(() {
				loading = false;
			});
			_setTextFieldValues(address!);
		}
		catch (ex) {
			setState(() {
				loading = false;
			});
		}
	}

	void _setTextFieldValues(Address value) {
		cepController.text = FormatUtils.maskPostalCode(value.cep);
		addressController.text = value.address;
		numberController.text = value.number;
		complementController.text = value.complement;
		districtController.text = value.district;
		cityController.text = value.city;
		setState(() {
		  state = value.state;
		});
		address = value;
		_callback();
	}

	void _callback() {
		if (address != null) {
			widget.callback(address!);
		}
	}

	@override
	Widget build(BuildContext context) {
		return Material(
			color: Colors.transparent,
			child: Column(
				children: [
					Padding(
                padding: const EdgeInsets.only(left: 20, top: 60, bottom: 30),
                child: Text(
                  'Endereço da empresa',
                  style: TmFonts.bold18.merge(const TextStyle(color: TmColors.disabledText)),
                ),
              ),
              Stack(
								children: [
									Padding(
										padding: EdgeInsets.only(right: loading ? MediaQuery.of(context).size.width / 2 : 0),
										child: TmDefaultTextField(
											key: AddressWidget.cepTextFieldKey,
											onChanged: (value) {
												if (value.length == 9 || widget.isDebug) {
													FocusScope.of(context).unfocus();
													_searchCep(value);
												}
											},
											textEditingController: cepController,
											textInputAction: TextInputAction.next,
											label: 'CEP',
											isTextValid: (value) {
												return value.length == 9;
											},
											enabled: !loading && widget.isEnable,
											errorText: 'Insira um CEP válido',
											keyboardType: TextInputType.number,
											inputFormatters: [cepMaskFormatter],
										),
									),
									Visibility(
										visible: loading,
										child: const Padding(
											padding:  EdgeInsets.only(left: 20),
											child: RotateSticks(),
										),
									),
								]
							),
              Padding(
								padding: const EdgeInsets.only(top: 34, bottom: 20),
								child: TmDefaultTextField(
									key: AddressWidget.addressTextFieldKey,
									textCapitalization: TextCapitalization.sentences,
									onChanged: (value) {
										address!.address = value;
										_callback();
									},
									enabled: !loading && widget.isEnable,
									textEditingController: addressController,
									textInputAction: TextInputAction.next,
									label: 'Endereço',
									isTextValid: loading ? null : (value) {
										return value.isNotEmpty;
									},
									errorText: 'Insira o endereço da empresa'
								),
							),
              Padding(
								padding: const EdgeInsets.symmetric(horizontal: 10),
								child: Row(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Expanded(
											flex: 3,
											child: TmDefaultTextField(
												key: AddressWidget.numberTextFieldKey,
												onChanged: (value) {
													address!.number = value;
													_callback();
												},
												enabled: !loading && widget.isEnable,
												textEditingController: numberController,
												horizontalSymmetricPadding: 10,
												textInputAction: TextInputAction.next,
												label: 'Número',
												isTextValid: loading ? null : (value) {
													return value.isNotEmpty;
												},
												errorText: 'Insira o número',
												keyboardType: TextInputType.number,
												inputFormatters: [
													FilteringTextInputFormatter.allow(RegExp(r'\d')),
												],
											),
										),
										Expanded(
											flex: 4,
											child: TmDefaultTextField(
												key: AddressWidget.complementTextFieldKey,
												textCapitalization: TextCapitalization.sentences,
												onChanged: (value) {
													address!.complement = value;
													_callback();
												},
												enabled: !loading && widget.isEnable,
												textEditingController: complementController,
												horizontalSymmetricPadding: 10,
												textInputAction: TextInputAction.next,
												label: 'Complemento (opcional)',
											),
										),
									],
								),
							),
              Padding(
								padding: const EdgeInsets.symmetric(vertical: 20),
								child: TmDefaultTextField(
									key: AddressWidget.districtTextFieldKey,
									textCapitalization: TextCapitalization.sentences,
									onChanged: (value) {
										address!.district  = value;
										_callback();
									},
									enabled: !loading && widget.isEnable,
									textEditingController: districtController,
									textInputAction: TextInputAction.next,
									label: 'Bairro',
									isTextValid: loading ? null : (value) {
										return value.isNotEmpty;
									},
									errorText: 'Insira um bairro',
								),
							),
              Padding(
								padding: const EdgeInsets.only(left: 10, right: 10),
								child: Row(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Expanded(
											flex: 5,
											child: TmDefaultTextField(
												key: AddressWidget.cityTextFieldKey,
												textCapitalization: TextCapitalization.sentences,
												onChanged: (value) {
													address!.city = value;
													_callback();
												},
												enabled: !loading && widget.isEnable,
												textEditingController: cityController,
												horizontalSymmetricPadding: 10,
												label: 'Cidade',
												isTextValid: loading ? null : (value) {
													return value.isNotEmpty;
												},
												errorText: 'Insira uma cidade',
											),
										),
										Expanded(
											flex: 4,
											child: TmDropdownButton(
												horizontalSymmetricPadding: 10,
												onChanged: (value) {
													address!.state = value;
													_callback();
												},
												updateValue: state != StaticDataUtils.StatesDefault ? state : null,
												menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
												label: StaticDataUtils.StatesDefault,
												list: StaticDataUtils.states,
												borderColor: loading || !widget.isEnable ? TmColors.disabled : TmColors.primary,
												borderSize: loading || !widget.isEnable ? 1 : 2,
											),
										),
									],
								),
							)
				],
			),
		);
	}
}