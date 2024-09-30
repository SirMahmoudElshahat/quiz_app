import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  List<Map<String, Object>> get getSummeryData {
    final List<Map<String, Object>> summery = [];
    for (int i = 0; i < questions.length; i++) {
      summery.add({
        "question_index": i + 1,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i]
      });
    }
    return summery;
  }

  int get counterCorrectAnswers {
    int numOfCorrectAnswer = 0;
    for (int i = 0; i < questions.length; i++) {
      if (getSummeryData[i]["correct_answer"] ==
          getSummeryData[i]["user_answer"]) {
        numOfCorrectAnswer++;
      }
    }
    return numOfCorrectAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.purpleAccent])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $counterCorrectAnswers of ${questions.length} Questions correctly !",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white.withOpacity(0.65),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 250,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...getSummeryData.map((e) => Column(
                          children: [
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      e["correct_answer"] == e["user_answer"]
                                          ? Colors.green
                                          : Colors.red,
                                  radius: 15,
                                  child: Text(
                                    e["question_index"].toString(),
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white.withOpacity(0.65),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e["question"].toString(),
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.white.withOpacity(0.65),
                                        ),
                                      ),
                                      Text(
                                        e["user_answer"].toString(),
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                                  195, 255, 255, 255)
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                      Text(
                                        e["correct_answer"].toString(),
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                                  255, 1, 213, 255)
                                              .withOpacity(0.65),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  selectedAnswers.clear();
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white.withOpacity(0.65),
                ),
                icon: const Icon(Icons.restart_alt),
                label: const Text(
                  "Restart Quiz",
                ))
          ],
        ),
      ),
    );
  }
}
