import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List products=[];

  Future<bool> getProducts()async{
    String serviceUrl = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(Uri.parse(serviceUrl));
    setState(() {
      products = json.decode(response.body.toString());
    });
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: ListView.builder(

        itemBuilder: (BuildContext context, int index){
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.blueGrey,
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8,bottom: 8),
                              child: Text(
                                'Name: ${products[index]['name']}',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                  'username: ${products[index]['username']}'
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                  'email: ${products[index]['email']}'
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child:
                              Text(
                                  'phone: ${products[index]['phone']}'
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                  'website: ${products[index]['website']}'
                              ),
                            )
                          ],
                        ),
                      )
                  )


                ],

              ),
            ),
          );
        },


        itemCount: products.isEmpty ? 0: products.length,


      ),
    );
  }
}