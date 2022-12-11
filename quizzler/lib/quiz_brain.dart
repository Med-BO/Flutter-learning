import 'question.dart';

class QuizBrain {
  int _currentQuestionIndex = 0;

  final List<Question> _questionsAndAnswers = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'YA slug\'s blood is green.', a: true)
  ];

  int moveToNextQuestion() {
    if (_currentQuestionIndex < _questionsAndAnswers.length - 1) {
      _currentQuestionIndex++;
      return 0;
    }
    return 1;
  }

  String getQuestionText() {
    return _questionsAndAnswers[_currentQuestionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionsAndAnswers[_currentQuestionIndex].questionAnswer;
  }

  void reset() {
    _currentQuestionIndex = 0;
  }
}
