import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: 'vazir',
        ),

          home: Directionality(
            child: MySaffold(),
            textDirection: TextDirection.rtl,
          ),
      )
  );
}

class MySaffold extends StatefulWidget {
  const MySaffold({Key? key}) : super(key: key);

  @override
  _MySaffoldState createState() => _MySaffoldState();
}

class _MySaffoldState extends State<MySaffold> {
  var price_per_geram_controler= TextEditingController();
  var award_per_geram_controler= TextEditingController();
  var total_weight_controler= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('محاسبه قیمت طلا'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center ,
                    controller: price_per_geram_controler,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'قیمت هر گرم',
                        suffixText: 'تومان' ,
                        helperText: 'مثال: 900,000(تومان)',
                      helperStyle: TextStyle(fontSize: 10)
                    ),

                ),
              ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
              child: TextField(
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center ,
                controller: award_per_geram_controler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'اجرت هر گرم',
                  suffixText: 'تومان' ,
                  helperText: 'مثال: 60,000(تومان)',
                    helperStyle: TextStyle(fontSize: 10)
                ),

              ),
            ),


            Container(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
              child: TextField(
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center ,
                controller: price_per_geram_controler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'قیمت هر گرم',
                  suffixText: 'تومان' ,
                  helperText: 'مثال: 900,000',
                    helperStyle: TextStyle(fontSize: 10)
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}







