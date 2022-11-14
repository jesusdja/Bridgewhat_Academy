import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> alert(BuildContext context) async{
  Size size = MediaQuery.of(context).size;
  bool? res = await showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: const Text(''),
          content: Text('',textAlign: TextAlign.center,
            style: AcademyStyles().styleLato(size: size.height * 0.025,fontWeight: FontWeight.w500, color: AcademyColors.primary),),
          actions: <Widget>[
            CupertinoButton(
              child: Text('Ok',
                style: AcademyStyles().styleLato(size: size.height * 0.02, color: AcademyColors.primary,fontWeight: FontWeight.bold),),
              onPressed: ()  {
                Navigator.of(context).pop(true);
              },
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
            CupertinoButton(
              child: Text('Cancel',
                style: AcademyStyles().styleLato(size: size.height * 0.02, color: AcademyColors.primary,fontWeight: FontWeight.bold),),
              onPressed: (){
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      }
  );
  return res ?? false;
}

Future<bool> alertDeleteAccount(BuildContext context) async{
  Size size = MediaQuery.of(context).size;
  bool? res = await showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: const Text(''),
          content: Text('Are you sure you want to delete this account, you will lose all data',textAlign: TextAlign.center,
            style: AcademyStyles().styleLato(size: size.height * 0.025,fontWeight: FontWeight.w500, color: AcademyColors.primary),),
          actions: <Widget>[
            CupertinoButton(
              child: Text('No',
                style: AcademyStyles().styleLato(size: size.height * 0.02, color: AcademyColors.primary,fontWeight: FontWeight.bold),),
              onPressed: ()  {
                Navigator.of(context).pop(false);
              },
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
            CupertinoButton(
              child: Text('Yes',
                style: AcademyStyles().styleLato(size: size.height * 0.02, color: AcademyColors.primary,fontWeight: FontWeight.bold),),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      }
  );
  return res ?? false;
}