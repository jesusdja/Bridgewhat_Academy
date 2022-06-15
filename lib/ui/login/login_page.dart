import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/register/register_page.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:academybw/widgets_shared/textfield_general.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool obscurePass = true;
  bool checkRemember = false;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle styleTextField = AcademyStyles().stylePrimary(size: sizeH * 0.02,color: AcademyColors.primaryGreyApp,fontWeight: FontWeight.bold);
    TextStyle styleButtonText = AcademyStyles().stylePoppins(size: sizeH * 0.02,color: Colors.white,fontWeight: FontWeight.bold);

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: sizeH * 0.2,),
              iconApp(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                child: TextFieldGeneral(
                  textEditingController: controllerEmail,
                  initialValue: null,
                  radius: 5,
                  borderColor: AcademyColors.primaryGreyApp,
                  sizeBorder: 1.5,
                  hintText: 'E-mail',
                  labelStyle: styleTextField,
                  textInputType: TextInputType.emailAddress,
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
                  hintText: 'Password',
                  labelStyle: styleTextField,
                  textInputType: TextInputType.visiblePassword,
                  obscure: obscurePass,
                  suffixIcon: InkWell(
                    onTap: () => setState(() { obscurePass = !obscurePass; }),
                    child: Icon(obscurePass ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
                  ),
                ),
              ),
              SizedBox(height: sizeH * 0.025,),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                child: Text('Fort your password?',
                  style: AcademyStyles().stylePrimary(
                      color: AcademyColors.primary,size: sizeH * 0.02
                  ),textAlign: TextAlign.left),
              ),
              rememberPass(),
              SizedBox(height: sizeH * 0.025,),
              ButtonGeneral(
                title: 'Continue',
                onPressed: (){},
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                width: sizeW,
                height: sizeH * 0.07,
                backgroundColor: AcademyColors.primary,
                textStyle: styleButtonText,
                radius: 5,
              ),
              SizedBox(height: sizeH * 0.03,),
              goToRegister(),
            ],
          ),
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

  Widget rememberPass(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: checkRemember,
            onChanged: (value) => setState(() { checkRemember = value!; }),
            checkColor: Colors.white,
            hoverColor: AcademyColors.primary,
            focusColor: AcademyColors.primary,
            activeColor: AcademyColors.primary,
            side: MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(width: 2.0, color: AcademyColors.primary),
            ),
          ),
          Text('remember password',
            style: AcademyStyles().stylePrimary(
              color: AcademyColors.primaryGreyApp,
              size: sizeH * 0.02
            ),
            textAlign: TextAlign.left
          ),
        ],
      ),
    );
  }

  Widget goToRegister(){
    return SizedBox(
      width: sizeW,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You don´t have an account?',
              style: AcademyStyles().stylePrimary(
                  color: AcademyColors.primaryGreyApp,
                  size: sizeH * 0.02
              ),
          ),
          InkWell(
            child: Text(' Sign up',
                style: AcademyStyles().stylePrimary(
                    color: AcademyColors.primary,
                    size: sizeH * 0.02
                ),
            ),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:
                  (BuildContext context) => const RegisterPage()));
            },
          ),
        ],
      ),
    );
  }
}
