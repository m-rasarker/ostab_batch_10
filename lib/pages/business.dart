import 'dart:convert';
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
final TextEditingController _textEditingController1 = new TextEditingController()..text='fdfdfdf';
bool _isLoading = false;
  final scrollController = ScrollController();

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
          title: const Text('Business', style: TextStyle(
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
                          if (value.length == 6) {
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
                          if (value.length == 6) {
                            //
                            widget.closingTo = value.toString();
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
                            builder: (context)=>  Business(orgId: '$orgid', closingFrom: '$clf', closingTo: '$clt')));
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
                          children: <Widget>[ Text('Name: ' '$name',style: (TextStyle(fontWeight: FontWeight.bold,fontSize: 15)), textDirection: TextDirection.ltr,),

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

                            SizedBox(height: 10,),

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
                                          builder: (context)=>  Business(orgId: '$orgid', closingFrom: '$clf', closingTo: '$clt')));
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

    // showDialog(context: context, builder:(context)
    // {
    //   return Center(child: CircularProgressIndicator());
    // },
    // );
    //
    setState(() {
      _isLoading = true; // Show progress bar
    });


    final url="https://priyojon.charteredlifebd.com/PriojanApi/api/GetBusinessReportV2?PageIndex=$page&PageSize=10&AgentId=${widget.orgId}&YearMonth=${widget.closingFrom}&runFlg=C";
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
