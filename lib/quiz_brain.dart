import 'package:day_5_starter/question.dart';
 class Quizbrain{
  int QuetionNumber  = 0;



  List <Question> quetions = [
    Question('The Mahabharata is a part of The Bhagavad Gita', false),
    Question('The National Security Guards are also known as Black Cat Commandos due to their uniforms.', true),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('The Census in India occur after every 8 years.', false),
    Question('The Indian Penal Code came into operation on 1st January, 1862', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'The Rajya Sabha can have a maximum of 552 members.',
        false),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Kuala Lumpur hosted the Commonwealth Game in 2010?', false),
    Question(
        '	\'Natya - Shastra\' the main source of India\'s classical dances was written by Bharat Muni',
        true),
    Question(
        'The words \'Satyameva Jayate\' inscribed below the base plate of the emblem of India are taken from Rigveda',
        false),
  ];
  Question getcurretquetion(){
    return quetions[QuetionNumber];
  }
  bool ChangeAnswer (bool UserAnswer) => UserAnswer == quetions[QuetionNumber].answer;
void nextquetion() => QuetionNumber++;
void reset() => QuetionNumber =0;
 }









