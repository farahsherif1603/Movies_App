

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api_manager.dart';
import 'package:movies_app/data/model/searchReponse.dart';
import 'package:movies_app/searchScreen/searchStates.dart';



class SearchCubit extends Cubit<Searchstates> {
  SearchCubit() : super(SearchInitState());

  List<SearchResults> searchResults = [];


  void searchMovie({required String query}) async {
    try {
      emit(SearchLoadingState());

      var response = await ApiManager.searchMovies(query);
      searchResults = response.results ?? [];

      emit(SearchSuccessState(response: response));
      print('Success: ${searchResults[0].title}');
    } catch (e) {
      emit(SearchErrorState(errorMessage: e.toString()));
      throw(e);
    }
  }
}