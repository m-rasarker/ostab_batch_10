import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:validators/validators.dart';
import 'BotNav.dart';



// class Business extends StatefulWidget {
//   const Business({super.key});

class Commission extends StatefulWidget {
  var orgId,closingFrom,closingTo;

  Commission({Key? myKey, this.orgId,this.closingFrom,this.closingTo}) : super(key : myKey);


  @override
  State<Commission> createState() => _CommissionState();


}

class _CommissionState extends State<Commission> {


final TextEditingController _textEditingController = new TextEditingController()..text='fdfdfdf';
final TextEditingController _textEditingController1 = new TextEditingController()..text='fdfdfdf';
bool _isLoading = false;
  final scrollController = ScrollController();
final scrollController1 = ScrollController();
  List posts =[];
 int page =1;
  String clf='';
String clt='';
  String orgid='';


 // String orgId='005321';
 // String closingNo='2025011';
 //  String closingNo1='2025011';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.text='${widget.closingFrom}';
    _textEditingController1.text='${widget.closingTo}';
    orgid='${widget.orgId}';
    clf='${widget.closingFrom}';
    clt='${widget.closingTo}';
    scrollController.addListener(_scrollListener);

    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Scaffold(
      bottomNavigationBar: BotNav(),
      appBar: AppBar(
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular((25)))),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20), bottom: Radius.circular((5)))),
          title: const Text('Commission', style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white
      ),




      body:

      Center(
        child: SingleChildScrollView(
          child: _isLoading
            ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen), // Set the color
            strokeWidth:4.0): Column(

            children: [
            //  Container( child: ParaForm(), height: 120,),
              SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.topCenter,
                      width: mediaWidth*2/3-2,
                      child: TextFormField(
                        //  keyboardType: TextInputType.emailAddress,
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Closing From",
                          hintText: 'Closing from',
                          border: OutlineInputBorder(),
                          // prefixIcon: Icon(Icons.email,color: Colors.black,),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Closing from';
                          }

                          return value;
                        },

                        onChanged: (value) {
                          setState(() {

                          });
                          if (value.length == 7) {
                            //
                            widget.closingFrom = value.toString();
                            //  clf=widget.closingFrom!.isEmpty? value.toString() : widget.closingFrom;
                            clf = value.toString();
                            // print(widget.closingFrom);
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.topCenter,
                      width: mediaWidth*2/3-2,
                      child: TextFormField(
                        //  keyboardType: TextInputType.emailAddress,
                        controller: _textEditingController1,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Closing To",
                          hintText: 'Closing To',
                          border: OutlineInputBorder(),
                          // prefixIcon: Icon(Icons.email,color: Colors.black,),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Closing To';
                          }

                          return value;
                        },

                        onChanged: (value) {
                          setState(() {

                          });
                          if (value.length == 7) {
                            //
                            widget.closingFrom = value.toString();
                            //  clf=widget.closingFrom!.isEmpty? value.toString() : widget.closingFrom;
                            clt = value.toString();
                            // print(widget.closingFrom);
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.topCenter,
                      width: mediaWidth*2/3-2,
                      child:  ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,foregroundColor: Colors.white
                      ),onPressed: () {

                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>  Commission(orgId: '$orgid', closingFrom: '$clf', closingTo: '$clt')));
                      }, child: const Text('View')

                      ),



                    ),
                  ],
                ),

              Container(
                height: 650,
                child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                  controller: scrollController,
                  itemCount: posts.length,
                  itemBuilder: (context,index){
                    final post =posts[index];
                    final name =post['NAME'];
                    final fYear =post['FYEAR_COM'];
                    final single =post['SINGLE_COM'];
                    final secondYear =post['SECONDYEAR_COM'];
                    final thirdYear =post['THIRDYEAR_COM'];
                    final renealcom =post['TOTAL_RENEWAL_COM'];
                    final totalcom =post['TOTAL_BUSINESS_COM'];
                    final cramount =post['CRAMOUNT'];
                    final orgid =post['ORGID'];
                    final dramount =post['DRAMOUNT'];
                    final icamount =post['IC_AMOUNT'];
                    final taxOnEar =post['TAX_ON_EAR'];
                    final taxOnSal =post['TAX_ON_SALARY'];
                    final cfundOnEar =post['CFUND_ON_EAR'];
                    final cfundOnSal =post['PFUND'];
                    final totalDeduction = (dramount + icamount + taxOnEar + taxOnSal + cfundOnEar + cfundOnSal).round() ;
                    final crallowance =post['CRALLOWANCE'];
                    final icamountpaid =post['ICAMOUNTPAID'];
                    final salary =post['SALARY'];
                    final total_payable = (icamountpaid + totalcom + salary + crallowance).round();
                    final advice_payable = (total_payable - totalDeduction).round();

                // return ListTile(
                //   title: Text('$title'),
                //   subtitle: Text('$fyear')
                // );

                    return Card(
                      margin: const EdgeInsets.all(5.0),
                    //  margin: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      elevation: 3,
                      shadowColor: Colors.greenAccent,

                      child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[ Text('Name: ' '$name',textDirection: TextDirection.ltr,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),

                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[Text('1st. Year Comm: ' '$fYear'),
                              Text('Single Comm. : ' '$single'),
                             ]
                          ),

                            Row(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[   Text('2nd Year Comm: ''$secondYear',textAlign: TextAlign.left,)
                                  , Text('3rd Year Comm: ''$thirdYear')

                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[   Text('Renewal Comm.  : ''$renealcom')
                                  , Text('Total Comm.   : ''$totalcom')

                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[   Text('IC Refund.   : ''$icamountpaid')
                                  , Text('Cr Allowance: ''$crallowance')

                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[   Text('Cr. Amount.   : ''$cramount')
                                  , Text('Salary .     : ''$salary')

                                ]
                            ),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[  Text('Total Payable   : ''$total_payable',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),)

                                ]
                            ),
                            SizedBox(height: 5,),
                            Container(height: 2,width: mediaWidth*2,color: Colors.grey,),
                            SizedBox(height: 10,),



                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[   Text('Dr. Amount  : ''$dramount')
                                  , Text('IC Amount: ''$icamount')

                                ]
                            ),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[   Text('TAX on Ear.: ''$taxOnEar')
                                  , Text('TAX on Sal. : ''$taxOnSal')

                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[   Text('C.Fund On Ear.: ''$cfundOnEar')
                                  , Text('C.Fund on Sal. : ''$cfundOnSal')

                                ]
                            ),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[  Text('Total Deduction: ''$totalDeduction',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),)

                                ]
                            ),
                            SizedBox(height: 5,),
                            Container(height: 2,width: mediaWidth*2,color: Colors.grey,),
                            SizedBox(height: 10,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[  Text('Salary Advice: ''$advice_payable',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),)

                                ]
                            ),
                            SizedBox(height:10,),


                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.green)),
                              child: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[   Text('Organiser ID: ''$orgid')
                                    ,  ElevatedButton(style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.teal,foregroundColor: Colors.white
                                    ),onPressed: () {

                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context)=>  Commission(orgId: '$orgid', closingFrom: '$clf',closingTo: '$clt')));
                                    }, child: const Text('Details')

                                    )

                                  ]
                              ),
                            ),
                                        ]
                                        ),
                        ),

                    );

                  }),
              ),
          ]
          ),
        ),
      ),


    );

  }

  Future<void> fetchPosts() async{


    setState(() {
      _isLoading = true; // Show progress bar
    });

//  final url="https://priyojon.charteredlifebd.com/PriojanApi/api/GetBusinessReportV2?PageIndex=$page&PageSize=10&AgentId=${widget.orgId}&YearMonth=${widget.closingFrom}&runFlg=C";
    final url="https://priyojon.charteredlifebd.com/PriojanApi/api/GetCommissionListV2?PageIndex=1&PageSize=10&AgentId=${widget.orgId}&F_Closing=${widget.closingFrom}&T_Closing=${widget.closingTo}";
    final uri =Uri.parse(url);
    final response = await http.get(uri);
    try {
      if (response.statusCode==200)
        {
          final json = jsonDecode(response.body) as List;

          setState(() {
            posts =posts + json;
          });
          //valid response

        }
      else
        {
          throw Exception('Failed to load data');

        }
    } on Exception catch (e) {
      // TODO
    }
    finally {
      setState(() {
        _isLoading = false; // Hide progress bar
      });
    }

  }







  void _scrollListener(){
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent)
      {
        page=page+1;
        fetchPosts();
        print('Call');
      }
    else
      {
        print('Don call');
      }
  }

}
