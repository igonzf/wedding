import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invitacion/model/feedback.dart';
import 'package:invitacion/controller/form_controller.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'dart:io';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final Function testFunction;
  const MyCustomForm({required this.testFunction});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final FormController formController = FormController();
  final _formKey = GlobalKey<FormState>();
  bool? _isPrebodaSelected;
  bool? _isBusSelected;
  bool? _isPrebodaSelected1;
  bool? _isBusSelected1;
  bool? _isPrebodaSelected2;
  bool? _isBusSelected2;
  bool? _isPrebodaSelected3;
  bool? _isBusSelected3;
  bool _isAcompanianteSelected = false;
  int numA = 1;
  final _nameController = TextEditingController();
  final _foodController = TextEditingController();
  final _nameController1 = TextEditingController();
  final _foodController1 = TextEditingController();
  final _nameController2 = TextEditingController();
  final _foodController2 = TextEditingController();
  final _nameController3 = TextEditingController();
  final _foodController3 = TextEditingController();
  List<TextEditingController> _nameControllers = [];
  List<TextEditingController> _foodControllers = [];
  List<bool?> _busControllers = [];
  List<bool?> _prebodaControllers = [];
  int _successfulFormsCount = 0;
  int _totalFormsCount = 0;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Form(
        key: _formKey,
        child: Card(
          elevation: 20,
          child: Container(
            width: screenWidth * 0.9,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 235, 231),
            ),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          child: Text(
                        'Nombre y apellidos',
                        style: GoogleFonts.cormorantGaramond(
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ))),
                  TextFormField(
                    // The validator receives the text that the user has entered.
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Porfavor rellena el campo';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          child: Text(
                        'Si tienes alguna alergia/intolerancia o eres vegano/vegetariano, por favor indica el tipo de alergia/intolerancia o dieta',
                        style: GoogleFonts.cormorantGaramond(
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ))),
                  TextFormField(
                    controller: _foodController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '¿Necesitas autobús?',
                            style: GoogleFonts.cormorantGaramond(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Catedral - El Cigarral 14:30 h.\nEl Cigarral - Catedral 1:00 h.',
                            style: GoogleFonts.cormorantGaramond(
                                fontSize: screenHeight * 0.022,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ))),
                  Row(children: [
                    Expanded(
                        child: RadioListTile<bool>(
                      title: const Text('Sí'),
                      value: true,
                      groupValue: _isBusSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          _isBusSelected = value;
                        });
                      },
                    )),
                    Expanded(
                        child: RadioListTile<bool>(
                      title: const Text('No'),
                      value: false,
                      groupValue: _isBusSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          _isBusSelected = value;
                        });
                      },
                    ))
                  ]),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          child: Text(
                        '¿Vas a asistir a la preboda?',
                        style: GoogleFonts.cormorantGaramond(
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ))),
                  Row(children: [
                    Expanded(
                        child: RadioListTile<bool>(
                      title: const Text('Sí'),
                      value: true,
                      groupValue: _isPrebodaSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          _isPrebodaSelected = value;
                        });
                      },
                    )),
                    Expanded(
                        child: RadioListTile<bool>(
                      title: const Text('No'),
                      value: false,
                      groupValue: _isPrebodaSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          _isPrebodaSelected = value;
                        });
                      },
                    )),
                  ]),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          child: Text(
                        '¿Vas a venir acompañado/a?',
                        style: GoogleFonts.cormorantGaramond(
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ))),
                  Row(children: [
                    Expanded(
                        child: RadioListTile<bool>(
                      title: const Text('Sí'),
                      value: true,
                      groupValue: _isAcompanianteSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          _isAcompanianteSelected = value!;
                        });
                      },
                    )),
                    Expanded(
                        child: RadioListTile<bool>(
                      title: const Text('No'),
                      value: false,
                      groupValue: _isAcompanianteSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          _isAcompanianteSelected = value!;
                        });
                      },
                    )),
                  ]),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Align(
                      child: _isAcompanianteSelected
                          ? Container(
                              child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Selecciona el número de acompañantes',
                                      style: GoogleFonts.cormorantGaramond(
                                          fontSize: screenHeight * 0.03,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                    )),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: CustomNumberPicker(
                                        initialValue: 1,
                                        minValue: 1,
                                        maxValue: 3,
                                        step: 1,
                                        customAddButton: Icon(Icons.add),
                                        customMinusButton: Icon(Icons.remove),
                                        onValue: onChanged))
                              ],
                            ))
                          : Container()),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
