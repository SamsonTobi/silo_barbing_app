import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:silo_barbing_app/features/haircut_list/bloc/haircuts_bloc.dart';
import 'package:silo_barbing_app/features/haircut_list/models/haircut_data_ui_model.dart';
import 'package:http/http.dart' as http;
import '../../../api_config.dart';

class HaircutsRepo {
  static Future<List<Haircut>> fetchHaircuts() async {
    const haircutsEndpoint = "/products";
    const haircutsApiUrl =
        "$baseUrl$haircutsEndpoint?organization_id=$orgID&Appid=$apiID&Apikey=$apiKey";

    var client = http.Client();
    List<Haircut> haircuts = [];

    try {
      var response = await client.get(Uri.parse(haircutsApiUrl));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        HaircutDataUiModel haircutData = HaircutDataUiModel.fromJson(jsonData);
        haircuts = haircutData.items;

        return haircuts;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Failed to fetch data: $e');
      throw Exception('Failed to fetch data: $e');
    } finally {
      client.close();
    }
  }
}
