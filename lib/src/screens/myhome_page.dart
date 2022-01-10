import 'package:flutter/material.dart';


import 'package:flutter_datapersistence/src/screens/settings_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:const  SettingsView()
        
        
        /*FutureBuilder<List<Photos>>(
            future: api.getFoto(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext contex, int index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(snapshot.data![index].thumbnailUrl),
                             ),
                          title: Text(snapshot.data![index].title.toString()),
                          subtitle: Text("Resultado del Albun ${snapshot.data![index].id}"),
                          ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })
        */
        /*Center(
          child: CusttonGradienbutton(
          text: const Text("Mexico"), 
          width: 150, 
          height:40,
          gradientcolor: const [Colors.green, Colors.white, Colors.red],
          initialPosition: Alignment.centerLeft ,
          finalPosition: Alignment.centerRight,
          function: ()=>print("Ha hecho tap"),
          leadingIcon: const Icon(Icons.person),
          finalIcon: const Icon(Icons.ac_unit),
          ),
        )
      */
        /// floatingActionButton: FloatingActionButton(
        //  onPressed: _incrementCounter,
        // tooltip: 'Increment',
        // child: const Icon(Icons.add),
        // ),
        );
  }

}
