import 'package:trulserapp/model/question.dart';

class QuizBrain {
  int _currentQuestionIndex = 0;
  bool _isQuizFinish = false;
  List<Question> _questionBank = [
    Question(
        "20th-century Filipino electrician Agapito Flores invented the fluorescent lamp.",
        false),
    Question(
        "General MacArthur kept his promise and returned with a massive amphibious force on the island of Leyte in October of 1944.",
        true),
    Question(
        "Princess Urduja who ruled an island called Tawalisi in the 14th century is a Filipino Heroine.",
        false),
    Question("The yo-yo was invented by ancient Filipinos.", false),
    Question(
        "The Philippines were claimed in the name of Spain in 1521 by Ferdinand Magellan, a Portuguese explorer sailing for Spain.",
        true),
    Question("Fernando Poe Sr. served as the model for the Oblation.", false),
    Question(
        "The viral love letter “Liham Para Kay Oryang” was written by Andres Bonifacio.",
        false),
    Question(
        "Rizal proclaimed the Philippines \"the Pearl of the Oriental Seas\".",
        true),
    Question("Jose Rizal wrote “Sa Aking Mga Kabata” in his childhood.", false),
    Question(
        "Philippines had transformed from a Commonwealth to an independent republic in 1946.",
        true),
  ];

  void nextQuestion() {
    if (_currentQuestionIndex < _questionBank.length - 1) {
      _currentQuestionIndex++;
    } else {
      _isQuizFinish = true;
    }
  }

  String getQuestionText() {
    return _questionBank[_currentQuestionIndex].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_currentQuestionIndex].isCorrect;
  }

  int getQuizLength() {
    return _questionBank.length;
  }

  bool getIsQuizFinish() {
    return _isQuizFinish;
  }

  void resetQuiz() {
    _isQuizFinish = false;
    _currentQuestionIndex = 0;
  }
}
