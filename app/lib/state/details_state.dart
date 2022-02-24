import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import '../model/HospitalsDataModel.dart';

class DetailsState with ChangeNotifier {
  LocalStorage storages = LocalStorage("usertoken");
  late List<HospitalDataModel> _hospitalsLists;

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
        storages.setItem('token', data['token']);
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
      var token = storages.getItem('token');
      String url = 'http://10.0.2.2:8000/api/images/';
      http.Response response = await http
          .get(Uri.parse(url), headers: {'Authorization': 'token $token'});
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
      var token = storages.getItem('token');
      print('storage: $storages');

      // print('token: $token');
      // var tokens = '944f875ffdd653872855d3d4e6f8731b1b0b61df';
      String url = 'http://10.0.2.2:8000/api/hospitals/';
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'token $token',
        },
      );
      var data = json.decode(response.body) as List;
      List<HospitalDataModel> temp = [];
      for (var element in data) {
        HospitalDataModel hospitalsDataModel =
            HospitalDataModel.fromJson(element);
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

  Future<void> addLike(int id) async {
    try {
      // var token = storage.getItem('token');
      // var token = 'b76a1308a6c58e099db3e9a425b1b4b57ff591f3';
      // print(token);
      String url = 'http://10.0.2.2:8000/api/favourite/';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          // 'Authorization': 'token $token',
        },
        body: json.encode({
          "id": id,
        }),
      );
      print('response: ${response.body}');
      var data = json.decode(response.body);
      if (data['error'] == false) {
        getHospitalsDataByProvider();
      }
    } catch (e) {
      print("error addLike");
      print(e);
    }
  }

  List<HospitalDataModel>? get hospitalsList {
    return [..._hospitalsLists];
  }

  HospitalDataModel singleHospitalData(int id) {
    return _hospitalsLists.firstWhere((element) => element.id == id);
  }
}
