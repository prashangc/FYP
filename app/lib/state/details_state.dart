import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import '../model/HospitalsDataModel.dart';

class DetailsState with ChangeNotifier {
  LocalStorage storage = LocalStorage("usertoken");
  late List<HospitalsDataModel> _hospitalsLists;

  Future<bool> loginNow(String username, String password) async {
    try {
      String url = 'http://10.0.2.2:8000/api/login/';
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            'username': username,
            'password': password,
          }));
      var data = json.decode(response.body) as Map;
      // print(data);
      if (data.containsKey('token')) {
        // print(data['token']);
        storage.setItem('token', data['token']);
        // print(storage.getItem('token'));
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      print("error loginNow");
      return true;
    }
  }

  Future<bool> registerNow(String username, String email, String password,
      String confirmPassword) async {
    try {
      String url = 'http://10.0.2.2:8000/api/registerDoctor/';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "username": username,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        }),
      );
      var data = json.decode(response.body) as Map;

      return data['error'];
    } catch (e) {
      print("error register");
      print(e);
      return true;
    }
  }

  Future<List> getMedicalNewsImages() async {
    try {
      String url = 'http://10.0.2.2:8000/api/images/';
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getHospitalsData() async {
    try {
      String url = 'http://10.0.2.2:8000/api/hospitals/';
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> getHospitalsDataByProvider() async {
    try {
      String url = 'http://10.0.2.2:8000/api/hospitals/';
      http.Response response = await http.get(Uri.parse(url));
      var data = json.decode(response.body) as List;
      List<HospitalsDataModel> temp = [];
      for (var element in data) {
        HospitalsDataModel hospitalsDataModel =
            HospitalsDataModel.fromJson(element);
        temp.add(hospitalsDataModel);
      }
      _hospitalsLists = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("error getSreenTitleData");
      print(e);
      return false;
    }
  }

  List<HospitalsDataModel>? get hospitalsList {
    return [..._hospitalsLists];
  }

  HospitalsDataModel singleHospitalData(int id) {
    return _hospitalsLists.firstWhere((element) => element.id == id);
  }
}
