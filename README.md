### Ui Dev tools components

#### components_ui_devtools
<p align = 'justify'>	A ideia principal é a componentização de widgets. Ou seja, os widgets mais usados do nosso desenvolvimento estaram de forma simples e dinamica para qualquer aplicação. </p>


## Primeiros passos
Adicione ao seu pubspec.yaml o pacote

<code>
 -- flutter pub add components_ui_devtools <br />
</code>
ou no seu pubspec cole: <br />
-components_qt_kit: <br />
---git: <br />
-----url: https://github.com/davi-oliver/components_ui <br />
 
 
## No seu projeto
 

<code>import 'package:components_ui/src/kit_buttons.dart';</code>

 

<h1>Requests Components</h1>
As requisições é feitas atraves do pacote http. O intuito é fazer com que a requisição possa retornar todo o status, data e exceptions que possa ter durante o acesso. 
A forma escolhida para receber essas informações é feita atraves de json. 

 
    var _data = {
            "requisicao_url": "$_url",
            "tipo_requisicao": "GET",
            "status_code": "${_requestGet.statusCode}",
            "conexao": "$_resultConexao",
            "mensagem": "Sucesso",
            "retorno": "$_body",
          };
Nesse exemplo temos o data de uma requisição GET.

### Métodos de requisição
A classe suporta os metodos HTTP como, GET/POST/PUT. 


### Implementação
A implementação não foge do conceito basico de requisição http do pacote http, disponivel no <a href="pub.dev">pub.dev<a/>
<br /><code> await http.get(Uri.parse(_url)); // deve ser informado a url onde deseja-se requisitar OBS: método GET usuado para exemplificar</code> 


### Como utilizar

a utilização é simples, uma vez que importado o pacote, chame RequestComponents().metodo();
veja:
 
     Future searchVideo() async {
        var res = await RequestsComponents().getComParametros(
            url: "https://www.googleapis.com/youtube/v3/search?",
            param: "part=snippet&q=Jay%20Chou%20Mojito&key=[YOUR_API_KEY]");

        var decodeDados = jsonDecode(res[0]);
 
      }
 
 <p>para mais informações sobre esta classe: Ctrl + clique esquerdo sobre o nome da classe</p>

<h2>UI Components & UX Desing</h2>


 KitButtons() 


 <p align= 'justify'>Para as nossas classes de UI Kits usamos parametros que são objetivos para cada tipo de Widget.
 Na classe KitButton temos:<br />
  - 'onTap' :  que espera uma função,<br />
  - 'decoration': espera um BoxDecoration(),<br />
  - 'paddingButton': padding do botão,<br />
  - 'margingButton': margin do botão,<br />
  - 'heigth' &  'width': define o tamanho do botão,<br />
  - 'iconSufix'& 'iconPrefix': espera um Widget Icon(),<br />
  - 'iconPadding': espaçamento do icone,<br />
  - 'spaceIcons': é o espaçamento do icone em relação a um outro widget que esta na mesma linha, um iconSufix por exemplo;<br />
  - 'textStyle': estilização de texto,<br />
   </p>

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
               
                          },
                        ),


## Exemple 
	
 
