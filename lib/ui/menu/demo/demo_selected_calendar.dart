import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:academybw/widgets_shared/textfield_general.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DemoSelectedCalendar extends StatefulWidget {
  const DemoSelectedCalendar({Key? key, required this.type}) : super(key: key);
  final int type;
  @override
  State<DemoSelectedCalendar> createState() => _DemoSelectedCalendarState();
}

class _DemoSelectedCalendarState extends State<DemoSelectedCalendar> {

  List<String> title = ['CRYSTAL','SILVER','GOLD','PLATINUM'];
  int cardSelectedType = 0;
  int selectedTypePlans = 4;
  TextEditingController controllerEmail = TextEditingController();
  DateTime _focusedDay = DateTime.now();
  TimeOfDay? hourSelected;

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
            child: Text('Select the date and hour',style: style,textAlign: TextAlign.left,),
          ),
          SizedBox(height: sizeH * 0.02),
          calendarSelect(),
          SizedBox(height: sizeH * 0.02),
          selectedHour(),
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
            title: 'Confirm',
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

  Widget calendarSelect(){

    TextStyle style = AcademyStyles().stylePoppins(color: Colors.black,size: 14,fontWeight: FontWeight.w600);

    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.02,vertical: sizeH * 0.02),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TableCalendar(
        currentDay: _focusedDay,
        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        locale: "es_ES",
        onDaySelected: (selectedDay, focusedDay) {
          _focusedDay = focusedDay;
          setState(() {});
        },
        calendarFormat: CalendarFormat.month,
        calendarStyle: CalendarStyle(
          defaultTextStyle: style,
          weekendTextStyle: style,
        ),
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
        ),
      ),
    );
  }

  Widget selectedHour(){
    return InkWell(
      child: Container(
        width: sizeW,
        padding: EdgeInsets.all(sizeH * 0.02),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(hourSelected == null ? 'Seleccionar hora' : '${hourSelected!.hour.toString()} : ${hourSelected!.minute.toString()}',
          style: AcademyStyles().styleLato(size: 14, color: Colors.black)),
        ),
      ),
      onTap: (){
        showTimePicker(
          context: context,
          initialTime: hourSelected ?? TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
        ).then((value) {
          if(value != null){
            hourSelected = value;
            setState(() {});
          }
          setState(() {});
        });
      },
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
                child: Text('We are going to contact you through',style: style1,textAlign: TextAlign.center),
              ),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Text(controllerEmail.text,style: style2,textAlign: TextAlign.center),
              ),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Text('with the confirmation of your appoinment',style: style1,textAlign: TextAlign.center),
              ),
            ],
          );
        }
    );
    Navigator.of(context).pop(true);
    Navigator.of(context).pop(true);
  }
}
