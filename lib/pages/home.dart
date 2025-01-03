import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    try {
      data =data.isNotEmpty? data: ModalRoute.of(context)!.settings.arguments as Map;
    }
    catch(e){
      data=data;
    }
    print(data);
    String bgImage=data['isDaytime'] ? 'day.png':'night.png';
    Color? bgColor = data['isDaytime'] ?Colors.lightBlue:Colors.deepPurple[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit:BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0,0, 0),
              child: Column(
                children:<Widget> [
                  TextButton.icon(
                      onPressed:() async{
                        dynamic result =await Navigator.pushNamed(context,'/location');
                        setState(() {
                          data={
                            'location':result['location'],
                            'flag':result['flag'],
                            'time':result['time'],
                            'isDaytime':result['isDaytime'],
                          };
                        });
                        },
                      icon:Icon(
                          Icons.edit_location,
                        color: Colors.grey[300],
                        size:25.0,
                      ),
                      label:Text(
                          'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize:20.0,
                        ),
                      ),
                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style:TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color:Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color:Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
