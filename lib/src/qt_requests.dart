import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

List listaRequest = [];

class RequestsComponents {
  Future getRequests(_url) async {
    listaRequest.clear();
    var _requestGet;
    var statusCode;
    var _resultConexao;
    try {
      _resultConexao = await resultConexao();
      if (_resultConexao) {
        _requestGet = await http.get(Uri.parse(_url));
        statusCode = _requestGet.statusCode;
        if (_requestGet.statusCode == 200 && _requestGet.body != null) {
          var _body = jsonDecode(_requestGet.body.toString());

          var _data = {
            "requisicao_url": "$_url",
            "tipo_requisicao": "GET",
            "status_code": "${_requestGet.statusCode}",
            "conexao": "$_resultConexao",
            "mensagem": "Sucesso",
            "retorno": "$_body",
          };
          listaRequest.add(jsonEncode(_data));

          return listaRequest;
        } else {
          // NULL SÓ PRA  QUANDO A REQUISIÇÃO NÃO FUNCIONOU
          /*   */
          var _data = {
            "requisicao_url": "$_url",
            "tipo_requisicao": "GET",
            "status_code": "${_requestGet.statusCode}",
            "conexao": "$_resultConexao",
            "mensagem": "1",
            "retorno": "Não possui",
          };
          listaRequest.add(jsonEncode(_data));
          return listaRequest;
        }
      } else {
        var _data = {
          "requisicao_url": "$_url",
          "tipo_requisicao": "GET",
          "status_code": "Não possui",
          "conexao": "$_resultConexao",
          "mensagem": "2",
          "retorno": "Não possui",
        };
        listaRequest.add(jsonEncode(_data));
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD
        return listaRequest;
      }
    } on Exception catch (e) {
      print(
          'ERRO> Requisição esta errada ou conexão\n Exception:$e\n${_requestGet.body}');
      if (_requestGet.body != null && _requestGet.statusCode == 200) {
        var _data = {
          "requisicao_url": "$_url",
          "tipo_requisicao": "GET",
          "status_code": "Não possui",
          "conexao": "$_resultConexao",
          "mensagem": "3",
          "retorno": "${_requestGet.body}",
        };
        listaRequest.add(jsonEncode(_data));
        return listaRequest;
      } else {
        var _data = {
          "requisicao_url": "$_url",
          "tipo_requisicao": "GET",
          "status_code": "Não possui",
          "conexao": "$_resultConexao",
          "mensagem": "3",
          "retorno": "$e",
        };
        listaRequest.add(jsonEncode(_data));
        return listaRequest;
      }
    }
  }

  Future getComParametros(_url, _parametros) async {
    listaRequest.clear();
    var _resultConexao, _requestGet;
    var _body;
    try {
      _resultConexao = await resultConexao();
      if (_resultConexao) {
        _requestGet = await http.get(Uri.parse(_url + _parametros));

        if (_requestGet.statusCode == 200 && _requestGet.body != null) {
          _body = jsonDecode(_requestGet.body.toString());
          var _data = {
            "requisicao_url": "$_url",
            "tipo_requisicao": "GET",
            "status_code": "${_requestGet.statusCode}",
            "conexao": "$_resultConexao",
            "mensagem": "Sucesso",
            "retorno": "$_body",
          };
          listaRequest.add(jsonEncode(_data));
          return listaRequest;
        } else {
          // NULL SÓ PRA  QUANDO A REQUISIÇÃO NÃO FUNCIONOU
          /*   */
          var _data = {
            "requisicao_url": "$_url",
            "tipo_requisicao": "GET",
            "status_code": "${_requestGet.statusCode}",
            "conexao": "$_resultConexao",
            "mensagem": "1",
            "retorno": "Não possui",
          };
          listaRequest.add(jsonEncode(_data));
          return listaRequest;
        }
      } else {
        var _data = {
          "requisicao_url": "$_url",
          "tipo_requisicao": "GET",
          "status_code": "Não possui",
          "conexao": "$_resultConexao",
          "mensagem": "2",
          "retorno": "Não possui",
        };
        listaRequest.add(jsonEncode(_data));
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD
        return listaRequest;
      }
    } on Exception catch (e) {
      print('ERRO> Requisição esta errada ou conexão\n Exception:$e');
      if (_requestGet.body != null && _requestGet.statusCode == 200) {
        var _data = {
          "requisicao_url": "$_url",
          "tipo_requisicao": "GET",
          "status_code": "Não possui",
          "conexao": "$_resultConexao",
          "mensagem": "3",
          "retorno": "${_requestGet.body}",
        };
        listaRequest.add(jsonEncode(_data));
        return listaRequest;
      } else {
        var _data = {
          "requisicao_url": "$_url",
          "tipo_requisicao": "GET",
          "status_code": "Não possui",
          "conexao": "$_resultConexao",
          "mensagem": "3",
          "retorno": "$e",
        };
        listaRequest.add(jsonEncode(_data));
        return listaRequest;
      }
    }
  }

