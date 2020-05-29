

import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  
  var _resultado = "Insira o número a ser convertido"; 
  TextEditingController _numeroASerconvertido = TextEditingController();
  

  void _resetarCampos(){
    _numeroASerconvertido.text = "";
    setState(() {
      _resultado = "Insira o número a ser convertido";
    });
    
  }

  bool _verificador(int x){
    var numero = x.toString();
    int y = numero.length;
    for(int i=0; i<y; i++){
      if(numero[i] != "1" && numero[i] != "0"){
        return false;
      }
    }
    return true;
  }


  void _conversor(){
    int numero = int.parse(_numeroASerconvertido.text);
    var numeroTexto = _numeroASerconvertido.text;
    var numeroTamanho = numeroTexto.length;
    int expoente = 0;
    int resultado = 0;
    var bi = 0;
    if(_verificador(numero)){
      for(int i=numeroTamanho-1; i>=0; i--){
        bi = int.parse(numeroTexto[i]);
        resultado += (bi)*(pow(2,expoente));
        expoente++;
      }
      setState(() {
      _resultado = resultado.toString();
    });
    }else{
      setState(() {
        _resultado = "Numero invalido";
      });
    }
    
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
      title: Text(
        "Bin2Dec",
        style: TextStyle(fontSize: 25.0)),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.refresh), onPressed: _resetarCampos)],
      ),
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0,50.0,10.0,0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.people,size: 120.0,color: Colors.cyan,),
            TextField(
              keyboardType: TextInputType.number,
              controller: _numeroASerconvertido,
              decoration: InputDecoration(
                labelStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 22.0),
                labelText: "Numero binário",
                
              ),
              style: TextStyle(fontSize: 18.0),
              
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0,bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  color: Colors.deepPurple, 
                  onPressed: _conversor,
                  child: Text(
                    "Converter", 
                    style: TextStyle(color: Colors.black, fontSize: 20.0,),
                    ),  
                ),
                  
                ),
            ),
            Padding( 
              padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
                
              )
            )
            
          ],
          
        
        ),
      ),
      
      );
      
      
  }
}