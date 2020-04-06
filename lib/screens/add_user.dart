//=================================================================================
// 1) IMPORT
//=================================================================================
import 'package:callapi01/components/show_notification.dart';
import 'package:callapi01/services/add_user.dart';
import 'package:callapi01/services/logger_service.dart';
import 'package:flutter/material.dart';

//=================================================================================
// 2) CLASS ADD ITEM
//=================================================================================
class AddUserPage extends StatefulWidget {
  AddUserPage({Key key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}


//=================================================================================
// 3) BUILD UI
//=================================================================================
class _AddUserPageState extends State<AddUserPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===========================================================================
      // 4) APP BAR "ADD ITEM"
      //===========================================================================   
      appBar: AppBar(
        title: Text("Register User"),
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
                  // 1) TEXT "USER NAME"
                  //===============================================================
                  TextField(
                    decoration: InputDecoration(labelText: "User Name"),
                    controller: _username,   //TEXT FIELD NAME: PRODUCTION NAME ****
                  ),
                  Padding(padding: const EdgeInsets.all(10)),
                  //===============================================================
                  // 2) TEXT "PASSWORD"
                  //===============================================================                  
                  TextField(
                    decoration:
                        InputDecoration(labelText: "Password"),
                    controller: _password,    //TEXT FIELD NAME: PDDES (PRODUCT DESCRIPTION) ****
                  ),
                  Padding(padding: const EdgeInsets.all(10)),

                  //===============================================================
                  // 3) BUTTON "LOGIN"
                  //===============================================================                  
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: () {
                      //===========================================================
                      // VALIDATE TEXT
                      //===========================================================
                      if (_username.text == "" || _password.text == "") {
                        showMessageBox(context, "Error",
                            "Please enter user name and password to login",
                            actions: [dismissButton(context)]);
                        logger.e("username or password can't be null");
                      //===========================================================
                      // VALIDATE "OK"
                      //===========================================================                         
                      } else {
                        //=========================================================
                        // ****** PREPARE "INSERT DATA" ******
                        //========================================================= 
                        addUser(
                            context,
                            {"username": _username.text, "password": _password.text},
                            _username.text);
                        _username.text = "";
                        _password.text = "";
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
