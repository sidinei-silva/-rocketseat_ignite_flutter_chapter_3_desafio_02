import 'package:split_it/pages/home/models/dashboard_model.dart';
import 'package:split_it/pages/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<DashboardModel> getDashboard() async {
    await Future.delayed(
      Duration(seconds: 2),
    );

    return DashboardModel(receivable: 124, payable: 58);
  }

  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(
      Duration(seconds: 2),
    );

    return [
      EventModel(
        title: 'Churrasco',
        date: DateTime.now(),
        people: 5,
        money: 32.0,
      ),
      EventModel(
        title: 'Aniversario',
        date: DateTime.now(),
        people: 10,
        money: -11.0,
      ),
      EventModel(
        title: 'Festa',
        date: DateTime.now(),
        people: 0,
        money: -20.0,
      ),
      EventModel(
        title: 'Fogueira',
        date: DateTime.now(),
        people: 11,
        money: 10.0,
      ),
      EventModel(
        title: 'Natal',
        date: DateTime.now(),
        people: 5,
        money: 15.0,
      ),
      EventModel(
        title: 'Arraia',
        date: DateTime.now(),
        people: 5,
        money: 25.0,
      ),
    ];
  }
}
