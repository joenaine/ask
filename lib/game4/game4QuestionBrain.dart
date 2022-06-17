import 'game4question.dart';

int length = QuestionsBrain()._questions.length;

class QuestionsBrain {
  final _questions = [
    Game4Question('Инженер-технолог', 'Инженер-конструктор'),
    Game4Question('Вязальщик', 'Санитарный врач'),
    Game4Question('Повар', 'Наборщик'),
    Game4Question('Фотограф', 'Управляющий магазина'),
    Game4Question('Чертежник', 'Дизайнер'),
    Game4Question('инженер-техник', 'инженер-контролер'),
    Game4Question('вязальщик', 'санитарный врач'),
    Game4Question('повар', 'наборщик'),
    Game4Question('фотограф', 'зав. магазином'),
    Game4Question('чертежник', 'дизайнер'),
    Game4Question('философ', 'психиатр'),
    Game4Question('ученый-химик' ,'бухгалтер'),
    Game4Question('редактор научного журнала', 'адвокат'),
    Game4Question('лингвист	переводчик', 'художественной литературы'),
    Game4Question('педиатр', 'статистик'),
    Game4Question('организатор воспитательной работы', 'председатель профсоюза'),
    Game4Question('спортивный врач', 'фельетонист'),
    Game4Question('нотариус', 'снабженец'),
    Game4Question('перфоратор', 'карикатурист'),
    Game4Question('политический деятель', 'писатель'),
    Game4Question('садовник', 'метеоролог'),
    Game4Question('водитель', 'медсестра'),
    Game4Question('инженер-электрик', 'секретарь-машинистка'),
    Game4Question('маляр', 'художник по металлу'),
    Game4Question('биолог', 'главный врач'),
    Game4Question('телеоператор', 'режиссер'),
    Game4Question('гидролог', 'ревизор'),
    Game4Question('зоолог', 'зоотехник'),
    Game4Question('математик', 'архитектор'),
    Game4Question('работник ИДН', 'счетовод'),
    Game4Question('учитель', 'милиционер'),
    Game4Question('воспитатель', 'художник по керамике'),
    Game4Question('экономист', 'заведующий отделом'),
    Game4Question('корректор', 'критик'),
    Game4Question('завхоз', 'директор'),
    Game4Question('радиоинженер', 'специалист по ядерной физике'),
    Game4Question('водопроводчик', 'наборщик'),
    Game4Question('агроном', 'председатель сельхозкооператива'),
    Game4Question('закройщик-модельер', 'декоратор'),
    Game4Question('археолог', 'эксперт'),
    Game4Question('работник музея', 'консультант'),
    Game4Question('ученый', 'актер'),
    Game4Question('логопед', 'стенографист'),
    Game4Question('врач', 'дипломат'),
    Game4Question('главный бухгалтер', 'директор'),
    Game4Question('поэт', 'психолог'),
    Game4Question('архивариус', 'скульптор'),
  ];
  int get indexOfQuest => _indexQuestionShowed;
  var _indexQuestionShowed = 0;
  var _endListReached = false;

  String getQuestionVariant1() {
    return _questions[_indexQuestionShowed].variant1;
  }

  String getAnswerOfVariant2() {
    return _questions[_indexQuestionShowed].variant2;
  }

  void showNextQuestion() {
    if (_indexQuestionShowed < _questions.length - 1) {
      _indexQuestionShowed++;
      _endListReached = false;
    } else {
      _indexQuestionShowed = 0;
      _endListReached = true;
    }
  }

  bool checkEndOfList() {
    return _endListReached;
  }
}
