

import 'package:movies_app/data/model/searchReponse.dart';

abstract class Searchstates {}

class SearchInitState extends Searchstates {}

class SearchLoadingState extends Searchstates {}



class SearchSuccessState extends Searchstates {
  SearchResponse response;
  SearchSuccessState({required this.response});
}

class SearchErrorState extends Searchstates {
  final String errorMessage;
  SearchErrorState({required this.errorMessage});
}