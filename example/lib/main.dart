import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:components_ui/widgets/ui_kits/kit_appbars.dart';
import 'package:components_ui/widgets/ui_kits/kit_buttons.dart';
import 'package:components_ui/widgets/ui_kits/kit_image_picker_view.dart';
import 'package:components_ui/widgets/ui_kits/kit_loading.dart';
import 'package:components_ui/widgets/ui_kits/kit_text_field.dart';
import 'package:example/store/store.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:components_ui/widgets/ui_kits/ui_appbars.dart';+
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //ESTÁ EM ORDEM ALFABÉTICA
      providers: [
        Provider<StoreImages>(
          create: (_) => StoreImages(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool carregando = false;

  final controlador = TextEditingController();
  // final controladorTeste2 = TextEditingController();
  bool _icon = false;
  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final colorizeColorsTitle = [
    Colors.orange,
    Colors.blue,
    Colors.yellow,
    Colors.white,
  ];

  final colorizeTextStyle = TextStyle(
    fontSize: 25.0,
    fontFamily: 'Josefin Sans',
  );
  @override
  Widget build(BuildContext context) {
    // provider declarado para uso de lista criada em arquivos mobx
    // a lista criada em arquivo mobx são modificadas sem a necessecidade de uma @action

    final storeImages = Provider.of<StoreImages>(context, listen: false);
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Color.fromRGBO(48, 97, 140, 1),
          body: carregando
              ? KitLoading(
                  boxDecoration: BoxDecoration(color: Colors.blue[900]),
                  loading: SizedBox(
                    width: 250.0,
                    child: Column(
                      children: [
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Canterbury',
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText('C O M P O N E N T S '),
                              TypewriterAnimatedText('U I'),
                              TypewriterAnimatedText('K I T '),
                              TypewriterAnimatedText('A V A L I E - N O S '),
                              TypewriterAnimatedText('D E I X E  S U A '),
                              TypewriterAnimatedText(' S U G E S T Ã O'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
              : Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // aqui se inicializa a appbar
                        KitAppBar(),
                        SizedBox(
                          height: 20,
                        ),
                        // aqui fica o botao personalizavel de imagens com conversão em base 64
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.app_registration_outlined,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Botões personalizados',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        KitImagePickerView(
                          convertImage: true,
                          listConverted: storeImages.listImages,
                          maxImages: 5,
                          marginHorizontal: 20,
                          marginVertical: 15,
                          actionBarTitle: 'Quadrant Components',
                          boxDecorationButton: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          titleButton: 'Adicionar imagem',
                          iconSufix: Icon(
                            Icons.camera_enhance,
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.width * .5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.app_registration_outlined,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'TextFields Personalizados',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // textfield de barra de pesquisa
                        KitTextfield(
                          containGradient: true,
                          containTiltle: true,
                          textInTextField: 'Barra de Pesquisa',
                          margin: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                          colorMaterial: Colors.white,
                          textFieldWithGradient: true,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.centerRight,
                                colors: const [
                                  Colors.white,
                                  Colors.blueAccent,
                                ]),
                          ),
                        ),
                        // textfield de email
                        KitTextfield(
                          containGradient: true,
                          containTiltle: true,
                          textInTextField: 'Digite seu email',
                          textStyleInTextField: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 4,
                          ),
                          colorMaterial: Colors.white,
                          textFieldWithGradient: true,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                              colors: const [
                                Colors.white,
                                Colors.deepPurpleAccent,
                              ],
                            ),
                          ),
                          prefix: Icon(
                            Icons.email_outlined,
                            color: Colors.black38,
                          ),
                        ),
                        //textfield de senha
                        KitTextfield(
                          containGradient: true,
                          containTiltle: true,
                          textInTextField: 'Digite sua senha',
                          textStyleInTextField: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500),
                          margin: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                          colorMaterial: Colors.white,
                          textFieldWithGradient: true,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                              colors: const [
                                Colors.white,
                                Colors.deepPurpleAccent,
                              ],
                            ),
                          ),
                          prefix: Icon(
                            Icons.lock_outlined,
                            color: Colors.black38,
                          ),
                          sufix: IconButton(
                            onPressed: () {
                              setState(() => _icon = !_icon);
                            },
                            icon: _icon
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.app_registration_outlined,
                                color: Colors.black38,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Text(
                                  'Botões para Login Personalizados',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
// Row de botoes estilizados para login com plataformas externas
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              KitButton(
                                widgetCenter: Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                ),
                                width: MediaQuery.of(context).size.width * .15,
                                height:
                                    MediaQuery.of(context).size.height * .075,
                                decorationButton: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(4, 4),
                                        blurRadius: 4,
                                        spreadRadius: -2)
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                              ),
                              KitButton(
                                widgetCenter: Icon(
                                  FontAwesomeIcons.facebookF,
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * .15,
                                height:
                                    MediaQuery.of(context).size.height * .075,
                                decorationButton: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(4, 4),
                                        blurRadius: 4,
                                        spreadRadius: -2)
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue[800],
                                ),
                              ),
                              KitButton(
                                widgetCenter: Icon(
                                  FontAwesomeIcons.apple,
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * .15,
                                height:
                                    MediaQuery.of(context).size.height * .075,
                                decorationButton: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(4, 4),
                                        blurRadius: 4,
                                        spreadRadius: -2)
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        KitButton(
                          width: MediaQuery.of(context).size.width * .8,
                          height: MediaQuery.of(context).size.height * .08,
                          widgetCenter: Text(
                            'Clique aqui',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 25),
                          ),
                          decorationButton: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green[700]),
                          onTap: () async {
                            setState(() {
                              carregando = true;
                            });
                            await Future.delayed(Duration(seconds: 10));

                            setState(() {
                              carregando = false;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
