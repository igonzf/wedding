import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:invitacion/model/feedback.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbzPf3Q0__fXxKqM0qoNKBEigi1neZHwFqpTzxJCR4Vwh9jLj-K-Om6jsrJYoQyusoDyZQ/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      await http
          .post(Uri.parse(URL), body: feedbackForm.toJson())
          .then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse(url!)).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _checkDataInSheet(Map<dynamic, dynamic> formdata) async {
    // Obtén el nombre del feedbackForm
    String nombreFormData = formdata['nombre'];
    print('nombre: $nombreFormData');
    bool success = false;

    try {
      http.Response response = await http.get(Uri.parse(URL));

      // Verifica el estado de la respuesta
      if (response.statusCode == 200) {
        // La solicitud fue exitosa, puedes trabajar con los datos aquí
        print('Respuesta exitosa: ${response.body}');
        Map<String, dynamic> sheetData = convert.jsonDecode(response.body);
        success = sheetData.values.any((value) {
          // Verifica si el valor actual es igual al nombre del feedbackForm
          return value['nombre'] == nombreFormData;
        });

        print('está el nombre en la hoja de calculo: $success');
      } else {
        // La solicitud no fue exitosa, maneja el error apropiadamente
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Ocurrió un error durante la solicitud, maneja el error apropiadamente
      print('Error: $e');
    }

    return success;
  }
}
