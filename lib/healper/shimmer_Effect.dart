import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmerlist();
  }
}
class Shimmerlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset=0;
    int time=800;
      return  SafeArea(
        child: ListView.builder(
            itemCount:10 ,
            itemBuilder:(BuildContext context,int index){
              offset+=5;
              time=800+offset;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Shimmer.fromColors(child: ShimmerLayout(), baseColor: Color(0xFF0A0E21), highlightColor: Colors.white70,period: Duration(milliseconds: time),),
              );
            }

        ),

      );
  }
}


class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ContainerWidth=250;
    double ContainerHeigth=15;
      return Container(
        margin: EdgeInsets.symmetric(vertical: 7.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: <Widget>[

          Container(

            height: 100,
            width: 100,
            color: Color(0xFF0A0E21),

          ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: ContainerHeigth,
                  width: ContainerWidth,
                  color: Color(0xFF0A0E21),

                ),
                SizedBox(height: 5,),
                Container(
                  height: ContainerHeigth,
                  width: ContainerWidth*0.75,
                  color: Color(0xFF0A0E21),

                ),

              ],
            ),



          ],

        ),
      );
  }
}
