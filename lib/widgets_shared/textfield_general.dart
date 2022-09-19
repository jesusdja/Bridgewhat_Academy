import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldGeneral extends StatefulWidget {
  final int maxLines;
  final double radius;
  final double sizeHeight;
  final double sizeBorder;
  final String? placeHolder;
  final String? initialValue;
  final String hintText;
  final bool obscure;
  final bool autoCorrect;
  final bool autoValidate;
  final bool enable;
  final bool autofocus;
  final bool activeErrorText;
  final IconData? icon;
  final Color borderColor;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextStyle labelStyle;
  final TextStyle errorStyle;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry padding;
  final TextCapitalization textCapitalization;
  final Color colorBack;
  final TextInputAction? textInputAction;
  final BoxConstraints? constraints;
  final List<TextInputFormatter> inputFormatters;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry contentPadding;

  const TextFieldGeneral({
    Key? key,
    this.initialValue,
    this.placeHolder,
    this.icon,
    this.borderColor = Colors.grey,
    this.textEditingController,
    this.onChanged,
    this.textInputType = TextInputType.name,
    this.autoCorrect = true,
    this.obscure = false,
    this.autoValidate = false,
    this.maxLines = 1,
    this.focusNode,
    this.onTap,
    this.onFieldSubmitted,
    this.validator,
    this.sizeHeight = 0,
    this.textAlign = TextAlign.left,
    this.labelStyle = const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
    this.errorStyle = const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),
    this.boxShadow,
    this.sizeBorder = 1.5,
    this.suffixIcon,
    this.prefixIcon,
    this.enable = true,
    this.padding = const EdgeInsets.only(left: 5),
    this.textCapitalization = TextCapitalization.sentences,
    this.hintText = '',
    this.colorBack = Colors.white,
    this.autofocus = false,
    this.textInputAction,
    this.constraints,
    this.radius = 10.0,
    this.inputFormatters = const [],
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    this.activeErrorText = true,
  }) : super(key: key);

  @override
  State<TextFieldGeneral> createState() => _TextFieldGeneralState();
}

class _TextFieldGeneralState extends State<TextFieldGeneral> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      constraints: widget.constraints,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: widget.colorBack,
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        border: Border.all(
          width: widget.sizeBorder,
          color: widget.borderColor,
        ),
        boxShadow: widget.boxShadow,
      ),
      child: TextFormField(
        controller: widget.textEditingController,
        initialValue: widget.initialValue,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
        style: widget.labelStyle,
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        obscureText: widget.obscure,
        enabled: widget.enable,
        onChanged: widget.onChanged,
        autocorrect: widget.autoCorrect,
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
        textCapitalization: widget.textCapitalization,
        autofocus: widget.autofocus,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.colorBack,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: const BorderSide(
              width: 0.0,
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            borderSide: const BorderSide(
              width: 0.0,
              color: Colors.transparent,
            ),
          ),
          suffixIcon: widget.suffixIcon,
          labelText: widget.placeHolder,
          labelStyle: widget.labelStyle,
          errorStyle: widget.errorStyle,
          hintText: widget.hintText,
          hintStyle: widget.labelStyle,
          prefixIcon: widget.prefixIcon,
          contentPadding: widget.contentPadding
        ),
      ),
    );
  }
}

Map<String, dynamic> validateUserAddress({required String input}) {

  Map<String, dynamic> result = {'valid' : false, 'sms' : 'No es valido.'};
  const emailRegex = r"""^[a-zA-Z]+""";
  const userRegex = ""r'^[a-zA-Z0-9]+$'"";
  if (RegExp(emailRegex).hasMatch(input)) {
    if (input.length > 4){
      if(RegExp(userRegex).hasMatch(input)){
        result['valid'] = true;
        result['sms'] = 'valido';
        return result;
      }else{
        result['valid'] = false;
        result['sms'] = "Solo se permiten letras y numeros.";
        return result;
      }
    }else{
      result['valid'] = false;
      result['sms'] = "Usuario debe contener mas de 5 caracteres.";
      return result;
    }
  } else {
    result['valid'] = false;
    result['sms'] = 'Usuario invalido. Debe comenzar con una letra.';
    return result;
  }
}

Map<String, dynamic> validateEmailAddress({required String email}) {
  Map<String, dynamic> result = {'valid' : false, 'sms' : 'No es valido.'};
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(email)) {
    result['valid'] = true;
    result['sms'] = 'Correo valido.';
    return result;
  } else {
    result['valid'] = false;
    result['sms'] = 'Correo no válido';
    return result;
  }
}

Map<String, dynamic> validatePassword({required String input}) {
  Map<String, dynamic> result = {'valid' : false, 'sms' : 'No es valido.'};
  // String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$';
  String oneNumber = r'^.*[0-9].*$';
  String oneLowerCase = r'^.*[a-z].*$';
  String oneUpperCase = r'^.*[A-Z].*$';
  if (input.length < 8) {
    result['valid'] = false;
    result['sms'] = "Usá mínimo 8 caracteres";
    return result;
  } else if (!RegExp(oneNumber).hasMatch(input)) {
    result['valid'] = false;
    result['sms'] = "Debe contener al menos un número";
    return result;
  } else if (!RegExp(oneLowerCase).hasMatch(input)) {
    result['valid'] = false;
    result['sms'] = "Debe contener al menor una minúscula";
    return result;
  } else if (!RegExp(oneUpperCase).hasMatch(input)) {
    result['valid'] = false;
    result['sms'] = "Debe contener al menos una mayúscula";
    return result;
  }
  result['valid'] = true;
  result['sms'] = 'valido.';
  return result;
}