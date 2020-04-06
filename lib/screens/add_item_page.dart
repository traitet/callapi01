//=================================================================================
// 1) IMPORT
//=================================================================================
import 'package:callapi01/components/show_notification.dart';
import 'package:callapi01/services/add_item_service.dart';
import 'package:callapi01/services/logger_service.dart';
import 'package:flutter/material.dart';

//=================================================================================
// 2) CLASS ADD ITEM
//=================================================================================
class AddItemPage extends StatefulWidget {
  AddItemPage({Key key}) : super(key: key);

  @override
  _AddItemPageState createState() => _AddItemPageState();
}


//=================================================================================
// 3) BUILD UI
//=================================================================================
class _AddItemPageState extends State<AddItemPage> {
  final pdname = TextEditingController();
  final pddes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===========================================================================
      // 4) APP BAR "ADD ITEM"
      //===========================================================================   
      appBar: AppBar(
        title: Text("Add Product"),
        backgroundColor: Colors.grey,
      ),
      //===========================================================================
      // 5) BODY
      //===========================================================================      
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  //===============================================================
                  // 1) TEXT "PRODUCT NAME"
                  //===============================================================
                  TextField(
                    decoration: InputDecoration(labelText: "Product Name"),
                    controller: pdname,   //TEXT FIELD NAME: PRODUCTION NAME ****
                  ),
                  Padding(padding: const EdgeInsets.all(10)),
                  //===============================================================
                  // 2) TEXT "PRODUCT DESCRIPTION"
                  //===============================================================                  
                  TextField(
                    decoration:
                        InputDecoration(labelText: "Product Description"),
                    controller: pddes,    //TEXT FIELD NAME: PDDES (PRODUCT DESCRIPTION) ****
                  ),
                  Padding(padding: const EdgeInsets.all(10)),
                  //===============================================================
                  // 3) BUTTON "ADD ITEMS"
                  //===============================================================                  
                  RaisedButton(
                    child: Text("Save Add items"),
                    onPressed: () {
                      //===========================================================
                      // VALIDATE TEXT
                      //===========================================================
                      if (pdname.text == "" || pddes.text == "") {
                        showMessageBox(context, "Error",
                            "Please enter name and description before adding it to firebase",
                            actions: [dismissButton(context)]);
                        logger.e("pdname or pddes can't be null");
                      //===========================================================
                      // VALIDATE "OK"
                      //===========================================================                         
                      } else {
                        //=========================================================
                        // ****** PREPARE "INSERT DATA" ******
                        //========================================================= 
                        addItem(
                            context,
                            {"name": pdname.text, "description": pddes.text},
                            pdname.text);
                        pdname.text = "";
                        pddes.text = "";
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
