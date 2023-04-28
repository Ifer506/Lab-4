import 'package:flutter/material.dart';

import 'model.dart';


class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int correct = 0;
  int incorrect = 0;

  int number1 = 2;
  int number2 = 0;
  int count = 0;

  

  void restart(){
    correct = 0;
    incorrect = 0;
    count = 0;

    return;
  }

  late GenerateRandomNumber number ;

  void generater(){
    number = GenerateRandomNumber();
    setState(() {
      number1 = number.RandomNumberGenerator(number1, number2)[1];
      number2 = number.RandomNumberGenerator(number1, number2)[0];

    });
  }

  void remarks(number1,number2){
    if ((correct+incorrect)>= 10 ){
      restart();
    }else{
      if(number1>number2){
        correct++;
      }else{
        incorrect++;
      }
      generater();
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab-4"),
        centerTitle: true,
        elevation: 0,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Spacer(),
            const SizedBox(height: 70),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  remarks(number1, number2);
                  generater();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 160),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5),
                  )
                ), child: RichText(text: ( TextSpan(
                  
                  text: '$number1',
                  style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)
            
                ),
                )))
                ),
                
                ElevatedButton(onPressed: (){
                  remarks(number2, number1);
                }, 
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 160),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                  
                ),child: RichText(text: ( TextSpan(
                  
                  text: '$number2',
                  style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 234, 227, 227)
            
                ),
                ))),
                )
              ],
            ),
            const SizedBox(height: 50),
            RichText(text: const TextSpan(
               text: 'Results ',
                  style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 0, 0, 0)
            ),),),
            const SizedBox(height: 20),
            RichText(text: TextSpan(
              text: 'Incorrect answer: $incorrect',
                  style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 188, 0, 0)
            ),),),
            const SizedBox(height: 20),

            RichText(text: TextSpan(
               text: 'Correct answer: $correct',
                  style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 24, 137, 1)
            ),),),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              restart();
            },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5),
                  )
                ), child: RichText(text: (const TextSpan(
                  
                  text: 'Restart',
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 15, 13, 13)
            
                ),
                )))
                ),

          ],
        ),
      ),
    );
  }
}