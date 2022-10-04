// import 'dart:convert';
// import 'dart:ui';

// import 'package:components_qt_kit/widgets/ui_kits/globals/kit_globals_functions.dart';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import 'package:components_qt_kit/components_qt_kit.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'dart:convert';
// import 'dart:math';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:crypto/crypto.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// class KitLoginAGF extends StatefulWidget {
//   final double? widthButtonApple;
//   final double? heightButtonApple;
//   final BoxDecoration? decorationButtonApple;
//   final Widget? childButtonApple;
//   final bool? containButtonAppleId;
//   final GestureTapCallback? onTapButtonApple;
//   final double? widthButtonGoogle;
//   final double? heightButtonGoogle;
//   final BoxDecoration? decorationButtonGoogle;
//   final Widget? childButtonGoogle;
//   final bool? containButtonGoogle;
//   final GestureTapCallback? onTapButtonGoogle;
//   final double? widthButtonFacebook;
//   final double? heightButtonFacebook;
//   final BoxDecoration? decorationButtonFacebook;
//   final Widget? childButtonFacebook;
//   final bool? containButtonFacebook;
//   final GestureTapCallback? onTapButtonFacebook;
//   const KitLoginAGF({
//     Key? key,
//     this.widthButtonApple = 70,
//     this.heightButtonApple = 70,
//     this.decorationButtonApple,
//     this.childButtonApple,
//     this.containButtonAppleId = true,
//     this.onTapButtonApple,
//     this.widthButtonGoogle = 70,
//     this.heightButtonGoogle = 70,
//     this.decorationButtonGoogle,
//     this.childButtonGoogle,
//     this.containButtonGoogle = true,
//     this.onTapButtonGoogle,
//     this.widthButtonFacebook = 70,
//     this.heightButtonFacebook = 70,
//     this.decorationButtonFacebook,
//     this.childButtonFacebook,
//     this.containButtonFacebook = true,
//     this.onTapButtonFacebook,
//   }) : super(key: key);

//   @override
//   State<KitLoginAGF> createState() => _KitLoginAGFState();
// }

// class _KitLoginAGFState extends State<KitLoginAGF> {
//   void functionApple() {}
//   void functionFacebook() {}

//   void functionGoogle() {}
//   GoogleSignInAccount? _currentUser;

//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: [
//       'email',
//     ],
//   );

//   final FirebaseAuth auth = FirebaseAuth.instance;
//   Future<bool> signInGoogle() async {
//     if (await KitGlobalsFunctions().connection()) {
//       try {
//         final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//         final GoogleSignInAuthentication? googleAuth =
//             await googleUser?.authentication;

//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth?.accessToken,
//           idToken: googleAuth?.idToken,
//         );

//         await FirebaseAuth.instance.signInWithCredential(credential);

//         return true;
//       } on Exception catch (e) {
//         print('Erro>> $e');
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Erro ao tentar logar')));

//         return false;
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Sem conexão com a internet!')));

//       return false;
//     }
//   }

//   ///Login com Facebook
//   ///
//   Future signInFacebook() async {
//     bool _requestLoginFacebook = false;

//     if (await KitGlobalsFunctions().connection()) {
//       try {
//         final resultFacebook = await FacebookAuth.i
//             .login(permissions: ["public_profile", "email"]);

//         if (resultFacebook.status == LoginStatus.success) {
//           final facebookAuthCredential =
//               FacebookAuthProvider.credential(resultFacebook.accessToken.token);

//           final UserCredential user =
//               await auth.signInWithCredential(facebookAuthCredential);

//           final notesReference = FirebaseDatabase.instance
//               .reference()
//               .child('userProfile/${user.user.uid}');
//           notesReference.once().then((DataSnapshot snapshot) async {
//             await notesReference.update({
//               'name': user.user.displayName,
//               'email': user.user.providerData[0].email,
//               'up': 0
//             });
//           });
//         }
//       } on Exception catch (e) {
//         print('Erro>> $e');
//         return false;
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           new SnackBar(content: Text('Sem conexão com a internet.')));

//       return false;
//     }
//   }

//   String sha256ofString(String input) {
//     final bytes = utf8.encode(input);
//     final digest = sha256.convert(bytes);
//     return digest.toString();
//   }

//   Future<bool> signInWithApple(BuildContext context) async {
//     final rawNonce = generateNonce();
//     final nonce = sha256ofString(rawNonce);

//     //final loginStore = Provider.of<LoginStore>(context);

//     if (await KitGlobalsFunctions().connection()) {
//       try {
//         // Request credential for the currently signed in Apple account.

//         final appleCredential = await SignInWithApple.getAppleIDCredential(
//           scopes: [
//             AppleIDAuthorizationScopes.email,
//             AppleIDAuthorizationScopes.fullName,
//           ],
//           nonce: nonce,
//         );

