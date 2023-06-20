import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:components_ui/components_ui.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../err/errors.dart';
import 'i_http_interface.dart';

class PutHttpRequestApp implements IHttpInterfacePostPut {
  BuildContext context;

  PutHttpRequestApp(this.context);
  @override
  Future<Either<HttpRequestFailure, Map<String, dynamic>>> makeJsonRequest({
    required String url,
    params,
  }) async {
    try {
      if (!await resultConexao()) {
        final response = await http.put(Uri.parse("/$url"),
            // headers: {
            //   "Content-Type": "application/json",
            //   "Authorization": "token ${globalInfo.tokenId}"
            // },
            body: params);
        final int code = response.statusCode;
        final String description = jsonDecode(response.body)["message"];
        if (code > 300) {
          throw HttpRequestFailure(code: code, descricao: description);
        }
        return right((response.body as Map<String, dynamic>));
      } else {
        return left(NetworkFailed(
            code: 404,
            descricao:
                "Sem conexão com a internet. Verifique sua coneão e tente novamente!"));
      }
    } on HttpRequestFailure catch (_err) {
      log("response ${_err.code}");
      log("response ${_err.descricao}");
      final int? code = _err.code;

      if (_err.code! >= 300 && _err.code! < 400) {
        // caso seja redirecionamento
        return left(RedirectionHttpFailure(
            code: code,
            descricao:
                "Redirecionamento de página. A pagina atual será atualizada para fins de atualização do sistema"));
      } else if (_err.code! >= 400 && _err.code! < 500) {
        // Respostas de erro do cliente
        return left(ClientErrorFailure(
            code: code,
            descricao: code == 400
                ? "O servidor se encontra for do ar no momento. Aguarde e tente novamente mais tarde"
                : code == 404
                    ? "Sistema indisponivel link de acesso negado!"
                    : " Sistema indisponivel no momento. Tente novamenete mais tarde"));
      } else if (_err.code! >= 500) {
        // caso seja redirecionamento
        return left(ServerErrorFailure(
            code: code,
            descricao:
                " Sistema indisponivel no momento. Tente novamenete mais tarde"));
      } else {
        return left(UnknowErrorFailure(
          code: code,
          descricao:
              "Sistema indisponivel no momento. Por favor, contacte o suporte",
        ));
      }
    } on HttpException catch (_err) {
      return left(HttpError(code: _err.uri.hashCode, descricao: _err.message));
    } catch (e) {
      final String erro = e.toString();
      return left(UnknowErrorFailure(code: 000, descricao: erro));
    }
  }

  @override
  Future<Either<HttpRequestFailure, dynamic>> makeJsonRequestDynamic({
    required String url,
    params,
  }) async {
    try {
      if (!await resultConexao()) {
        final response = await http.put(Uri.parse("/$url"),
            headers: {
              // "Content-Type": "application/json",
            },
            body: params);
        final int code = response.statusCode;
        final String description = jsonDecode(response.body)["message"];
        if (code > 300) {
          throw HttpRequestFailure(code: code, descricao: description);
        }
        return right((response.body as Map<String, dynamic>));
      } else {
        return left(NetworkFailed(
            code: 404,
            descricao:
                "Sem conexão com a internet. Verifique sua coneão e tente novamente!"));
      }
    } on HttpRequestFailure catch (_err) {
      log("response ${_err.code}");
      log("response ${_err.descricao}");
      final int? code = _err.code;

      if (_err.code! >= 300 && _err.code! < 400) {
        // caso seja redirecionamento
        return left(RedirectionHttpFailure(
            code: code,
            descricao:
                "Redirecionamento de página. A pagina atual será atualizada para fins de atualização do sistema"));
      } else if (_err.code! >= 400 && _err.code! < 500) {
        // Respostas de erro do cliente
        return left(ClientErrorFailure(
            code: code,
            descricao: code == 400
                ? "O servidor se encontra for do ar no momento. Aguarde e tente novamente mais tarde"
                : code == 404
                    ? "Sistema indisponivel link de acesso negado!"
                    : " Sistema indisponivel no momento. Tente novamenete mais tarde"));
      } else if (_err.code! >= 500) {
        // caso seja redirecionamento
        return left(ServerErrorFailure(
            code: code,
            descricao:
                " Sistema indisponivel no momento. Tente novamenete mais tarde"));
      } else {
        return left(UnknowErrorFailure(
          code: code,
          descricao:
              "Sistema indisponivel no momento. Por favor, contacte o suporte",
        ));
      }
    } on HttpException catch (_err) {
      return left(HttpError(code: _err.uri.hashCode, descricao: _err.message));
    } catch (e) {
      final String erro = e.toString();
      return left(UnknowErrorFailure(code: 000, descricao: erro));
    }
  }
}
