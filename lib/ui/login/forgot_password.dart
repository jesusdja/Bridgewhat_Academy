import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/services/http_connection.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:academybw/widgets_shared/textfield_general.dart';
import 'package:academybw/widgets_shared/toast_widget.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key, required this.email, this.isLogin = true}) : super(key: key);
  final String email;
  final bool isLogin;

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  bool loadData = false;
  TextEditingController controllerEmail = TextEditingController();
  bool emailSend = false;

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController(text: widget.email);
  }

  @override
  Widget build(BuildContext context) {

    TextStyle styleTextField = AcademyStyles().styleLato(size: sizeH * 0.02,color: AcademyColors.primaryGreyApp,fontWeight: FontWeight.bold);
    TextStyle styleButtonText = AcademyStyles().stylePoppins(size: sizeH * 0.02,color: Colors.white,fontWeight: FontWeight.bold);

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: sizeH * 0.1,),
              Container(
                width: sizeW,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios,size: sizeH * 0.035,color: Colors.black),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(height: sizeH * 0.1,),
              iconApp(),
              emailSend ?
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                child: Text('We have sent an email to\n${widget.isLogin ? 'recover' : 'modify'} your account',
                    style: AcademyStyles().styleLato(
                        color: AcademyColors.primary,size: sizeH * 0.022
                    ),textAlign: TextAlign.center),
              ) :
              Container(
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                child: TextFieldGeneral(
                  textEditingController: controllerEmail,
                  radius: 5,
                  borderColor: AcademyColors.primaryGreyApp,
                  sizeBorder: 1.5,
                  hintText: 'E-mail',
                  labelStyle: styleTextField,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              emailSend ? SizedBox(height: sizeH * 0.04,) : SizedBox(height: sizeH * 0.025,),
              loadData ?
              Center(
                child: circularProgressColors(widthContainer1: sizeW,widthContainer2: sizeH * 0.03,colorCircular: AcademyColors.primary),
              ) :
              ButtonGeneral(
                title: 'Continue',
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                width: sizeW,
                height: sizeH * 0.07,
                backgroundColor: AcademyColors.primary,
                textStyle: styleButtonText,
                radius: 5,
                onPressed: ()=> emailSend ? Navigator.of(context).pop() : loginOnTap(),
              ),
              SizedBox(height: sizeH * 0.03,),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconApp(){
    return Container(
      height: sizeH * 0.3,
      width: sizeH * 0.3,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/image/icon_app.png').image,
              fit: BoxFit.fitWidth
          )
      ),
    );
  }

  Future loginOnTap() async{
    loadData = true;
    setState(() {});

    String errorText = '';
    if(errorText.isEmpty && !validateEmailAddress(email: controllerEmail.text)['valid']){
      errorText = validateEmailAddress(email: controllerEmail.text)['sms'];
    }

    if(errorText.isEmpty){
      Map<String,dynamic> body = {
        'email' : controllerEmail.text,
      };
      if(await HttpConnection().forgotPass(body: body)){
        setState(() {
          emailSend = true;
        });
      }
    }else{
      showAlert(text: errorText,isError: true);
    }

    loadData = false;
    setState(() {});
  }
}
