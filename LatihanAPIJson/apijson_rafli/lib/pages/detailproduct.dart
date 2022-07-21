import 'package:apijson_rafli/model/product.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final Product product;
  const DetailProduct({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntrinsicHeight(
        child: Expanded(
          child: Column(
            children: [
              Hero(tag: product.id.toString(),
               child: Image.network(product.images.elementAt(0))),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(product.title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                      overflow: TextOverflow.clip,),
                    ),
                    Text("\$"+product.price.toString(),style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(product.category,style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600
                  ),),
                  Text(product.brand,style: TextStyle(
                    fontSize: 17
                  ),),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 5),
                    child: Text("Description : ",style: TextStyle(
                      fontSize: 11,
                    ),),
                  ),
                  SingleChildScrollView(child: Text(product.description,overflow: TextOverflow.clip,)),
                  ],
                ),
              ),
              Container(
                height: 300,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: product.images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>Container(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        alignment: Alignment.center,
                        child: Image.network(product.images.elementAt(index),
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent? loadingProgress){
                          return loadingProgress==null ? child : Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes!=null 
                              ? loadingProgress.cumulativeBytesLoaded/loadingProgress.expectedTotalBytes! 
                              : null
                            ),
                          );
                        },),
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}