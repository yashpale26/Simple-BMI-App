import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple BMI App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(title: 'Simple BMI App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,
            style: TextStyle(fontSize: 50, fontFamily: 'FontLobsterTwo')),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: bgColor,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: ' BMI stands for', style: TextStyle(color: Colors.grey.shade700, fontSize: 20, fontFamily: 'FontLobsterTwo', fontWeight: FontWeight.bold),),
                      TextSpan(text: ' Body Mass Index', style: TextStyle(color: Colors.red.shade700, fontSize: 30, fontFamily: 'FontLobsterTwo', fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text('Enter your Measurements: ', style: TextStyle(fontSize: 30, fontFamily: 'FontLobsterTwo', fontWeight: FontWeight.bold, color: Colors.red.shade500)),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                    child: Text('Weight:', style: TextStyle(fontSize: 25, fontFamily: 'FontLobsterTwo', fontWeight: FontWeight.bold),)),
                                Expanded(
                                  flex: 3,
                                  child: TextField(
                                    controller: wtController,
                                    decoration: InputDecoration(
                                      label: Text('Enter your Weight (kgs)'),
                                      prefixIcon: Icon(Icons.monitor_weight, color: Colors.orange.shade900,)
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                  child: Text('Feet:', style: TextStyle(fontSize: 25, fontFamily: 'FontLobsterTwo', fontWeight: FontWeight.bold),)),
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  controller: ftController,
                                  decoration: InputDecoration(
                                    label: Text('Enter your Height (Feet)'),
                                    prefixIcon: Icon(Icons.height_outlined, color: Colors.orange.shade900,)
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text('Inch:', style: TextStyle(fontSize: 25, fontFamily: 'FontLobsterTwo', fontWeight: FontWeight.bold),)),
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  controller: inController,
                                  decoration: InputDecoration(
                                    label: Text('Enter your Height (Inches)'),
                                    prefixIcon: Icon(Icons.line_weight, color: Colors.orange.shade900,),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();
          
                        if(wt != "" && ft != "" && inch != ""){
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);
          
                          var tInch = (iFt*12) + iInch;
                          var tCm = tInch*2.54;
                          var tM = tCm/100;
                          var bmi = iWt/(tM*tM);
          
                          var msg = "";
          
                          if(bmi > 25){
                            msg = "You're OverWeight!";
                            bgColor = Colors.orange.shade200;
                          } else if(bmi < 18){
                            msg = "You're UnderWeight!";
                            bgColor = Colors.red.shade200;
                          } else{
                            msg = "You're Healthy";
                            bgColor = Colors.green.shade200;
                          }
          
                          setState((){
                            result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                          });
                        }
                        else{
                          setState(() {
                            result = "Please fill all the required fields!";
                          });
                        }
          
                      },
                      child: Text('Calculate', style: TextStyle(fontSize: 40, fontFamily: 'FontLobsterTwo'),),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        wtController.clear();
                        ftController.clear();
                        inController.clear();
                        setState((){
                          result = "";
                          bgColor = Colors.white;
                        });
                      },
                      child: Text('Clear', style: TextStyle(fontSize: 40, fontFamily: 'FontLobsterTwo'),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('Results: ', style: TextStyle(fontSize: 30, fontFamily: 'FontLobsterTwo'),),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(result, style: TextStyle(fontSize: 20, fontFamily: 'FontLobsterTwo', fontWeight: FontWeight.bold, color: Colors.red)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Made from love by: ', style: TextStyle(fontSize: 25, color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontFamily: 'FontLobsterTwo'),),
                      TextSpan(text: 'Yash Pale', style: TextStyle(fontSize: 45, color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'FontLobsterTwo'))
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
