

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var res;
  var sl,sw,pl,pw;

  void initState(){
    res=' ';
    sl=sw=pl=pw='0';
    //result();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Result')),),
      body:  Container(
        child: Center(
            child:Column(children:<Widget>[
              SizedBox(height:40),

              Text(
                res,
                style: TextStyle(fontSize: 20),
              ),
              FlatButton(
                child: Text("call api",style: TextStyle(color: Colors.white),),
                onPressed: result,
                color: Colors.black,
              )
            ] ,)
        ),
      ),

    );

  }
  void result() async{
    //String url="http://192.168.42.40:5000/api/flower/";
    String url="http://flaskapitf.herokuapp.com/api/flower";
    Map<String, String> headers = { "accept": "application/json","Content-type": "application/json"};
    // Map<String,String> json = {'sepal_length': '6','sepal_width': '6','petal_length': '8','petal_width': '6'};
    var json = jsonEncode({'sepal_length': '6','sepal_width': '6','petal_length': '8','petal_width': '6'});
    print(json);

    http.Response response = await http.post(url, headers: headers, body: json);
    //var response = await http.post(url, body: {'sepal_length': '6','sepal_width': '6','petal_length': '8','petal_width': '6'});
    print(response);

    setState(() {
      res=response.body;
    });

    print(res);


  }

}