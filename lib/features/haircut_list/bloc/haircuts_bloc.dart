import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:silo_barbing_app/features/haircut_list/models/haircut_data_ui_model.dart';
import 'package:silo_barbing_app/features/haircut_list/repos/haircuts_repo.dart';

part 'haircuts_event.dart';
part 'haircuts_state.dart';

class HaircutsBloc extends Bloc<HaircutsEvent, HaircutsState> {
  HaircutsBloc() : super(HaircutsInitial()) {
    on<HaircutsInitialFetchEvent>(haircutsInitialFetchEvent);
  }
  FutureOr<void> haircutsInitialFetchEvent(
      HaircutsInitialFetchEvent event, Emitter<HaircutsState> emit) async {
    debugPrint('Data feteching loading');
    emit(HaircutsFetchingLoadingState());

    try {
      List<Haircut> haircuts = await HaircutsRepo.fetchHaircuts();

      // await Future.delayed(const Duration(seconds: 1));
      emit(HaircutsFetchedState(haircuts: haircuts));
    } catch (e) {
      debugPrint('Data feteching error');
      emit(HaircutsFetchingErrorState(error: e.toString()));
    }
  }
}
