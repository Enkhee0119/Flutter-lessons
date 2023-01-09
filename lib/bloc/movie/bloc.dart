import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/events.dart';
import 'package:movie_app/bloc/movie/states.dart';

import '../../services/api/index.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieTest>((event, emit) async {
      emit(MovieLoading());
      try {
        final api = ApiService();
        final data = await api.getRequest("/packages/dio", true);
        print(data.data);
        emit(MovieSuccess([]));
      } catch (ex) {
        print(ex);
        emit(MovieFailure(ex.toString()));
      }
    });
  }
}
