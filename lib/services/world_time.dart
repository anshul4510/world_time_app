import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time='a';
  String flag;
  String url;
  bool isDaytime=true;
  WorldTime({ required this.location,required this.flag,required this.url});
  Future <void> getTime() async{
    try{
      //make the request
      Response response= await get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'));
      Map data=jsonDecode(response.body);
      // print(data);
      //get properties from data
      String dateTime= data['dateTime'];
      //print(dateTime);
      DateTime now= DateTime.parse(dateTime);
      isDaytime=now.hour>6 && now.hour<19?true:false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time='could not get time data';
    }

  }
}

