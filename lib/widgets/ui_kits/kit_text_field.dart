import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KitTextfield extends StatefulWidget {
  // estrutura textfield
  // tamanho container
  final double heigth;
  final double width;

  // variavel ferificar se quer só o gradient no decoration
  final bool containGradient;
  // gradient container e textfield
  final Color? colorGradient;
  final Color? colorGradient2;
  final Alignment? alignmentGradientBegin;
  final Alignment? alignmentGradientEnd;
  // para definir borda container
  final BoxDecoration? decoration;
  // padding e margin do container
  final EdgeInsets? padding;
  final EdgeInsets margin;

  // cor container
  final Color? colorTextField;

  // define a posicao do titulo
  final MainAxisAlignment? mainAxisAlignmentTitle;
  // verifica se existe titulo para forms
  final bool? containTiltle;
  final String title;

  // atributos textField

  final TextInputType? keyboardType;
  final Icon? prefix;
  final IconButton? sufix;
  final bool decorationWithOutline;
  final Color colorBorderSide;
  final Color? colorMaterial;
  final double widthBorderSide;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool alignLabelWithHint;

  final TextStyle? titleStyle;
  final TextStyle? style;

  // em desenvolvimento > final bool? defaultTextField;

  // texto textField
  final String textInTextField;
  final TextStyle textStyleInTextField;
  // estrutura do textField
  final bool textFieldWithGradient;

  final InputBorder border;
  final bool obscureText;
  final TextEditingController? controller;
  final int? maxlines;
  final int? minlines;
  final List<TextInputFormatter>? inputFormatters;
  // habilita textField
  final bool enable;
  final bool enableSuggestions;
  //
  final ValueChanged<String>? onChanged;

  const KitTextfield(
      {this.heigth = 50,
      this.width = 300,
      this.decoration,
      this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      this.margin = const EdgeInsets.symmetric(horizontal: 70),
      this.colorGradient,
      this.colorGradient2,
      this.containTiltle = false,
      this.title = 'QT Components UI',
      this.titleStyle,
      this.onChanged,
      this.textInTextField = 'QT Components UI',
      this.textStyleInTextField = const TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),
      this.border = InputBorder.none,
      this.obscureText = false,
      this.controller,
      this.keyboardType,
      this.prefix = const Icon(
        Icons.search_rounded,
        color: Colors.black,
      ),
      this.sufix,
      this.maxlines,
      this.minlines,
      this.colorTextField,
      this.containGradient = false,
      this.alignmentGradientBegin,
      this.alignmentGradientEnd,
      this.mainAxisAlignmentTitle,
      this.enable = true,
      this.enableSuggestions = false,
      this.decorationWithOutline = false,
      this.alignLabelWithHint = true,
      this.colorBorderSide = Colors.orange,
      this.floatingLabelBehavior = FloatingLabelBehavior.always,
      this.widthBorderSide = 1.0,
      this.inputFormatters,
      this.textFieldWithGradient = false,
      this.colorMaterial,
      this.style});

  @override
  _KitTextfieldState createState() => _KitTextfieldState();
}

class _KitTextfieldState extends State<KitTextfield> {
  final controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.textFieldWithGradient
            ? texfieldWithGradient()
            : textFieldDefault()
      ],
    );
  }

  Widget texfieldWithGradient() {
    return Container(
      decoration: widget.decoration,
      padding: widget.padding,
      margin: widget.margin,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(56),
        color: widget.colorMaterial,
        child: TextField(
          style: widget.style,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          obscureText: widget.obscureText,
          controller: widget.controller ?? controlador,
          enableSuggestions: widget.enableSuggestions,
          minLines: widget.minlines,
          maxLines: widget.maxlines,
          inputFormatters: widget.inputFormatters,
          decoration: widget.decorationWithOutline
              ? InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.colorBorderSide,
                          width: widget.widthBorderSide)),
                  labelText: widget.textInTextField,
                  floatingLabelStyle: widget.textStyleInTextField,
                  floatingLabelBehavior: widget.floatingLabelBehavior,
                  alignLabelWithHint: widget.alignLabelWithHint,
                  border: widget.border,
                )
              : InputDecoration(
                  hintText: widget.textInTextField,
                  hintStyle: widget.textStyleInTextField,
                  border: widget.border,
                  enabled: widget.enable,
                  suffixIcon: widget.sufix,
                  prefixIcon: widget.prefix,
                ),
        ),
      ),
    );
  }

  Widget textFieldDefault() {
    return Column(
      children: [
        widget.containTiltle!
            ? Container(
                margin: widget.margin,
                child: Row(
                  mainAxisAlignment:
                      widget.mainAxisAlignmentTitle ?? MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      child: Flexible(
                        child: Text(
                          widget.title,
                          style: widget.titleStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const Text(''),
        Container(
            height: widget.heigth,
            width: widget.width,
            decoration: widget.decoration ??
                BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: widget.colorTextField ?? Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(4, 2),
                        blurRadius: 1.5,
                        spreadRadius: 1.0)
                  ],
                  gradient: !widget.containGradient
                      ? LinearGradient(
                          begin: widget.alignmentGradientBegin ??
                              Alignment.topLeft,
                          end: widget.alignmentGradientEnd ??
                              Alignment.centerRight,
                          colors: [
                              widget.colorGradient ?? Colors.white,
                              widget.colorGradient2 ?? Colors.white,
                            ])
                      : const LinearGradient(colors: [
                          Colors.white,
                          Colors.blueAccent,
                        ]),
                ),
            padding: widget.padding,
            margin: widget.margin,
            child: TextField(
              onChanged: widget.onChanged,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              obscureText: widget.obscureText,
              controller: widget.controller ?? controlador,
              enableSuggestions: widget.enableSuggestions,
              minLines: widget.minlines,
              maxLines: widget.maxlines,
              inputFormatters: widget.inputFormatters,
              decoration: widget.decorationWithOutline
                  ? InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.colorBorderSide,
                              width: widget.widthBorderSide)),
                      labelText: widget.textInTextField,
                      floatingLabelStyle: widget.textStyleInTextField,
                      floatingLabelBehavior: widget.floatingLabelBehavior,
                      alignLabelWithHint: widget.alignLabelWithHint,
                      border: widget.border,
                    )
                  : InputDecoration(
                      hintText: widget.textInTextField,
                      hintStyle: widget.textStyleInTextField,
                      border: widget.border,
                      enabled: widget.enable,
                      suffixIcon: widget.sufix,
                      prefixIcon: widget.prefix,
                    ),
            )),
      ],
    );
  }
}
