import 'package:flutter/material.dart';

class KitLoading extends StatefulWidget {
  final String text;
  final Widget loading;
  final double height;
  final double width;
  final BoxDecoration boxDecoration;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double? spaceItens;
  final TextStyle textStyle;

  const KitLoading(
      {Key? key,
      this.loading = const CircularProgressIndicator(
        backgroundColor: Colors.white10,
        color: Colors.white,
      ),
      this.text = 'Carregando...',
      this.textStyle = const TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      this.boxDecoration =
          const BoxDecoration(color: Color.fromRGBO(48, 97, 140, 1)),
      this.height = double.infinity,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.mainAxisSize = MainAxisSize.max,
      this.spaceItens = 10,
      this.width = double.infinity})
      : super(key: key);

  @override
  _KitLoadingState createState() => _KitLoadingState();
}

class _KitLoadingState extends State<KitLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: widget.boxDecoration,
      child: Row(
        mainAxisSize: widget.mainAxisSize!,
        mainAxisAlignment: widget.mainAxisAlignment!,
        children: [
          Column(
            mainAxisSize: widget.mainAxisSize!,
            mainAxisAlignment: widget.mainAxisAlignment!,
            children: [
              Container(child: widget.loading),
              SizedBox(
                height: widget.spaceItens!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