  Future postRequests(_url, _body) async {
    var _resultConexao, _postRequest;
    try {
      _resultConexao = await resultConexao();
      if (_resultConexao && _body != null && _url != null) {
        _postRequest = await http.post(Uri.parse(_url), body: _body);
        if (_postRequest.statusCode == 200 && _postRequest.body != null) {
          var _body = jsonDecode(_postRequest.body.toString());
          var _data = {
            "requisicao_url": "$_url",
            "tipo_requisicao": "POST",
            "status_code": "${_postRequest.statusCode}",
            "conexao": "$_resultConexao",
            "mensagem": "1",
            "retorno": "$_body",
          };
          listaRequest.add(jsonEncode(_data));
          return listaRequest;
        } else {
          var _data = {
            "requisicao_url": "$_url",
            "tipo_requisicao": "POST",
            "status_code": "${_postRequest.statusCode}",
            "conexao": "$_resultConexao",
            "mensagem": "1",
            "retorno": "Não possui",
          };
          listaRequest.add(jsonEncode(_data));
          return listaRequest;
        }
      } else {
        var _data = {
          "requisicao_url": "$_url",
          "tipo_requisicao": "POST Com Parametros",
          "status_code": "Não possui",
          "conexao": "$_resultConexao",
          "mensagem": "2",
          "retorno": "Não possui",
        };
        listaRequest.add(jsonEncode(_data));
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD
        return listaRequest;
      }
    } on Exception catch (e) {
      var _data = {
        "requisicao_url": "$_url",
        "tipo_requisicao": "POST",
        "status_code": "Não possui",
        "conexao": "$_resultConexao",
        "mensagem": "3",
        "retorno": "Não possui",
      };
      listaRequest.add(jsonEncode(_data));
      return listaRequest;
    }
  }

  Future updateRequests(_url, _body) async {
    var _resultConexao, _putRequest;
    try {
      _resultConexao = await resultConexao();
      if (_resultConexao && _body != null && _url != null) {
        _putRequest = await http.put(Uri.parse(_url), body: _body);
        if (_putRequest.statusCode == 200 && _putRequest.body != null) {
          var _body = jsonDecode(_putRequest.body.toString());
          var _data = {
            "requisicao_url": "$_url",
            "tipo_requisicao": "GET",
            "status_code": "${_putRequest.statusCode}",
            "conexao": "$_resultConexao",
            "mensagem": "Sucesso",
            "retorno": "$_body",
          };
          listaRequest.add(jsonEncode(_data));
          return listaRequest;
        } else {
          var _data = {
            "requisicao_url": "$_url",
            "tipo_requisicao": "UPDATE(PUT)",
            "status_code": "${_putRequest.statusCode}",
            "conexao": "$_resultConexao",
            "mensagem": "1",
            "retorno": "Não possui",
          };
          listaRequest.add(jsonEncode(_data));
          return listaRequest;
        }
      } else {
        var _data = {
          "requisicao_url": "$_url",
          "tipo_requisicao": "UPDATE(PUT) Com Parametros",
          "status_code": "Não possui",
          "conexao": "$_resultConexao",
          "mensagem": "2",
          "retorno": "Não possui",
        };

        listaRequest.add(jsonEncode(_data));
        // FALSE PARA QUANDO O USUARIO TEVE PROBLEMAS COM CONEXAO OU ALGO DEU ERRADO DURANTE A EXECUÇÃO DO COD
        return listaRequest;
      }
    } on Exception catch (e) {
      var _data = {
        "requisicao_url": "$_url",
        "tipo_requisicao": "UPDATE(PUT)",
        "status_code": "Não possui",
        "conexao": "$_resultConexao",
        "mensagem": "3",
        "retorno": "Não possui",
      };
      listaRequest.add(jsonEncode(_data));
      return listaRequest;
    }
  }

  Future<bool> resultConexao() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // nao tem conexao
      return false;
    } else {
      // tem conexao
      return true;
    }
  }
}
