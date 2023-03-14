import '../model/time.dart';
import '../repository/times_repostiory.dart';
class HomeController{

    TimesRepository? timesRepository;

    List<Time>get tabela=> timesRepository?.times;

    HomeController(){
    timesRepository = TimesRepository();

  }
}