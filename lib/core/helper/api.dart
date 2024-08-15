// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
// get method
  Future<Response> get({required String url}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    Map<String, String> headers = {};
    headers.addAll({
      'Accept': 'application/json',
      // todo ask about if there is one token or token changed
      'Authorization': 'Bearer $token'
    });
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {
      _body = response.body;
    }
    Response _response = Response(
        headers: response.headers,
        body: _body,
        statusCode: response.statusCode);
    if (response.statusCode == 200) {
      return _response;
    } else {
      throw Exception('You have error in the code  ${response.statusCode}');
    }
  }

//post method
  Future<dynamic> post({required String url, @required dynamic body}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    Map<String, String> headers = {};
    headers.addAll({
      'Accept': 'application/json',
      // todo ask about if there is one token or token changed
      'Authorization': 'Bearer $token'
    });
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {
      _body = response.body;
    }
    Response _response = Response(
        headers: response.headers,
        body: _body,
        statusCode: response.statusCode);
    if (response.statusCode == 200) {
      return _response;
    } else {
      return _response;
    }
  }

// put method
  Future<dynamic> put(
      {required String url,
      required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    }
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception(
          'You have error in the code  ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
