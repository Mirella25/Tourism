// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
  String apiUrl = "http://10.0.2.2:8000/api";
  postRequest(
      {required String route,
      required Map<String, String> data,
      Map<String, String>? headers}) async {
    String url = apiUrl + route;
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: headers);
  }

  getRequest({required String route, Map<String, String>? headers}) async {
    String url = apiUrl + route;
    return await http.get(Uri.parse(url), headers: headers);
  }

  Future<http.Response> deleteRequest(
      {required String route, Map<String, String>? headers}) async {
    String url = apiUrl + route;
    return await http.delete(Uri.parse(url), headers: headers);
  }

  postRequestWithFile(
      {required String route,
      required Map<String, String> data,
      Map<String, String>? headers,
      File? file}) async {
    String url = apiUrl + route;
    var request = http.MultipartRequest("POST", Uri.parse(url));
    if (file != null) {
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multipartFile = http.MultipartFile("photo", stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile);
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    if (headers != null) {
      request.headers.addAll(headers);
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }
}
