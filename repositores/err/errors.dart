// ignore_for_file: public_member_api_docs, sort_constructors_first

//Interface
import 'dart:io';

class HttpRequestFailure implements Exception {
  final int? code;
  final String? descricao;
  HttpRequestFailure({
    this.code,
    this.descricao,
  });
}

// Informational Responses (100 - 199)
class InformationalHttpFailure implements HttpRequestFailure {
  @override
  final int? code;
  @override
  final String? descricao;
  InformationalHttpFailure({
    this.code,
    this.descricao,
  });
}

//Redirection messages (300 – 399)
class RedirectionHttpFailure implements HttpRequestFailure {
  @override
  final int? code;
  @override
  final String? descricao;
  RedirectionHttpFailure({
    this.code,
    this.descricao,
  });
}

//Client error responses (400 – 499)
class ClientErrorFailure implements HttpRequestFailure {
  @override
  final int? code;
  @override
  final String? descricao;
  ClientErrorFailure({
    this.code,
    this.descricao,
  });
}

// Server error responses (500 – 599)
class ServerErrorFailure implements HttpRequestFailure {
  @override
  final int? code;
  @override
  final String? descricao;
  ServerErrorFailure({
    this.code,
    this.descricao,
  });
}

// Error desconhecido
class UnknowErrorFailure implements HttpRequestFailure {
  @override
  final int? code;
  @override
  final String? descricao;
  UnknowErrorFailure({
    this.code,
    this.descricao,
  });
}

// Error desconhecido
class HttpError implements HttpRequestFailure {
  @override
  final int? code;
  @override
  final String? descricao;
  HttpError({
    this.code,
    this.descricao,
  });
}

// Erro sem internet
class NetworkFailed implements HttpRequestFailure {
  @override
  final int? code;
  @override
  final String? descricao;
  NetworkFailed({
    this.code,
    this.descricao,
  });
}
