import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_13_assignment/screens/HomeScreen.dart';
import 'package:module_13_assignment/screens/update_product_details.dart';
import '../Style/Style.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({Key? key}) : super(key: key);
  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {

  List ProductList=[];
  bool Loading=true;

  @override
  void initState(){
    CallData();
    super.initState();
  }


  CallData() async{
    Loading=true;
    //data call
   Loading=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List"),
        centerTitle: true,
        backgroundColor: colormaroon,
        foregroundColor: Colors.white,),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
              child: Loading?(
                  Center(
                      child: CircularProgressIndicator(),)):
              RefreshIndicator(
                  onRefresh: () async {
                    await CallData();
                  },
                  child: GridView.builder(
                      gridDelegate: ProductGridViewStyle(),
                      itemCount: ProductList.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: Image.network(ProductList[index]['Img'],fit: BoxFit.fill)),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,5,5,8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ProductList[index]['ProductName']),
                                    SizedBox(height: 7),
                                    Text("Price: "+ProductList[index]['UnitPrice']+" BDT"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context)=>const update_product_details(),
                                            ),
                                          );
                                        }, child: Icon(CupertinoIcons.ellipsis_vertical_circle,size: 18,)),
                                        SizedBox(width: 4),
                                        OutlinedButton(onPressed: (){
                                        }, child: Icon(CupertinoIcons.delete,size: 18,))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  )
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colormaroon,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=> const HomeScreen(),
            ),
          );
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}