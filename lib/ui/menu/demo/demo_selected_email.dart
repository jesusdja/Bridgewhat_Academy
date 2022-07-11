import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:academybw/widgets_shared/textfield_general.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';

class DemoSelectedEmail extends StatefulWidget {
  const DemoSelectedEmail({Key? key, required this.type}) : super(key: key);
  final int type;
  @override
  State<DemoSelectedEmail> createState() => _DemoSelectedEmailState();
}

class _DemoSelectedEmailState extends State<DemoSelectedEmail> {

  List<String> title = ['CRYSTAL','SILVER','GOLD','PLATINUM'];
  int cardSelectedType = 0;
  int selectedTypePlans = 4;
  TextEditingController controllerEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: GestureDetector(
        onTap: (){},
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: sizeH * 0.01,),
                headerContainer(),
                SizedBox(height: sizeH * 0.02,),
                containerBody()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerContainer(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.only(left: sizeW * 0.06, right: sizeW * 0.03),
      child: Row(
        children: [
          iconApp(),
          Expanded(child: Container()),
          IconButton(
            icon: Icon(Icons.cancel_outlined,size: sizeH * 0.04,color: AcademyColors.primary),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget iconApp(){
    return Container(
      height: sizeH * 0.1,
      width: sizeW * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.asset('assets/image/logo_colores_fondo_transparente.png').image,
            fit: BoxFit.fitWidth
        ),
      ),
    );
  }

  Widget containerBody(){

    TextStyle style = AcademyStyles().styleLato(size: 16,color: AcademyColors.primary,fontWeight: FontWeight.bold);

    return Container(
      margin: EdgeInsets.all(sizeH * 0.03),
      padding: EdgeInsets.all(sizeH * 0.02),
      width: sizeW,
      decoration: const BoxDecoration(
        color: AcademyColors.colors_E1E1E,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: sizeW,
            child: Text('Select the plans you are interested in',style: style,textAlign: TextAlign.left,),
          ),
          SizedBox(height: sizeH * 0.02),
          SizedBox(
            width: sizeW,
            child: Row(
              children: [
                Expanded(
                  child: containerBodyRow1(type: 0),
                ),
                SizedBox(width: sizeW * 0.05),
                Expanded(
                  child: containerBodyRow1(type: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: sizeH * 0.02),
          SizedBox(
            width: sizeW,
            child: Row(
              children: [
                Expanded(
                  child: containerBodyRow1(type: 2),
                ),
                SizedBox(width: sizeW * 0.05),
                Expanded(
                  child: containerBodyRow1(type: 3),
                ),
              ],
            ),
          ),
          SizedBox(height: sizeH * 0.04),
          SizedBox(
            width: sizeW,
            child: Text('Coments or questions',style: style,textAlign: TextAlign.left,),
          ),
          SizedBox(height: sizeH * 0.02),
          SizedBox(
            width: sizeW,
            child: TextFieldGeneral(
              maxLines: 5,
              padding: EdgeInsets.symmetric(vertical: sizeH * 0.01),
            ),
          ),
          SizedBox(height: sizeH * 0.02),
          SizedBox(
            width: sizeW,
            child: Text('Confirm your email',style: style,textAlign: TextAlign.left,),
          ),
          SizedBox(height: sizeH * 0.02),
          SizedBox(
            width: sizeW,
            child: TextFieldGeneral(
              hintText: 'Acceturamadrid@acceture.es',
              textEditingController: controllerEmail,
              initialValue: null,
              textInputType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: sizeH * 0.02),
          ButtonGeneral(
            title: 'Send resquest',
            backgroundColor: AcademyColors.primary,
            textStyle: AcademyStyles().stylePoppins(size: 16,color: Colors.white),
            width: sizeW,
            height: sizeH * 0.05,
            radius: 5,
            onPressed: (){
              dialogSendResquest();
            },
          ),
          SizedBox(height: sizeH * 0.02),
        ],
      ),
    );
  }

  Widget containerBodyRow1({required int type}){

    String title = 'Crystal';
    if(type == 1){ title = 'Silver'; }
    if(type == 2){ title = 'Gold'; }
    if(type == 3){ title = 'Platinium'; }

    return InkWell(
      onTap: (){
        selectedTypePlans = type;
        setState(() {});
      },
      child: Container(
        width: sizeW,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: selectedTypePlans == type ? AcademyColors.primary : Colors.white,
        ),
        padding: EdgeInsets.all(sizeH * 0.02),
        child: Center(
          child: Text(title,style: AcademyStyles().stylePoppins(size: 12, color: selectedTypePlans == type ? Colors.white : Colors.black)),
        ),
      ),
    );
  }

  Future dialogSendResquest() async{

    TextStyle style1 = AcademyStyles().stylePoppins(size: 14, color: AcademyColors.colors_787878);
    TextStyle style2 = AcademyStyles().stylePoppins(size: 14, color: AcademyColors.primary);

    bool? res = await showDialog(
        context: context,
        builder: ( context ) {
          return SimpleDialog(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop(true);
                },
                child: Container(
                  width: sizeW,
                  margin: EdgeInsets.only(right: sizeW * 0.05),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.cancel_outlined,color: AcademyColors.primary,size: sizeH * 0.03),
                ),
              ),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Text('Your request have been send to',style: style1,textAlign: TextAlign.center),
              ),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Text(controllerEmail.text,style: style2,textAlign: TextAlign.center),
              ),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Text('we are going to contact you soon through your email',style: style1,textAlign: TextAlign.center),
              ),
            ],
          );
        }
    );
    Navigator.of(context).pop(true);
    Navigator.of(context).pop(true);
  }
}
