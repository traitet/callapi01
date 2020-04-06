//=================================================================================
// 1) IMPORT
//=================================================================================
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:callapi01/components/show_notification.dart';
import 'package:flutter/material.dart';
import 'logger_service.dart';


//================================================================================
// 2) FUNCTION: ADD ITEM (FUTURE => ASYN FUNCTION)
//================================================================================
Future<void> loginUser(
   

    BuildContext context, Map<String, dynamic> data, String documentName) {
  //==============================================================================
  // RETURN FUNCTION
  //==============================================================================   
  return 
  
      Firestore.instance
      //==========================================================================
      // SAVE DATA TO DB: CATALOG, DOCUMENTNAME, DATA
      //==========================================================================  
      .collection("user")       //COLLECTION NAME: CATALOG
      .document(documentName)   //DOCUMENTNAME:  [ PRODUCT NAME ]
      .get()            //SAVE DATA "DYNAMIC ???"
      .then((value) {      
          if (value.exists) {   showMessageBox(context, "SUCCESS", "Login OK for User($documentName) ",   actions: [dismissButton(context)]); logger.i("Login success");}
          else { showMessageBox(context, "ERROR", "Login ERROR for User($documentName) ",   actions: [dismissButton(context)]); logger.i("Login ERROR");}

    //============================================================================
    // SHOW ERROR
    //============================================================================      
  }).catchError((e) {
    logger.e(e);
  });
}