//         // Create an `OAuthCredential` from the credential returned by Apple.
//         final oauthCredential = OAuthProvider("apple.com").credential(
//           idToken: appleCredential.identityToken,
//           rawNonce: rawNonce,
//         );
//         final UserCredential user =
//             await auth.signInWithCredential(oauthCredential);

//         final notesReference = FirebaseDatabase.instance
//             .reference()
//             .child('userProfile/${user.user.uid}');
//         notesReference.update(
//             {'name': user.user.displayName, 'email': user.user.email, 'up': 0});
//       } catch (_err) {
//         print('Erro>> $_err');
//         ScaffoldMessenger.of(context)
//             .showSnackBar(new SnackBar(content: Text('Erro ao tentar logar')));
//         return false;
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           new SnackBar(content: Text('Sem conexão com a internet!')));

//       return false;
//     }

//     return true;
//   }

//   Future<bool> createInEmail(BuildContext context, controlador) async {
//     if (await KitGlobalsFunctions().connection()) {
//       try {
//         final UserCredential user = await auth.createUserWithEmailAndPassword(
//             email: emailC.text, password: passw.text);

//         final notesReference = FirebaseDatabase.instance
//             .reference()
//             .child('userProfile/${user.user.uid}');

//         notesReference.update(
//             {'name': controlador.text, 'email': user.user.email, 'up': 0});
//       } catch (e) {
//         print('ERRO00');
//         print("e: $e");
//         ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
//             content: Text(
//                 'O endereço de email já está sendo usado por outra conta ou é Inválido!')));

//         return false;
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           new SnackBar(content: Text('Sem conexão com a internet!')));

//       return false;
//     }

//     return true;
//   }

//   ///RECUPERAR EMAIL
//   ///
//   Future recover(emailRec) async {
//     if (await KitGlobalsFunctions().connection()) {
//       try {
//         final user = auth.sendPasswordResetEmail(email: emailRec.text);
//         print(user); // Print para resolver problems apenas
//       } on Exception catch (e) {
//         print('Erro>> $e');
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           new SnackBar(content: Text('Sem conexão com a internet!')));
//     }

//     return;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   color: Colors.black45,
//                   width: MediaQuery.of(context).size.width * .4,
//                   height: 0.5,
//                 ),
//               ),
//               const Text('Ou acesse com'),
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   color: Colors.black45,
//                   width: MediaQuery.of(context).size.width * .4,
//                   height: 0.5,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * .14,
//               ),

//               //apple
//               Visibility(
//                 visible: widget.containButtonAppleId!,
//                 child: KitButton(
//                   width: widget.widthButtonApple!,
//                   height: widget.heightButtonApple!,
//                   decorationButton: widget.decorationButtonApple ??
//                       BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.black,
//                           boxShadow: const [
//                             BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(4, 4),
//                                 blurRadius: 4,
//                                 spreadRadius: -2)
//                           ]),
//                   widgetCenter: widget.childButtonApple ??
//                       const Icon(
//                         FontAwesomeIcons.apple,
//                         color: Colors.white,
//                       ),
//                   // tenho que testar  botar icones e tentar botar a pasta assets no exemplo
//                   onTap: widget.onTapButtonApple!,
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * .1,
//               ),
//               //google
//               Visibility(
//                 visible: widget.containButtonGoogle!,
//                 child: KitButton(
//                   width: widget.widthButtonGoogle!,
//                   height: widget.heightButtonGoogle!,
//                   decorationButton: widget.decorationButtonGoogle ??
//                       BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.white,
//                           boxShadow: const [
//                             BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(4, 4),
//                                 blurRadius: 4,
//                                 spreadRadius: -2)
//                           ]),
//                   widgetCenter: widget.childButtonGoogle ??
//                       const Icon(
//                         FontAwesomeIcons.google,
//                         color: Colors.red,
//                       ),
//                   onTap: widget.onTapButtonGoogle!,
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * .1,
//               ),

//               //facebook
//               Visibility(
//                 visible: widget.containButtonFacebook!,
//                 child: KitButton(
//                   width: widget.widthButtonFacebook!,
//                   height: widget.heightButtonFacebook!,
//                   decorationButton: widget.decorationButtonFacebook ??
//                       BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.white,
//                           boxShadow: const [
//                             BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(4, 4),
//                                 blurRadius: 4,
//                                 spreadRadius: -2)
//                           ]),
//                   widgetCenter: widget.childButtonFacebook ??
//                       const Icon(
//                         FontAwesomeIcons.facebook,
//                         color: Colors.blue,
//                       ),
//                   onTap: widget.onTapButtonFacebook!,
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * .14,
//               ),
//             ],
//           )
//         ]);
//   }
// }
