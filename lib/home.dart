import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final _wightcontroler = TextEditingController();
  final _heightcontroler = TextEditingController();
  @override
  void dispose() {
    _wightcontroler.dispose();
    _heightcontroler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
        backgroundColor: Color.fromARGB(255, 10, 60, 12),
        foregroundColor: Color.fromARGB(255, 200, 181, 114),
        toolbarHeight: 46,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _wightcontroler,
              keyboardType: TextInputType.number,
              cursorColor: Colors.green.shade900,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.green.shade900,
                  ),
                  prefixIconColor: Color.fromARGB(255, 255, 244, 144),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.green.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 11, 48, 13))),
                  hintText: 'Enter your Weight',
                  hintStyle: TextStyle(color: Colors.black),
                  focusColor: Colors.green.shade900,
                  fillColor: Colors.green.shade100,
                  filled: true),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _heightcontroler,
              keyboardType: TextInputType.number,
              cursorColor: Colors.green.shade900,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.green.shade900,
                  ),
                  prefixIconColor: Color.fromARGB(255, 255, 244, 144),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.green.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 11, 48, 13))),
                  hintText: 'Enter your height',
                  hintStyle: TextStyle(color: Colors.black),
                  focusColor: Colors.green.shade900,
                  fillColor: Colors.green.shade100,
                  filled: true),
            ),
          ),
          ElevatedButton(
            onPressed: calculate_bmi,
            child: Text(
              'Calculate',
              style: TextStyle(color: Colors.greenAccent.shade100),
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green.shade900)),
          )
        ],
      ),
    );
  }

  void calculate_bmi() {
    if (_wightcontroler.text.isEmpty) {
      showmsg(context, 'Please Enter your Wight');
      return;
    }
    if (_heightcontroler.text.isEmpty) {
      showmsg(context, 'Please Enter your Height');
      return;
    }
    if (double.parse(_wightcontroler.text) <= 0.0) {
      showmsg(context, 'Wight need to greater than zero');
      return;
    }
    if (double.parse(_heightcontroler.text) <= 0.0) {
      showmsg(context, 'height need to greater than zero');
      return;
    }
    if (double.parse(_heightcontroler.text) >= 2) {
      showmsg(context, 'your height must be in meter');
      return;
    }
    if (double.parse(_wightcontroler.text) <= 3.5) {
      showmsg(context, 'your wight must be in kilogram');
      return;
    } else {
      final weight = double.parse(_wightcontroler.text);
      final height = double.parse(_heightcontroler.text);
      final bmi = weight / (height * height);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => result(
                    bmi: bmi,
                  )));
    }
  }

  void showmsg(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
