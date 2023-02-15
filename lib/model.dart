class Question {
  final String text;
  final List<Options> options;
  bool isLocked;
  Options? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Options {
  final String text;
  final bool isCorrect;

  const Options({
    required this.text,
    required this.isCorrect,
  });
}

final questions = [
  Question(
    text: "2 + 2 =",
    options: [
      Options(text: "1", isCorrect: false),
      Options(text: "2", isCorrect: false),
      Options(text: "3", isCorrect: false),
      Options(text: "4", isCorrect: true),
    ],
  ),
  /*Question(
    text: "3 + 3 =",
    options: [
      Options(text: "1", isCorrect: false),
      Options(text: "2", isCorrect: false),
      Options(text: "3", isCorrect: false),
      Options(text: "6", isCorrect: true),
    ],
  )*/
];
