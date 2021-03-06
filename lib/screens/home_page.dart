//========================================================================================
// 1) IMPORT
//========================================================================================
import 'package:callapi01/screens/add_user.dart';
import 'package:callapi01/screens/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:callapi01/screens/add_item_page.dart';
import 'package:callapi01/screens/item_page.dart';
import 'package:flutter/material.dart';

//========================================================================================
// 2) HOMEPAGE
//========================================================================================
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

//========================================================================================
// 3) CREATE UI
//========================================================================================
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }
//========================================================================================
// 4) CREATE WIDGET
//========================================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //==================================================================================
      // APP BAR
      //==================================================================================
        appBar: AppBar(
          title: Text("T Store 2020"),
        ),
      //==================================================================================
      // BODY
      //==================================================================================        
        body: StreamBuilder(
      //==================================================================================
      // GET DATA FROM API
      //==================================================================================          
          stream: Firestore.instance.collection("catalog").snapshots(),
          builder: (context, snapshot) {
            //============================================================================
            // IF NO DATA
            //============================================================================            
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  children: <Widget>[
                    //====================================================================
                    // LOADNING....
                    //====================================================================                     
                    CircularProgressIndicator(),
                    Text("Loading . . . "),
                  ],
                ),
              );
            //============================================================================
            // IF HAVE DATA
            //============================================================================               
            } else {
              return ListView.builder(
                //========================================================================
                // 1) SET LIST VIEW LENGTH
                //========================================================================                 
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    //====================================================================
                    // UI: CARD
                    //====================================================================                      
                    child: Card(
                      child: Container(
                        //================================================================
                        // INKWELL ??? WIDGET THAT HAVE ONTAP EVENT
                        //================================================================                          
                        child: InkWell(
                          onTap: () {
                            //============================================================
                            // CLICK EVENT: GO ITEM_PAGE
                            //============================================================                              
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemPage(
                                          //==============================================
                                          // SNAPSHOP = ?? DATASET FROM DB
                                          //==============================================      
                                          pdname: snapshot
                                              .data.documents[index].documentID,
                                          pddescription: snapshot
                                              .data
                                              .documents[index]
                                              .data["description"],
                                        )));
                          },
                          //============================================================
                          // SHOW DATA
                          //============================================================                              
                          child: Column(
  
                            children: <Widget>[
                            //============================================================
                            //  TEXT IN LIST VIEW (TITLE AND SUBTITILE)
                            //============================================================                                 
                              ListTile(
                                title: Text(
                                    snapshot.data.documents[index].documentID),
                                subtitle: Text(snapshot
                                    .data.documents[index].data["description"]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        //============================================================================
        // SIDE BAR
        //============================================================================         
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
            //============================================================================
            // SIDE BAR : HADER
            //============================================================================               
              DrawerHeader(
                child: Image.asset("assets/images/logo.png"),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            //============================================================================
            // SIDE BAR: MENU, CLICK "ADD ITEM" > GO ADD ITEM PAGE
            //============================================================================               
              ListTile(
                title: Row(children: <Widget>[Icon(Icons.add),Text('Add item'),],),              
                onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => AddItemPage()));},               
              ),
            //============================================================================
            // SIDE BAR: MENU, CLICK "ADD ITEM" > GO ADD ITEM PAGE
            //============================================================================               
              ListTile(
                title: Row(children: <Widget>[Icon(Icons.add),Text('Login'),],),              
                onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));},               
              ),
            //============================================================================
            // SIDE BAR: MENU, GO LOGIN PAGE
            //============================================================================                
              ListTile(
                title: Row(children: <Widget>[Icon(Icons.add),Text('Register User'),],),              
                onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => AddUserPage()));},               
              ),
            ],
          ),
        ));
  }
}
