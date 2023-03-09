import 'package:daily_task/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:daily_task/app/shared_components/task_progress.dart';
import 'package:daily_task/app/utils/helpers/app_helpers.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constans/app_constants.dart';
import '../features/dashboard/model/client.dart';
import 'header_text.dart';

class UserDetailsBottomSheet extends StatelessWidget {
  final DashboardController controller = Get.find();
  final Client client;
  UserDetailsBottomSheet(this.client);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32), ),
          child:
          Container(
            color: Colors.white,
            child: Column(
            children: [
              //Text(""),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            client.photo
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
                      backgroundColor: Colors.white,
                      radius: 65.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=100&q=80"
                        ),
                        radius: 60.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child:Text(
                  client.nom + " " + client.prenoms,
                  style: TextStyle(
                    fontSize: 25.0,
                    //color:Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                client.telephone,
                style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.black45,
                  letterSpacing: 4.0,
                  fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(
                height: 15,
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
              /*Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                  elevation: 2.0,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                      child: Text("Faire un don",style: TextStyle(
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300
                      ),))
              ),*/
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(width: kSpacing / 2),
                  SizedBox(
                    width: 100,
                    child: LinearPercentIndicator(
                      lineHeight: 3.0,
                      percent: 100/100,
                      progressColor: Colors.orange,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Expanded(child: Center(
                    child: Text(
                    "Ses commandes",
                      style: TextStyle(
                        fontSize: 18.0,
                        color:Colors.black45,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                     ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: LinearPercentIndicator(
                      lineHeight: 3.0,
                      percent: 100/100,
                      progressColor: Colors.green,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
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
                            Text("Nombre",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                              ),),
                            SizedBox(
                              height: 7,
                            ),
                            Text("3",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child:
                        Column(
                          children: [
                            Text("Montant Total",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text("17 000",
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                        constraints: BoxConstraints(maxWidth: 130.0,maxHeight: 40.0,),
                        alignment: Alignment.center,
                        child: Row(
                            children: [
                              IconButton(
                                icon: Icon(EvaIcons.phoneCall),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                              Text("Appeler",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ]
                        )
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
                        child: Row(
                            children: [
                              IconButton(
                                icon: Icon(EvaIcons.messageSquareOutline),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                              Text("Message",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
        ),
          ),
      ),
    );

  }
}
