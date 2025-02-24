import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test3/class/todoliste.dart';

class datacrtl{
  Dio dio=Dio();
  Future postData(
      {required String title,
      required String description,
      required String prio})async{
    const String url='https://jsonplaceholder.typicode.com/posts';
    dynamic data={
      'title' :title,
      'description' :description,
      'prioritie' :prio
    };
    var response =await dio.post(url,data: data,options: Options(
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    ));
    return response.data;
  }
  Future <List<Welcome>> getData()async{
    const String url='https://jsonplaceholder.typicode.com/users/1/todos';
    var response =await dio.get(url,options: Options(
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    ));
    final data=response.data;
    if (data is List) {
      // Parse the list of todos into a List<Welcome>
      List<Welcome> todos = data.map((todo) => Welcome.fromJson(todo)).toList();
      for (var todo in todos) {
        print(todo);
      }
      return todos;
    } else {
      throw Exception('Invalid response format: Expected a list of todos');
    }
  }
  Future<PlatformFile?> select()async{
    PlatformFile selected;
    final res=await FilePicker.platform.pickFiles();
    selected=res!.files.first;
    if (res!=null){
      return selected;
    }else{
      return null;
    }
  }
  Future<bool> uploadfile(PlatformFile selected)async{
    if(selected==null){
      print('no selected file');
      return false;
    }
    else{
      File file=File(selected.path!);
      String? cloudName=dotenv.env['cloud_name'];
      Uri uri=Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
      var request=http.MultipartRequest("post",uri);
      final bytes = await file.readAsBytes();
      var multipartFile = http.MultipartFile.fromBytes(
        'file',    
        bytes,    
        filename: file.path.split('/').last, 
      );
      request.files.add(multipartFile);
      request.fields['upload_preset'] = "first-upload";
      request.fields['resource_type'] = "raw";
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print(responseData);
        print('success');
        return true;
        // Handle success
      } else {
        return false;
      }





      return true;
    }
  }

}