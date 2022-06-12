import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../utils/local_store.dart';
import '../utils/urls.dart';

class Auth {
  //register user
  Future<Map<String, dynamic>> register(
      String email, String fullname, String password) async {
    var result;
    //api body
    final Map<String, dynamic> apiBody = {
      'fullname': fullname,
      'email': email,
      'password': password,
    };

    //send the data
    http.Response response = await http.post(Uri.parse(ApiUrls.registerUrl),
        body: json.encode(apiBody),
        headers: {"Content-Type": 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      //getting user data
      User authUser = User.fromJson(responseData);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body),
      };
    }

    return result;
  }

  //login request
  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    //mapping inputs
    final Map<String, dynamic> apibody = {
      'email': email,
      'password': password,
    };

    //sending the post request
    var res = await http.post(Uri.parse(ApiUrls.loginUrl),
        body: json.encode(apibody),
        headers: {
          'Content-Type': 'application/json',
        });
    
    //checking if post is sent
    if (res.statusCode == 200 || res.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(res.body);
      User userData = User.fromJson(data);

      //Saving the data in local storage
      UserPref().saveUser(userData);

      result = {
        'status': true,
        'message': 'Successful',
        'data': userData,
      };
    } else {
      result = {'status': false, 'message': json.decode(res.body)};
    }
    return result;
  }
}
