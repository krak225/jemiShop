import 'package:daily_task/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/dashboard/model/client.dart';

class UserDetailsBottomSheet extends StatelessWidget {
  //final DashboardController controller = Get.find();
  final Client client;
  const UserDetailsBottomSheet(this.client);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80"
                  ),
                  fit: BoxFit.cover
              )
          ),
          child: Container(
            width: double.infinity,
            height: 200,
            child: Container(
              alignment: Alignment(0.0,2.5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=100&q=80"
                ),
                radius: 60.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          client.nom + " " + client.prenoms
          ,style: TextStyle(
            fontSize: 25.0,
            color:Colors.blueGrey,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w400
        ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          client.telephone
          ,style: TextStyle(
            fontSize: 18.0,
            color:Colors.black45,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w300
        ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          client.email
          ,style: TextStyle(
            fontSize: 15.0,
            color:Colors.black45,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w300
        ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
            elevation: 2.0,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                child: Text("Faire un don",style: TextStyle(
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300
                ),))
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "App Developer || Digital Marketer"
          ,style: TextStyle(
            fontSize: 18.0,
            color:Colors.black45,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w300
        ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("like",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600
                        ),),
                      SizedBox(
                        height: 7,
                      ),
                      Text("15",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w300
                        ),)
                    ],
                  ),
                ),
                Expanded(
                  child:
                  Column(
                    children: [
                      Text("Achats",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600
                        ),),
                      SizedBox(
                        height: 7,
                      ),
                      Text("2000",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w300
                        ),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: (){
              },
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blue, Colors.blueGrey]
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                  alignment: Alignment.center,
                  child: Text(
                    "Appeler",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
              },
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.green, Colors.greenAccent]
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 130.0,maxHeight: 40.0,),
                  alignment: Alignment.center,
                  child: Text(
                    "Message",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );

    return Container(
      width: Get.width,
      //height: 80,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      // margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0xff1A181612), offset: Offset(10, 10), blurRadius: 40)
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(child:Icon(Icons.photo))
          ),
          ListTile(
            leading: new Icon(Icons.person),
            title: new Text(client.nom + " " + client.prenoms),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: new Icon(Icons.email),
            title: new Text(client.email),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
