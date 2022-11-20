import 'package:bmi_calculator/bmi_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class result extends StatelessWidget {
  final double bmi;
  const result({Key? key, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
        backgroundColor: Color.fromARGB(255, 10, 60, 12),
        foregroundColor: Color.fromARGB(255, 200, 181, 114),
        toolbarHeight: 46,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text('Your Bmi is'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 7, color: color()),
                          shape: BoxShape.circle),
                      child: Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    image()
                  ],
                ),
                Text('Your status is ',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                Text(Bmi.getbmistatus(bmi),
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                SizedBox(
                  height: 20,
                ),
                Column(
                    children: Bmi.statusMap.keys
                        .map((e) => ListTile(
                              tileColor:
                                  Bmi.getbmistatus(bmi) == e ? color() : null,
                              title: Text(e),
                              trailing: Text(Bmi.statusMap[e]!),
                            ))
                        .toList())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color color() {
    if (bmi < 16.0) {
      return Colors.blue.shade300;
    } else if (bmi >= 16.0 && bmi <= 16.9) {
      return Colors.blue.shade500;
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      return Colors.blue.shade700;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return Colors.green;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      return Colors.orangeAccent;
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      return Colors.orange;
    } else if (bmi >= 35.0 && bmi <= 39.9) {
      return Colors.redAccent;
    } else {
      return Colors.red;
    }
  }

  Image image() {
    if (bmi <= 18.4) {
      return Image.asset(
        'assets/a.jpeg',
        fit: BoxFit.cover,
        height: 100,
        width: 20,
      );
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return Image.asset('assets/b.jpeg',
          fit: BoxFit.cover, height: 130, width: 40);
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      return Image.asset('assets/c.jpeg',
          fit: BoxFit.cover, height: 130, width: 45);
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      return Image.asset('assets/d.jpeg',
          fit: BoxFit.cover, height: 130, width: 45);
    } else {
      return Image.asset('assets/e.jpeg',
          fit: BoxFit.cover, height: 130, width: 50);
    }
  }
}
