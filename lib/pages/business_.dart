import 'dart:convert';

import 'package:flu_first_app/pages/ParaForm.dart';
import 'package:flu_first_app/widgets/ParaFormWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'BotNav.dart';



// class Business extends StatefulWidget {
//   const Business({super.key});

class Business extends StatefulWidget {
  var orgId,closingFrom,closingTo;

   Business({Key? myKey, this.orgId,this.closingFrom,this.closingTo}) : super(key : myKey);


  @override
  State<Business> createState() => _BusinessState();


}

class _BusinessState extends State<Business> {

final TextEditingController _textEditingController = new TextEditingController()..text='fdfdfdf';

  final scrollController = ScrollController();

  List posts =[];
 int page =1;
  String clf='';


 // String orgId='005321';
 // String closingNo='2025011';
 //  String closingNo1='2025011';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.text='${widget.closingFrom}';
    clf='${widget.closingFrom}';
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
          title: const Text('Business', style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white
      ),


      body:

      SingleChildScrollView(
        child: Column(

          children: [
          //  Container( child: ParaForm(), height: 120,),
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              width: mediaWidth,
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
                  validator: (value){
                    if (value!.isEmpty)
                    {
                      return 'Please Enter Closing from';
                    }

                    return value;
                  },

                onChanged: (value){
                    setState(() {

                    });
                    if (value.length==6) {
                      //
                       widget.closingFrom=value.toString();
                     //  clf=widget.closingFrom!.isEmpty? value.toString() : widget.closingFrom;
                     clf=value.toString();
                     // print(widget.closingFrom);
                    }
                },
              ),
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
                  final fYear =post['FYEAR'];
                  final single =post['SINGLE'];
                  final secondYear =post['SCONDYEAR'];
                  final thirdYear =post['THIRDYEAR'];
                  final total =post['TOTAL'];
                  final orgid =post['ORGID'];
                  final tpolicy =post['NEW_POLICY'];
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
                        children: <Widget>[ Text('Name: ' '$name',textDirection: TextDirection.ltr,),
        
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[Text('First Year: ' '$fYear'),
                            Text('Single      : ' '$single'),
                           ]
                        ),
        
                          Row(
        
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[   Text('Second Year: ''$secondYear',textAlign: TextAlign.left,)
                                , Text('Third Year: ''$thirdYear')
        
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[   Text('Total Prem.: ''$total')
                                , Text('New Policy: ''$tpolicy')
        
                              ]
                          ),
        
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
                                        builder: (context)=>  Business(orgId: '$orgid', closingFrom: '$clf')));
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


    );
  }

  Future<void> fetchPosts() async{

    // showDialog(context: context, builder:(context)
    // {
    //   return Center(child: CircularProgressIndicator());
    // },
    // );
    //



    final url="https://priyojon.charteredlifebd.com/PriojanApi/api/GetBusinessReportV2?PageIndex=$page&PageSize=10&AgentId=${widget.orgId}&YearMonth=${widget.closingFrom}&runFlg=C";
    final uri =Uri.parse(url);
    final response = await http.get(uri);
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
        // invalid response

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
