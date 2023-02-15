import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nav_bar_task/model.dart';

class quizPage extends StatelessWidget {
  const quizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("quiz"),
      ),
      body: QuestionWidget(),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int _questionNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 30),
          Text("Question $_questionNumber/${questions.length}"),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Expanded(
              child: PageView.builder(
            itemCount: questions.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final _question = questions[index];
              return buildQuestion(_question);
            },
          )),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        Text(
          question.text,
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
            child: OptionsWidget(
          question: question,
          onClickedOption: (option) {
            if (question.isLocked) {
              return;
            } else {
              setState(() {
                question.isLocked = true;
                question.selectedOption = option;
              });
            }
          },
        ))
      ],
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Options> onClickedOption;
  const OptionsWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.options
            .map((option) => buildOption(context, option))
            .toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, Options option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () {
        onClickedOption(option);
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.text,
              style: TextStyle(fontSize: 20),
            ),
            getIconForOption(option, question),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Options option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      return option.isCorrect ? Colors.green : Colors.red;
    } else if (option.isCorrect) {
      return Colors.green;
    }
    return Colors.grey;
  }

  Widget getIconForOption(Options option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.cancel,
                color: Colors.red,
              );
      } else if (option.isCorrect) {
        return Icon(
          Icons.check_circle,
          color: Colors.green,
        );
      }
    }
    return SizedBox.shrink();
  }
}
