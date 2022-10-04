<h1 align ='center'>Components_qt_kits</h1>
<p align = 'justify'>	A ideia principal é a componentização de widgets. Ou seja, os widgets mais usados do nosso desenvolvimento estaram de forma simples e dinamica para qualquer aplicação. </p>


<h2>Primeiros passos<h2>
<p>importe a package </p>
 

components_qt_kit:
      git:
        url: https://github.com/tobiassilva/components_qt_kit.git
ou 

flutter pub add components_qt_kit

importe no arquivo:

import 'package:components_qt_kit/src/kit_buttons.dart';

<h2 aligin='center'>Importante</h2>
<p> Esta package possui diversos tipos de Wigets e Funções que podem ser usadas durante a aplicação</p>

<h2>Requests Components</h2>

Nesta classe você pode chamar requisições HTTP,  GET/POST/PUT. Veja no exemplo abaixo:



<code>
Future getDados() async {
    var res = await RequestsComponents().getComParametros(
        "${GlobalsInformations().urlDefault}/pesquisa_data.php}",
        "?pesquisa_id=${GlobalsInformations().idPesquisa}");
 var decodeDados = jsonDecode(res[0]);
    print("res: $res");
  }
  
  </code>
 <p>para mais informações sobre esta classe: Ctrl + clique esquerdo sobre o nome da classe</p>

<h2>UI KIT's</h2>


<h3>KitButtons()</h3>


 <p align= 'justify'>Para as nossas classes de UI Kits usamos parametros que são objetivos para cada tipo de Widget.
 Na classe KitButton temos:
  - 'onTap' :  que espera uma função,
  - 'decoration': espera um BoxDecoration(),
  - 'paddingButton': padding do botão,
  - 'margingButton': margin do botão,
  - 'heigth' &  'width': define o tamanho do botão,
  - 'iconSufix'& 'iconPrefix': espera um Widget Icon(),
  - 'iconPadding': espaçamento do icone,
  - 'spaceIcons': é o espaçamento do icone em relação a um outro widget que esta na mesma linha, um iconSufix por exemplo;
  - 'textStyle': estilização de texto,
   </p>


 <code>  KitButton(
                    
                  onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder :(_)=>HomePage()));
                  },
                    decorationButton: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    shadowButton: true,
                    height: 80,
                    width: 200,
                      paddingButton: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                        margingButton:  const EdgeInsets.all(10),
                    iconSufix: const Icon(
                      Icons.accessibility_new_sharp,
                      size: 25,
                      color: Colors.white,
                    ),
                    iconSufixPadding: const EdgeInsets.all(15),
                    iconSufixDecoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    text: 'BOTÃO KIT',
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    spaceItens: 10,
                  
                  ),
                ),
 </code>
 
	
 
