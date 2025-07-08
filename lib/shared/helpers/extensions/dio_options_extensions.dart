import 'package:dio/dio.dart';

extension DioOptionsUtils on Options {
  String getString() {
    StringBuffer stringBuffer = StringBuffer();

    // Agregar texto a StringBuffer
    stringBuffer.writeln("Options: ");
    stringBuffer.writeln("method= $method,");
    stringBuffer.writeln("sendTimeout= $sendTimeout,");
    stringBuffer.writeln("receiveTimeout= $receiveTimeout,");
    stringBuffer.writeln("extra= $extra,");
    stringBuffer.writeln("headers= $headers,");
    // stringBuffer.writeln("preserveHeaderCase= $preserveHeaderCase,");
    stringBuffer.writeln("responseType= $responseType,");
    stringBuffer.writeln("contentType= $contentType,");
    stringBuffer.writeln("validateStatus= $validateStatus,");
    stringBuffer
        .writeln("receiveDataWhenStatusError= $receiveDataWhenStatusError");
    stringBuffer.writeln("followRedirects= $followRedirects");
    stringBuffer.writeln("maxRedirects= $maxRedirects");
    stringBuffer.writeln("persistentConnection= $persistentConnection");
    stringBuffer.writeln("requestEncoder= $requestEncoder");
    stringBuffer.writeln("responseDecoder= $responseDecoder");
    stringBuffer.writeln("listFormat= $listFormat");

    // Imprimir la cadena resultante
    return stringBuffer.toString();
  }
}
