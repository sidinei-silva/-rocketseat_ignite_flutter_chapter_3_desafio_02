import 'package:split_it/shared/models/event_model.dart';

abstract class HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  List<EventModel> events;

  HomeStateSuccess({required this.events});
}

class HomeStateFailure extends HomeState {
  String message;

  HomeStateFailure({
    required this.message,
  });
}
