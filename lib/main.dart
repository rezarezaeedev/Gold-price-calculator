import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
  final String default_tax='9';
  final String default_seller_percentage='7';
  final String toman='تومان';
  final String rial='ریال';
  final String dollar='\$';
  var   fair_price='';
  var   maximum_price='';
  var   minimum_price='';

  var price_per_geram_controler= TextEditingController();
  var award_per_geram_controler= TextEditingController();
  var total_weight_controler= TextEditingController();
  var tax_of_price_controler= TextEditingController();
  var seller_percentage_controler= TextEditingController();

    _MySaffoldState(){
      tax_of_price_controler.text=default_tax;
      seller_percentage_controler.text=default_seller_percentage;
  }

  String price_seperator(String price){
    var result='';
    price=price.split('').reversed.join();
    int counter=0;
    for(int i=0;i<price.length;i++){
       result=price[i]+result;
       counter++;
       if(counter==3 && i!=price.length-1){
         counter=0;
         result=','+result;
       }

    }
    return result;
  }

  int calculate_gold_price(int a_gram,int weight, int award,int tax,int seller_percentage){
      var result;
      result=((a_gram+award)*weight)+(tax/100)+(seller_percentage/100);
      return int.parse(result.toStringAsFixed(0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('محاسبه قیمت طلا'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center ,
                      controller: price_per_geram_controler,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(height: -1),
                          labelText: 'قیمت هر گرم',
                          suffixText: 'تومان' ,
                          helperText: 'مثال: 900,000(تومان)',
                        helperStyle: TextStyle(fontSize: 9)
                      ),
                      maxLines: 1,
                      maxLength: 10,
                  ),
                ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center ,
                  controller: award_per_geram_controler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(height: -1),
                    labelText: 'اجرت هر گرم',
                    suffixText: 'تومان' ,
                    helperText: 'مثال: 60,000(تومان)',
                      helperStyle: TextStyle(fontSize: 9)
                  ),
                  maxLines: 1,
                  maxLength: 7,
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center ,
                  controller: total_weight_controler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(height: -1),
                    labelText: 'وزن کل طلا',
                    suffixText: 'تومان' ,
                    helperText: 'مثال: 53(گرم)',
                      helperStyle: TextStyle(fontSize: 9)
                  ),
                  maxLines: 1,
                  maxLength: 5,

                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    SizedBox(
                      child: RaisedButton(
                        onPressed: (){
                            setState(() {
                              var a_gram=int.parse(price_per_geram_controler.text);
                              var weight=int.parse(total_weight_controler.text);
                              var award=int.parse(award_per_geram_controler.text);
                              var tax=int.parse(tax_of_price_controler.text);
                              var seller_percentage=int.parse(seller_percentage_controler.text);
                              var final_price=calculate_gold_price(a_gram, weight, award, tax, seller_percentage);

                              fair_price='${price_seperator(final_price.toString())} ${toman}';

                            });
                        },
                        child:Text('محاسبه'),
                      ),
                      width: 80,height: 35,
                    ),
                    CupertinoButton(
                      onPressed: (){
                          price_per_geram_controler.clear();
                          award_per_geram_controler.clear();
                          total_weight_controler.clear();
                          tax_of_price_controler.clear();
                          seller_percentage_controler.clear();

                          tax_of_price_controler.text=default_tax;
                          seller_percentage_controler.text=default_seller_percentage;
                      },
                      child: Text('پاکردن',style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.7),),),
                      pressedOpacity: 0.4,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                          controller: tax_of_price_controler,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        maxLength: 2,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'مالیات',
                          helperText: '%',
                          counterText: '',
                          labelStyle: TextStyle(height: -1)
                        ),
                      ),
                      width: 95,
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: seller_percentage_controler,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        maxLength: 2,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'سود فروشنده',
                            helperText: '%',
                            counterText: '',
                            labelStyle: TextStyle(height: -1,),
                        ),
                      ),
                      width: 95,
                    ),

                  ],
                ),
              ],),

                Column(
                  children: [
                    Column(

                      children: [
                        MaterialButton(
                            onPressed: (){

                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Icon(Icons.info),
                                ),
                                Text('قیمت خرید منصفانه',),
                              ],
                            )
                        ),
                        
                        Text('$fair_price'),
                                                                        
                      ],
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}






