//---------------------------------------------------------------------------------------------
////ACOMPAÑANTE 1
//---------------------------------------------------------------------------------------------
                  Align(
                      child: CustomVisibility(
                          conditions: [_isAcompanianteSelected, (numA >= 1)],
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    'Acompañante 1',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    'Nombre y apellidos',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              TextFormField(
                                // The validator receives the text that the user has entered.
                                controller: _nameController1,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Porfavor rellena el campo';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    'Si tienes alguna alergia/intolerancia o eres vegano/vegetariano, por favor indica el tipo de alergia/intolerancia o dieta',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              TextFormField(
                                controller: _foodController1,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '¿Necesitas autobús?',
                                        style: GoogleFonts.cormorantGaramond(
                                            fontSize: screenHeight * 0.03,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Catedral - El Cigarral 14:30 h.\nEl Cigarral - Catedral 1:00 h.',
                                        style: GoogleFonts.cormorantGaramond(
                                            fontSize: screenHeight * 0.022,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  ))),
                              Row(children: [
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('Sí'),
                                  value: true,
                                  groupValue: _isBusSelected1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isBusSelected1 = value;
                                    });
                                  },
                                )),
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('No'),
                                  value: false,
                                  groupValue: _isBusSelected1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isBusSelected1 = value;
                                    });
                                  },
                                ))
                              ]),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    '¿Vas a asistir a la preboda?',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              Row(children: [
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('Sí'),
                                  value: true,
                                  groupValue: _isPrebodaSelected1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isPrebodaSelected1 = value;
                                    });
                                  },
                                )),
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('No'),
                                  value: false,
                                  groupValue: _isPrebodaSelected1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isPrebodaSelected1 = value;
                                    });
                                  },
                                )),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                            ],
                          ))),
//---------------------------------------------------------------------------------------------
////ACOMPAÑANTE 2
//---------------------------------------------------------------------------------------------
                  Align(
                      child: CustomVisibility(
                          conditions: [_isAcompanianteSelected, (numA >= 2)],
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    'Acompañante 2',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    'Nombre y apellidos',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              TextFormField(
                                // The validator receives the text that the user has entered.
                                controller: _nameController2,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Porfavor rellena el campo';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    'Si tienes alguna alergia/intolerancia o eres vegano/vegetariano, por favor indica el tipo de alergia/intolerancia o dieta',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              TextFormField(
                                controller: _foodController2,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '¿Necesitas autobús?',
                                        style: GoogleFonts.cormorantGaramond(
                                            fontSize: screenHeight * 0.03,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Catedral - El Cigarral 14:30 h.\nEl Cigarral - Catedral 1:00 h.',
                                        style: GoogleFonts.cormorantGaramond(
                                            fontSize: screenHeight * 0.022,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  ))),
                              Row(children: [
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('Sí'),
                                  value: true,
                                  groupValue: _isBusSelected2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isBusSelected2 = value;
                                    });
                                  },
                                )),
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('No'),
                                  value: false,
                                  groupValue: _isBusSelected2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isBusSelected2 = value;
                                    });
                                  },
                                ))
                              ]),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    '¿Vas a asistir a la preboda?',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              Row(children: [
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('Sí'),
                                  value: true,
                                  groupValue: _isPrebodaSelected2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isPrebodaSelected2 = value;
                                    });
                                  },
                                )),
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('No'),
                                  value: false,
                                  groupValue: _isPrebodaSelected2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isPrebodaSelected2 = value;
                                    });
                                  },
                                )),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                            ],
                          ))),
