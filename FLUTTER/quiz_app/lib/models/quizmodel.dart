class QuizQuestions {
  const QuizQuestions(this.questions,this.answers);
  final String questions;
  final List<String> answers;

  get text => null;

  List<String> shuffledAnswers(){
    final shuffledlist =  List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
}
}

