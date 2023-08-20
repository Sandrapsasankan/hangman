import 'package:flutter/material.dart';
class Hangman extends StatefulWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  bool isHeadvisible=false;
  bool isBodyvisible=false;
  bool isLHvisible=false;
  bool isLLvisible=false;
  bool isRHvisible=false;
  bool isRLvisible=false;

  bool fVisible=false;
  bool lVisible=false;
  bool uVisible=false;
  bool tVisible=false;
  bool eVisible=false;
  bool rVisible=false;

  int trueCount=0;
  int falseCount=0;

  void displayText(String text){
    setState(() {

      if(trueCount==5){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Game Over"),
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.black
              ),
              content: Text("You Win the Game"),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Ok",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                )],
            );
          },
        );
        reset();
      }
      else if(falseCount==6){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Game Over"),
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.black
              ),
              content: Text("You Fail the Game"),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Ok",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                )],
            );
          },
        );
        reset();
      }
      else{
        if(text=='F'){
          trueCount++;
          fVisible=true;
        }
        else if(text=='L'){
          trueCount++;
          lVisible=true;
        }
        else if(text=='U'){
          trueCount++;
          uVisible=true;
        }
        else if(text=='T'){
          trueCount++;
          tVisible=true;
        }
        else if(text=='E'){
          trueCount++;
          eVisible=true;
        }
        else if(text=='R'){
          trueCount++;
          rVisible=true;
        }
        else{
          if(text=='A'||text=='B'||text=='C'||text=='D'||text=='G'||text=='H'||
              text=='I'||text=='J'||text=='K'||text=='M'||text=='N'||text=='O'||
              text=='P'||text=='Q'||text=='S'||text=='V'||text=='W'||text=='X'||text=='Y'||text=='Z'){
            falseCount++;
            if(isHeadvisible==false){
              isHeadvisible=true;
            }
            else if(isBodyvisible==false){
              isBodyvisible=true;
            }
            else if(isLHvisible==false){
              isLHvisible=true;
            }
            else if(isRHvisible==false){
              isRHvisible=true;
            }
            else if(isLLvisible==false){
              isLLvisible=true;
            }
            else if(isRLvisible==false){
              isRLvisible=true;
            }
          }
        }
      }

    });
  }

  void reset(){
    isHeadvisible=false;
    isBodyvisible=false;
    isLHvisible=false;
    isLLvisible=false;
    isRHvisible=false;
    isRLvisible=false;

    fVisible=false;
    lVisible=false;
    uVisible=false;
    tVisible=false;
    eVisible=false;
    rVisible=false;

    trueCount=0;
    falseCount=0;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
         color: Colors.yellow,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Stack(
                      children:[
                        Image.asset('images/hang.png',height: 290,),
                        Visibility(
                            visible: isHeadvisible,
                            child: Image.asset('images/head.png',height: 300,)
                        ),
                        Visibility(
                            visible: isBodyvisible,
                            child: Image.asset('images/body.png',height: 300,)
                        ),
                        Visibility(
                            visible: isLHvisible,
                            child: Image.asset('images/RH.png',height: 300,)
                        ),
                        Visibility(
                            visible: isRHvisible,
                            child: Image.asset('images/LH.png',height: 300,)
                        ),
                        Visibility(
                            visible: isLLvisible,
                            child: Image.asset('images/LL.png',height: 300,)
                        ),
                        Visibility(
                            visible: isRLvisible,
                            child: Image.asset('images/RL.png',height: 300,)
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      firstContainer('F',Colors.white,fVisible),
                      firstContainer('L',Colors.white,fVisible),
                      firstContainer('U',Colors.white,fVisible),
                      firstContainer('T',Colors.white,fVisible),
                      firstContainer('T',Colors.white,fVisible),
                      firstContainer('E',Colors.white,fVisible),
                      firstContainer('R',Colors.white,fVisible),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 28,right: 28),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          secondContainer('A',Colors.white),
                          secondContainer('B',Colors.white),
                          secondContainer('C',Colors.white),
                          secondContainer('D',Colors.white),
                          secondContainer('E',Colors.white),
                          secondContainer('F',Colors.white),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          secondContainer('G',Colors.white),
                          secondContainer('H',Colors.white),
                          secondContainer('I',Colors.white),
                          secondContainer('J',Colors.white),
                          secondContainer('K',Colors.white),
                          secondContainer('L',Colors.white),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          secondContainer('M',Colors.white),
                          secondContainer('N',Colors.white),
                          secondContainer('O',Colors.white),
                          secondContainer('P',Colors.white),
                          secondContainer('Q',Colors.white),
                          secondContainer('R',Colors.white),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          secondContainer('S',Colors.white),
                          secondContainer('T',Colors.white),
                          secondContainer('U',Colors.white),
                          secondContainer('V',Colors.white),
                          secondContainer('W',Colors.white),
                          secondContainer('X',Colors.white),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          secondContainer('Y',Colors.white),
                          SizedBox(width: 5,),
                          secondContainer('Z',Colors.white),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container secondContainer(String text,Color clr) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
color: Colors.white,
          borderRadius: BorderRadius.circular(100)

      ),
      child: Center(
        child: TextButton(
          onPressed: (){
            displayText(text);
          },
          child: Text(text,style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 27,
              color: Colors.yellow
          ),),
        ),
      ),
    );
  }

  Container firstContainer(String text,Color clr,bool visibility) {
    return Container(
      width: 43,
      height: 53,
      decoration: BoxDecoration(
color: Colors.white,
          borderRadius: BorderRadius.circular(100)

      ),
      child: Center(
        child: Visibility(
          visible: visibility,
          child: Text(text,style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 27,
              color: Colors.yellow
          ),),
        ),
      ),
    );
  }
}
