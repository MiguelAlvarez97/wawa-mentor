// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:wawamentor/data/data_provider/resource_data_provider.dart';
import 'package:wawamentor/models/resource_model.dart';

class ResourceRepository {
  ResourceDataProvider resourceDataProvider;
  ResourceRepository(
    this.resourceDataProvider,
  );

  Future<List<ResourceModel>> getResourceModelRepository(
      String idLesson, String api) async {
    try {
      final resources = await resourceDataProvider.getResources(idLesson, api);
      final List<dynamic> resourcesDecode = jsonDecode(resources);
      List<ResourceModel> resourcesList =
          resourcesDecode.map((e) => ResourceModel.fromMap(e)).toList();
      return resourcesList;
    } catch (e) {
      throw e.toString();
    }
  }
}
