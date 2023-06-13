import '../model/time.dart';
import '../repository/times_repostiory.dart';

class HomeController {
  late TimesRepository timesRepository;
  List<Time> tabela = [];

  // List<Time> get tabela => timesRepository.times;

  HomeController() {
    timesRepository = TimesRepository();
  }

  Future<void> loadTimes() async {
    try {
      final List<Time> times = await timesRepository.times;
      tabela = times;
    } catch (e) {
      print('Erro ao carregar os times : $e');
    }
  }
}
