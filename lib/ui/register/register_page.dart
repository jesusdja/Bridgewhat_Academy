import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/services/http_connection.dart';
import 'package:academybw/ui/login/login_page.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:academybw/widgets_shared/dropdown_button_generic.dart';
import 'package:academybw/widgets_shared/textfield_general.dart';
import 'package:academybw/widgets_shared/toast_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool obscurePass = true;
  bool checkPrivacy = false;
  bool checkSendInfo = false;
  bool loadSaveData = false;
  bool emailSend = false;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerCompanyName = TextEditingController();

  List<String> items = ['job function', 'items 1', 'items 2', 'items 3'];
  String itemSelect = 'job function';
  late TextStyle styleTextField;

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    styleTextField = AcademyStyles().styleLato(size: sizeH * 0.02,color: AcademyColors.primaryGreyApp,fontWeight: FontWeight.bold);
    TextStyle styleButtonText = AcademyStyles().stylePoppins(size: sizeH * 0.02,color: Colors.white,fontWeight: FontWeight.bold);

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Column(
          children: [
            if(!emailSend)...[
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: [
                        SizedBox(height: sizeH * 0.02,),
                        iconApp(),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                          child: TextFieldGeneral(
                            textEditingController: controllerName,
                            initialValue: null,
                            radius: 5,
                            borderColor: AcademyColors.primaryGreyApp,
                            sizeBorder: 1.5,
                            hintText: 'Name *',
                            labelStyle: styleTextField,
                            textInputType: TextInputType.name,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'required field';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: sizeH * 0.025,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                          child: TextFieldGeneral(
                            textEditingController: controllerLastName,
                            initialValue: null,
                            radius: 5,
                            borderColor: AcademyColors.primaryGreyApp,
                            sizeBorder: 1.5,
                            hintText: 'Last name *',
                            labelStyle: styleTextField,
                            textInputType: TextInputType.name,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'required field';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: sizeH * 0.025,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                          child: TextFieldGeneral(
                            textEditingController: controllerEmail,
                            initialValue: null,
                            radius: 5,
                            borderColor: AcademyColors.primaryGreyApp,
                            sizeBorder: 1.5,
                            hintText: 'E-mail *',
                            labelStyle: styleTextField,
                            textInputType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'required field';
                              }
                              if(!validateEmailAddress(email: value, )['valid']){
                                return 'Email no valid';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: sizeH * 0.025,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                          child: TextFieldGeneral(
                            textEditingController: controllerPass,
                            initialValue: null,
                            radius: 5,
                            borderColor: AcademyColors.primaryGreyApp,
                            sizeBorder: 1.5,
                            hintText: 'Password *',
                            labelStyle: styleTextField,
                            textInputType: TextInputType.visiblePassword,
                            obscure: obscurePass,
                            suffixIcon: IconButton(
                              icon: Icon(obscurePass ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,size: sizeH * 0.03,color: AcademyColors.primary),
                              onPressed: (){ setState(() { obscurePass = !obscurePass; }); },
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'required field';
                              }
                              // if(!validateEmailAddress(email: value, )['valid']){
                              //   return 'Email no valid';
                              // }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: sizeH * 0.025,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                          child: TextFieldGeneral(
                            textEditingController: controllerCompanyName,
                            initialValue: null,
                            radius: 5,
                            borderColor: AcademyColors.primaryGreyApp,
                            sizeBorder: 1.5,
                            hintText: 'Company name',
                            labelStyle: styleTextField,
                            textInputType: TextInputType.name,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'required field';
                              }
                              return null;
                            },
                          ),
                        ),
                        // SizedBox(height: sizeH * 0.025,),
                        // dropdownButton(),
                        SizedBox(height: sizeH * 0.07,),
                        goToRegister(),
                        SizedBox(height: sizeH * 0.01,),
                        privacyCheck(),
                        receiveInformationCheck(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: sizeH * 0.025,),
              loadSaveData ?
              SizedBox(
                width: sizeW,
                child: Center(
                  child: circularProgressColors(widthContainer1: sizeW,widthContainer2: sizeH * 0.03,colorCircular: AcademyColors.primary),
                ),
              )
                  :
              ButtonGeneral(
                title: 'Continue',
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                width: sizeW,
                height: sizeH * 0.07,
                backgroundColor: AcademyColors.primary,
                textStyle: styleButtonText,
                radius: 5,
                onPressed: () async {

                  loadSaveData = true;
                  setState(() {});

                  if(globalKey.currentState!.validate()){
                    if(checkPrivacy){

                      Map<String,dynamic> body = {
                        'name' : controllerName.text,
                        'password' : controllerPass.text,
                        'lastname' : controllerLastName.text,
                        'email' : controllerEmail.text,
                        'company' : controllerCompanyName.text,
                        'jobfunction' : 'no/Job',
                      };

                      if(await HttpConnection().register(body: body)){
                        setState(() {
                          emailSend = true;
                        });
                      }
                    }else{
                      showAlert(text: 'Check use and privacy policy',isError: true);
                    }
                  }else{
                    showAlert(text: 'No registre',isError: true);
                  }

                  loadSaveData = false;
                  setState(() {});
                },
              ),
            ]else...[
              SizedBox(height: sizeH * 0.4,),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Text('Successful registration',
                    style: AcademyStyles().styleLato(
                        color: AcademyColors.primaryGreyApp,
                        size: sizeH * 0.025
                    ),
                    textAlign: TextAlign.center
                ),
              ),
              SizedBox(height: sizeH * 0.01,),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Text(controllerEmail.text,
                    style: AcademyStyles().styleLato(
                        color: AcademyColors.primary,
                        size: sizeH * 0.025
                    ),
                    textAlign: TextAlign.center
                ),
              ),
              SizedBox(height: sizeH * 0.01,),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Text('with a verification link, open it to verify the account and log in again',
                    style: AcademyStyles().styleLato(
                        color: AcademyColors.primaryGreyApp,
                        size: sizeH * 0.025
                    ),
                    textAlign: TextAlign.center
                ),
              ),
              Expanded(child: Container()),
              ButtonGeneral(
                title: 'Continue',
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                width: sizeW,
                height: sizeH * 0.07,
                backgroundColor: AcademyColors.primary,
                textStyle: styleButtonText,
                radius: 5,
                onPressed: () async {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:
                      (BuildContext context) => const LoginPage()));
                },
              )
            ],
            SizedBox(height: sizeH * 0.03,),
          ],
        ),
      ),
    );
  }

  Widget iconApp(){
    return Container(
      height: sizeH * 0.2,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.25),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/image/logo_colores_fondo_transparente.png').image,
              fit: BoxFit.fitWidth
          )
      ),
    );
  }

  Widget privacyCheck(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: checkPrivacy,
            onChanged: (value) => setState(() { checkPrivacy = value!; }),
            checkColor: Colors.white,
            hoverColor: AcademyColors.primary,
            focusColor: AcademyColors.primary,
            activeColor: AcademyColors.primary,
            side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(width: 2.0, color: AcademyColors.primary),
            ),
          ),
          Text('I agree to the terms of use and privacy policy',
              style: AcademyStyles().styleLato(
                  color: AcademyColors.primaryGreyApp,
                  size: sizeH * 0.0175
              ),
              textAlign: TextAlign.left
          ),
        ],
      ),
    );
  }

  Widget receiveInformationCheck(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: checkSendInfo,
            onChanged: (value) => setState(() { checkSendInfo = value!; }),
            checkColor: Colors.white,
            hoverColor: AcademyColors.primary,
            focusColor: AcademyColors.primary,
            activeColor: AcademyColors.primary,
            side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(width: 2.0, color: AcademyColors.primary),
            ),
          ),
          Expanded(
            child: Text('I do not want to receive information from Bridgewhat',
                style: AcademyStyles().styleLato(
                    color: AcademyColors.primaryGreyApp,
                    size: sizeH * 0.0175
                ),
                textAlign: TextAlign.left
            ),
          ),
        ],
      ),
    );
  }

  Widget goToRegister(){
    return InkWell(
      child: Container(
        width: sizeW,
        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
        child: Text('I already have an account',
          style: AcademyStyles().styleLato(color: AcademyColors.primary,size: sizeH * 0.02,textDecoration: TextDecoration.underline,fontWeight: FontWeight.bold),
          textAlign: TextAlign.left),
      ),
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder:
            (BuildContext context) => const LoginPage()));
      },
    );
  }

  Widget dropdownButton(){
    return Container(
      width: sizeW,
      height: sizeH * 0.07,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
      child: DropdownGeneric(
        radius: 5,
        borderColor: AcademyColors.primaryGreyApp,
        value: itemSelect,
        onChanged: (value){
          setState(() {
            itemSelect = value!;
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,style: styleTextField),);
        }).toList(),
      ),
    );
  }


}