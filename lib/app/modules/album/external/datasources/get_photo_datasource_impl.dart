import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/web_address.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasources/i_get_photo_datasource.dart';
import '../../infra/models/photo_model.dart';

class GetPhotoDatasourceImpl implements IGetPhotoDatasource {
  @override
  Future<List<PhotoModel>> getPhotos({required int albumId}) async {
    try {
      final response = await http.get(Uri.parse('${WebAddress.link}/albums/$albumId/photos'),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 10));

      return List<Map<String, dynamic>>.from(jsonDecode(response.body))
          .map((value) => PhotoModel.fromJson(value))
          .toList(growable: false);
    } catch (e) {
      throw PhotoExcpetion(e.toString());
    }
  }
}
