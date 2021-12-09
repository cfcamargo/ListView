import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){
    for(int i=0; i<=10; i++){
        Map<String, dynamic> item = Map();
        item["titulo"] = "Titulo ${i} Lorem Ipsum dolor sit amet";
        item["description"] = "Descrição ${i} Lorem Ipsum dolor sit amet";
        _itens.add( item );
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
            itemBuilder: (context,  indice ){

              Map<String, dynamic> item = _itens[indice];
              // print("item ${item["titulo"] }");

              return ListTile(
                onTap: (){
                  // print("click");
                  showDialog(
                      context: context,
                    builder: (context){
                        return AlertDialog(
                          title: Text(item["titulo"]),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                          content: Text(item["description"]),
                          actions: [
                            FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text('Sim'),

                            ),
                            FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text('Não')
                            ),
                          ],
                          contentPadding: EdgeInsets.all(20),
                          // backgroundColor: Colors.blue,
                        );
                    }
                  );
                },
                onLongPress: (){
                  print("click segurando");
                },
                title: Text(item["titulo"]),
                subtitle: Text(item["description"]),
              );
            }
        ),
      ),
    );
  }
}
