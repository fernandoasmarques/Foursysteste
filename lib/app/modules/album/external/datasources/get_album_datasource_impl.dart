import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/web_address.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasources/i_get_album_datasource.dart';
import '../../infra/models/album_model.dart';

class GetAlbumDatasourceImpl implements IGetAlbumDatasource {
  @override
  Future<List<AlbumModel>> getAlbuns() async {
    try {
      final response = await http.get(Uri.parse('${WebAddress.link}/albums'),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 10));

      return List<Map<String, dynamic>>.from(jsonDecode(response.body))
          .map((value) => AlbumModel.fromJson(value))
          .toList(growable: false);
    } catch (e) {
      throw AlbumExcpetion(e.toString());
    }
  }
}
