import 'package:ApptoSheet/models/feedback_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController {
  // Callback function to give response of status of current request.
  final void Function(String) callback;

  // Google App Script Web URL
  static const String URL = "https://script.google.com/macros/s/AKfycbzTH5zQmi4_aokMlISTKOIN8vqpUKWm7ebKGMFnDOZpFvshPx6F/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async{
    try{
      await http.get(URL + feedbackForm.toParams()).then(
          (response){
            callback(convert.jsonDecode(response.body)['status']);
          });
    } catch(e){
      print(e);
    }
  }
}