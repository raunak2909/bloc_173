import 'package:bloc_173/listmap_bloc/list_bloc.dart';
import 'package:bloc_173/listmap_bloc/list_event.dart';
import 'package:bloc_173/listmap_bloc/list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){

  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ListBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (_, state){
          List<Map<String, dynamic>> mapData = state.mData;
          return ListView.builder(
            itemCount: mapData.length,
              itemBuilder: (_, index){
              var eachMap = mapData[index];
              return ListTile(
                title: Text('${eachMap['title']}'),
                subtitle: Text('${eachMap['desc']}'),
              );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<ListBloc>().add(AddMapEvent(newMap: {
            "title" : "Hello",
            "desc" : "Practise..Practise..Practise!!"
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}