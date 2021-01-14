import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  // list of questions

  List questionBank = [

    Question.name("1. 30 states & 9 union territories are there in India.", false, "29 states & 7 union territories are there in India."),
    Question.name("2. Approximately, the area of India, in square kilometres is 3000000.", true, ""),
    Question.name("3. The constitution of India was adopted by the Constituent Assembly.", true, ""),
    Question.name("4. Dr. Rajendra Prasad was the president of the Constituent Assembly.", true, ""),
    Question.name("5. Lakshadweep, and Puducherry are the two island territories of India.", false, "Lakshadweep, and Andaman & Nicobar are the two island territories of India."),
    Question.name("6. The Constituent Assembly for undivided India first met on 9th December, 1947.", false, "The Constituent Assembly for undivided India first met on 9th December, 1946."),
    Question.name("7. Ayurveda, an ancient Indian medical science is famous as a holistic approach to healing and prescribes the use of natural herbs for prevention and/or cure of physical or mental diseases.", true,""),
    Question.name("8. Lal Bahadur Shastri was the first Foreign Minister of free India.", false, "Pandit Jawaharlal Nehru was the first Foreign Minister of free India."),
    Question.name("9. The wettest place on earth lies in the state of Meghalaya.", true, ""),
    Question.name("10. The idea of the constitution of India was first of all given by MN Roy.", true, ""),
    Question.name("11. Historical places like Kurukshetra, Panipat, Hisar, Rohtak, and Ambala are some of the towns in Uttar Pradesh.", false, "Historical places like Kurukshetra, Panipat, Hisar, Rohtak, and Ambala are some of the towns in Haryana."),
    Question.name("12. The design of the national flag was adopted by the constituent assembly of India in July, 1947.", true, ""),
    Question.name("13. The largest desert in India is Sahara Desert.", false, "The largest desert in India is Thar Desert."),
    Question.name("14. Darjeeling is One of the popular hill stations of India, famous for its tea plantations.", true, ""),
    Question.name("15. Siachen of India has the highest battlefield on Earth.", true, ""),
    Question.name("16. Dr. BR Ambedkar was the chairman of the drafting committee of the Indian Constitution.", true, ""),
    Question.name("17. Tamil Nadu was the first Indian state created on the basis of regional language.", false, "Andhra Pradesh was the first Indian state created on the basis of regional language."),
    Question.name("18. Mulligatwany is a famous Soup from India.", true, ""),
    Question.name("19. The Government of India Act 1935 vested the residuary power in the Government General.", true, ""),
    Question.name("20. Chandigarh is a Union Territory.", true, ""),
    Question.name("21. India become a Sovereign democratic republic on Aug 15, 1947.", false, "India become a Sovereign democratic republic on Jan 26, 1950."),
    Question.name("22. India has never hosted the Olympic games.", true, ""),
    Question.name("23. Yoga, the popular form of exercise originates in India and is practiced worldwide.", true, ""),
    Question.name("24. In Indian History, Portuguese merchants first came to Maharashtra.", false, "In Indian History, Portuguese merchants first came to Goa."),
    Question.name("25. Himalayas are the oldest mountain ranges in India.", false, "Aravallis are the oldest mountain ranges in India."),
    Question.name("26. The Council of States in India is generally known as Raj Sabha.", true, ""),
    Question.name("27. Jawaharlal Nehru was the founder of newspaper 'National Herald'.", true, ""),
    Question.name("28. Kerala is the state without Panchayati Raj system.", false, "Nagaland is the state without Panchayati Raj system."),
    Question.name("29. Samadhi Sthal of KR Narayanan is 'Karmabhoomi'.", true, ""),
    Question.name("30. Emperor Ashoka was known 'Constantine of Buddhism'.", true, ""),

  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("TRUE CITIZEN",
          style: TextStyle(
            color: Colors.cyanAccent[100],
            fontSize: 30,
            fontFamily: "Redressed",
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
        ),
        centerTitle: true,
        // backgroundColor: Colors.grey.shade800,
      ),
      // backgroundColor: Colors.grey.shade800,

      // we use [Builder] here to use a [context] which is a descendent of [Scaffold]
      // or else [Scaffold.of] will returna null

      body: Builder(
        builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // indian flag image

                Center(
                    child: Image.asset(
                  "images/flag.png",
                  width: 250,
                  height: 180,
                )),

                Text("Test Your Knowledge !",
                  // style: TextStyle(
                  //   color: Colors.white,
                  //   fontSize: 20,
                  // ),
                ),

                // displaying the questions

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 150.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54, width: 1.5, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(questionBank[_currentQuestionIndex].questionText,
                           // style: TextStyle(color: Colors.white, fontSize: 16.0)
                        ),
                      ),
                    ),
                  ),
                ),

                // buttons

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(onPressed: () => _checkAnswer(true, context),
                      // color: Colors.black54,
                      child: Text("TRUE"),
                      // textColor: Colors.white,
                    ),
                    RaisedButton(onPressed: () => _checkAnswer(false, context),
                      // color: Colors.black54,
                      child: Text("FALSE"),
                      // textColor: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(onPressed: () => _prevQuestion(),
                      // color: Colors.black54,
                      child: Icon(Icons.arrow_back),
                      // textColor: Colors.white,
                    ),
                    RaisedButton(onPressed: () => _nextQuestion(),
                      // color: Colors.black54,
                      child: Icon(Icons.arrow_forward),
                      // textColor: Colors.white,
                    ),
                  ],
                ),

                Spacer(),


              ],
        )),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect)
      {
        // correct answer
        if(userChoice == true)
          {
            final snackbar = SnackBar(
                duration: Duration(seconds: 2),
                backgroundColor: Colors.green,
                content: Text("You Are Right ! \nAnswer : TRUE", style: TextStyle(fontSize: 15),),
                );
            Scaffold.of(context).showSnackBar(snackbar);
          }
        else
          {
            final snackbar = SnackBar(
                duration: Duration(seconds: 5),
                backgroundColor: Colors.green,
                content: Text("You Are Right ! \nAnswer : FALSE"
                    "\nCorrect Statement : ${questionBank[_currentQuestionIndex].correctStatment}",
                    style: TextStyle(fontSize: 15),
                ));
            Scaffold.of(context).showSnackBar(snackbar);
          }
      }
    else
      {
        // wrong answer
        if(userChoice == true)
        {
          final snackbar = SnackBar(
              duration: Duration(seconds: 5),
              backgroundColor: Colors.red,
              content: Text("You Are Wrong !"
                  "\nCorrect Answer : FALSE"
                  "\nCorrect Statement : ${questionBank[_currentQuestionIndex].correctStatment}",
                style: TextStyle(fontSize: 15),
              ));
          Scaffold.of(context).showSnackBar(snackbar);
        }
        else
        {
          final snackbar = SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text("You Are Wrong !\nCorrect Answer : TRUE", style: TextStyle(fontSize: 15),),
          );
          Scaffold.of(context).showSnackBar(snackbar);

        }
      }
  }
  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
  
}
