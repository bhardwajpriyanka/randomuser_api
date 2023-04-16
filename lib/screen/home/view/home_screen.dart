import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? ht, hf;

  @override
  Widget build(BuildContext context) {
    ht = Provider.of<HomeProvider>(context, listen: true);
    hf = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text("Random User Api"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.white,onPressed: () {
          ht!.change(ht!.data);
        },child: Text("change",style: TextStyle(fontSize: 11,color: Colors.deepOrange),)),
        body: FutureBuilder(
          future: ht!.find(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              ht!.change(snapshot.data!);
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,

                ),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: ClipOval(child: Image.network("${ht!.data!.results[0].picture.large}",height: 200,width: 200,fit: BoxFit.cover,),)
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${ht!.data!.results[0].name.title}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,),
                        Text(
                          "${ht!.data!.results[0].name.first}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${ht!.data!.results[0].name.last}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(leading: Icon(Icons.person,color: Colors.black,),
                      title: Text("${ht!.data!.results[0].gender}",style:TextStyle(color: Colors.black),),),
                    ListTile(leading: Icon(Icons.laptop_chromebook,color: Colors.black),
                      title: Text("${ht!.data!.results[0].id.value}",style: TextStyle(color: Colors.black),),),
                    ListTile(leading: Icon(Icons.calendar_month,color: Colors.black),
                      title: Text("${ht!.data!.results[0].dob.date}",style: TextStyle(color: Colors.black),),),
                    ListTile(leading: Icon(Icons.email,color: Colors.black),
                      title: Text("${ht!.data!.results[0].email}",style: TextStyle(color: Colors.black),),),
                    ListTile(leading: Icon(Icons.facebook,color: Colors.black),
                      title: Text("${ht!.data!.results[0].id.name}",style: TextStyle(color: Colors.black),),),
                    ListTile(leading: Icon(Icons.call_end,color: Colors.black),
                      title: Text("${ht!.data!.results[0].cell}",style: TextStyle(color: Colors.black),),),
                    ListTile(leading: Icon(Icons.telegram,color: Colors.black),
                      title: Text("${ht!.data!.results[0].phone}",style: TextStyle(color: Colors.black),),),
                    ListTile(leading: Icon(Icons.location_on,color: Colors.black),
                      title: Text("${ht!.data!.results[0].location.street.name}",style: TextStyle(color: Colors.black),),),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
