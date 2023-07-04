import '../model/time.dart';
import '../repository/times_repostiory.dart';

class HomeController {
  late TimesRepository timesRepository;
  List<Time> tabela = [];

  HomeController() {
    timesRepository = TimesRepository();
  }

  Future<void> loadTimes() async {
    try {
      final List<Time> times = timesRepository.times;
      tabela = times;
    } catch (e) {
      //print('Erro ao carregar os times : $e');
    }
  }
}
