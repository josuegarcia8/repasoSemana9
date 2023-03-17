import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PokemonApiCall {
  static Future<ApiCallResponse> call({
    String? pokemonName = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'pokemonApi',
      apiUrl: 'https://pokeapi.co/api/v2/pokemon/${pokemonName}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nombrePoke(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  static dynamic imagenPoke(dynamic response) => getJsonField(
        response,
        r'''$.sprites.front_default''',
      );
  static dynamic pesoPoke(dynamic response) => getJsonField(
        response,
        r'''$.weight''',
      );
}

class MarteDeMarteApiCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'marteDeMarteApi',
      apiUrl:
          'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=Pn3BkWbFvldaHlW7D2qzZYEye1tNLoYtWeN8KtcY',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic imagen(dynamic response) => getJsonField(
        response,
        r'''$.photos[:].img_src''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
