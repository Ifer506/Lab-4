import 'dart:math';

class GenerateRandomNumber{
  List <int> RandomNumberGenerator(int number1,int number2) {
    
    var random = Random();

    number1 = random.nextInt(50) + 1;
    number2 = random.nextInt(50) + 1;

    return [number1,number2];

  }
    
}