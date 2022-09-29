import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class BottomSheetSilder extends StatefulWidget {
  const BottomSheetSilder({Key? key}) : super(key: key);

  @override
  State<BottomSheetSilder> createState() => _BottomSheetSilderState();
}

class _BottomSheetSilderState extends State<BottomSheetSilder> {

  final double _initFabHeight = 100.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;


  String Url = "https://api.nasa.gov/insight_weather/?api_key=DEMO_KEY&feedtype=json&ver=1.0";
  var Sol_key;
  var Data;
  List<dynamic> weather_data = [];
  //now we will create the function for the HTTP request
   getData() async{
   try{
     var response = await http.get(
         Uri.parse(Url),
         headers: {
           "Accept" : "application/json"
         }
     );
     if(response.statusCode==200){

         Data = jsonDecode(response.body);

         Sol_key = Data["validity_checks"]; //

         Sol_key =  Sol_key.toList();
         print(Sol_key.length);


         for(int i = 0; i< Sol_key.length; i++){
           print(Data[Sol_key[i]]["AT"]);
           weather_data.add(Data[Sol_key[i]]["AT"]); // this will allow us to get only the weather data
         }
         print(weather_data.length);



     }
   }catch(e){
     throw Exception(e);
    }

    //Okey now we've done with our http request let's now implement the data to our UI
  }

  @override
  void initState() {
    super.initState();
    getData();
    _fabHeight = _initFabHeight;

  }


  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.8;

    return Container();

    //   SlidingUpPanel(
    //   maxHeight: _panelHeightOpen,
    //   minHeight: _panelHeightClosed,
    //   parallaxEnabled: true,
    //   parallaxOffset: .5,
    //   body: _body(),
    //   panelBuilder: (sc) => _panel(sc),
    //   borderRadius: const BorderRadius.only(
    //       topLeft: Radius.circular(18.0),
    //       topRight: Radius.circular(18.0)),
    //   onPanelSlide: (double pos) => setState(() {
    //     _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
    //         _initFabHeight;
    //   }),
    // );
  }

  Widget _panel(ScrollController sc) {

    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Climate Forcast",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),


            Container(
              //first let's add the background image to our project
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/bg.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  //now let's add a black color filter to make the text more visible
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 50, bottom: 15, left: 15,right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Latest Weather\nat Elysium Planitia",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 28.0
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    //Now let's create the data container
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Sol ${Sol_key[0]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 38.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "High: ${(weather_data[0]["mx"]).ceil()}°C",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 34.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: Text(
                            "Today ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Low: ${(weather_data[0]["mn"]).ceil()}°C",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 34.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Now we will create the list for the previous days' data
                    const SizedBox(height: 60.0,),
                    const Text(
                      "Previous Days",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 28.0,
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    Container(
                      height: 3.0,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: Sol_key.length,
                          itemBuilder: (BuildContext, int index){
                            return ListItem(Sol_key[index], (weather_data[index]["mn"]).ceil(), (weather_data[index]["mx"]).ceil());
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),



          ],
        ));
  }



  Widget ListItem(String Sol, int min, int max){
    return Column(
      children: <Widget>[
        const SizedBox(height:10.0),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Sol $Sol",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 120,),
            Expanded(
              child: Text(
                "High: $max°C",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0,),
        Row(
          children: <Widget>[
            const Expanded(
              child: Text(
                "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 120,),
            Expanded(
              child: Text(
                "Low: $min°C",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0,),
        Container(
          height: 2.0,
          width: double.infinity,
          color: Colors.white,
        )
      ],
    );
  }



  Widget _body(){
    return Visibility(
      visible: false,
      child: Container(
        height: 800,
        color: Colors.red,
      ),
    );
  }






}
