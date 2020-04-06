
//========================================================================================
// 1) IMPORT
//========================================================================================
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//========================================================================================
// 2) ITEM PAGE
//========================================================================================
class ItemPage extends StatefulWidget {
  //========================================================================================
  // DECLARE VAIRABLE (PRODUCTION NAME, PRODUCTION DESCRIPTION) ??? WIDGET.pdname
  //========================================================================================
  final String pdname;
  final String pddescription;
  ItemPage({Key key, @required this.pdname, @required this.pddescription})
      : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

//========================================================================================
// 3) SHOW DATA
//========================================================================================
class _ItemPageState extends State<ItemPage> {
  String pddescription = "Please wait...";

//========================================================================================
// 4) GET DATA FROM DB ?? YES
//========================================================================================
  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("catalog")
        .document(widget.pddescription)   //??????
        .get()
        .then((value) {
      setState(() {
        pddescription = value.data["description"];
      });
    });
  }

//========================================================================================
// 4) GEN UI
//========================================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//========================================================================================
// 5) APP BAR
//========================================================================================      
      appBar: AppBar(
        title: Text(widget.pdname),
        backgroundColor: Colors.orange,
      ),
//========================================================================================
// 6) BODY
//========================================================================================      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//========================================================================================
// 7) SHOW TEXT (PRODUCT NAME)
//========================================================================================            
            Text(
 //========================================================================================
// 8) SHOW WIDGET.PRNAME
//========================================================================================                
              widget.pdname,      //??? WHERE FROM
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
            ),
            Text(
              pddescription,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
