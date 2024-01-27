class QuizQuestions {
  const QuizQuestions(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answer);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