//---------------------------------------------------------------------------------------------
////ACOMPAÑANTE 3
//---------------------------------------------------------------------------------------------
                  Align(
                      child: CustomVisibility(
                          conditions: [_isAcompanianteSelected, (numA >= 3)],
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    'Acompañante 3',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    'Nombre y apellidos',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              TextFormField(
                                // The validator receives the text that the user has entered.
                                controller: _nameController3,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Porfavor rellena el campo';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    'Si tienes alguna alergia/intolerancia o eres vegano/vegetariano, por favor indica el tipo de alergia/intolerancia o dieta',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              TextFormField(
                                controller: _foodController3,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '¿Necesitas autobús?',
                                        style: GoogleFonts.cormorantGaramond(
                                            fontSize: screenHeight * 0.03,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Catedral - El Cigarral 14:30 h.\nEl Cigarral - Catedral 1:00 h.',
                                        style: GoogleFonts.cormorantGaramond(
                                            fontSize: screenHeight * 0.022,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                      )
                                    ],
                                  ))),
                              Row(children: [
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('Sí'),
                                  value: true,
                                  groupValue: _isBusSelected3,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isBusSelected3 = value;
                                    });
                                  },
                                )),
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('No'),
                                  value: false,
                                  groupValue: _isBusSelected3,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isBusSelected3 = value;
                                    });
                                  },
                                ))
                              ]),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text(
                                    '¿Vas a asistir a la preboda?',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ))),
                              Row(children: [
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('Sí'),
                                  value: true,
                                  groupValue: _isPrebodaSelected3,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isPrebodaSelected3 = value;
                                    });
                                  },
                                )),
                                Expanded(
                                    child: RadioListTile<bool>(
                                  title: const Text('No'),
                                  value: false,
                                  groupValue: _isPrebodaSelected3,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isPrebodaSelected3 = value;
                                    });
                                  },
                                )),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                            ],
                          ))),

                  Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            // Validate returns true if the form is valid, or false otherwise.
                            _nameControllers = [
                              _nameController,
                              _nameController1,
                              _nameController2,
                              _nameController3
                            ];
                            _foodControllers = [
                              _foodController,
                              _foodController1,
                              _foodController2,
                              _foodController3
                            ];
                            _busControllers = [
                              _isBusSelected,
                              _isBusSelected1,
                              _isBusSelected2,
                              _isBusSelected3
                            ];
                            _prebodaControllers = [
                              _isPrebodaSelected,
                              _isPrebodaSelected1,
                              _isPrebodaSelected2,
                              _isBusSelected3
                            ];

                            String bus = _validateBusSelection();
                            String preboda = _validatePSelection();
                            if (bus != '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(bus),
                                    backgroundColor: Colors.red),
                              );
                            } else if (preboda != '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(preboda),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }

                            _successfulFormsCount = 0;
                            _totalFormsCount =
                                _isAcompanianteSelected ? numA + 1 : 1;

                            if (_formKey.currentState!.validate() &&
                                _isPrebodaSelected != null &&
                                _isBusSelected != null &&
                                bus == '' &&
                                preboda == '') {
                              if (_isAcompanianteSelected) {
                                for (var i = 0; i <= numA; i++) {
                                  _submitFeedbackForm(
                                      _nameControllers[i].text,
                                      _foodControllers[i].text,
                                      _busControllers[i].toString(),
                                      _prebodaControllers[i].toString());
                                  await Future.delayed(Duration(seconds: 5));
                                }
                              } else {
                                _submitFeedbackForm(
                                    _nameControllers[0].text,
                                    _foodControllers[0].text,
                                    _busControllers[0].toString(),
                                    _prebodaControllers[0].toString());
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(color: Colors.white),
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xff69491e),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          child: const Text(
                            'CONFIRMAR',
                            selectionColor: Colors.white,
                          )))
                ],
              ),
            ),
          ),
        ));
  }

  void _submitFeedbackForm(String name, String food, String isBusSelected,
      String isPrebodaSelected) async {
    FeedbackForm feedbackForm =
        FeedbackForm(name, food, isBusSelected, isPrebodaSelected);

    formController.submitForm(feedbackForm, (String response) {
      if (response == FormController.STATUS_SUCCESS) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                  content:
                      Text('Confirmación de $name realizada correctamente')),
            )
            .closed
            .then((reason) {
          _successfulFormsCount++;
          if (_successfulFormsCount == _totalFormsCount) {
            _clearControllers(); // Llama a _clearControllers solo si todos los formularios han tenido éxito
          }
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Ha ocurrido un error, inténtalo de nuevo')),
        );
      }
    });
  }

  void _clearControllers() {
    _nameController.clear();
    _nameController1.clear();
    _nameController2.clear();
    _nameController3.clear();
    _foodController.clear();
    _foodController1.clear();
    _foodController2.clear();
    _foodController3.clear();
    _isBusSelected = null;
    _isBusSelected1 = null;
    _isBusSelected2 = null;
    _isBusSelected3 = null;
    _isPrebodaSelected = null;
    _isPrebodaSelected1 = null;
    _isPrebodaSelected2 = null;
    _isPrebodaSelected3 = null;
    _isAcompanianteSelected = false;
    widget.testFunction(false);
  }

  void onChanged(num value) {
    if (value is int) {
      setState(() {
        numA = value;
      });
    }
  }

  String _validateBusSelection() {
    if (_isAcompanianteSelected) {
      print('bus compa');
      for (var i = 0; i <= numA; i++) {
        if (_busControllers[i] == null) {
          return 'Por favor, seleccione si necesita autobús.';
        }
      }
    } else {
      if (_busControllers[0] == null) {
        return 'Por favor, seleccione si necesita autobús.';
      }
    }
    return '';
  }

  String _validatePSelection() {
    if (_isAcompanianteSelected) {
      for (int i = 0; i <= numA; i++) {
        if (_prebodaControllers[i] == null) {
          return 'Por favor, seleccione si va a asistir a la preboda.';
        }
      }
    } else {
      if (_prebodaControllers[0] == null) {
        return 'Por favor, seleccione si va a asistir a la preboda.';
      }
    }

    return '';
  }
}

class CustomVisibility extends StatelessWidget {
  final List<bool> conditions;
  final Widget child;

  const CustomVisibility(
      {required this.conditions, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // if all conditions are true, then show the child
      visible: conditions.every((element) => element),
      child: child,
    );
  }
}
