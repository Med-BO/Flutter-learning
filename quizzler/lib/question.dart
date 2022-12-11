class Question {
  String questionText = '';
  bool questionAnswer = true;

  Question({String q = '', bool a = true}) {
    questionText = q;
    questionAnswer = a;
  }

  Question.withoutNames(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
}
