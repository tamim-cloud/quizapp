// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizModel {
  final String question;
  final List<String> listOption;

  QuizModel({
    required this.question,
    required this.listOption,
  });

  get suffeldFunction {
    final suffeldOption = List.of(listOption);
    suffeldOption.shuffle();
    return suffeldOption;
  }
}
