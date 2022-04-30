import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/big_text.dart';
import 'package:flutter_app/widgets/icon_and_text_widget.dart';
import 'package:flutter_app/widgets/small_text.dart';
import '../utlis/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../widgets/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}


class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPageValue= pageController.page!;

      });
    });
  }

  @override
  void disposed(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        Container(
          //color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position){
                return _buildPageItem(position);
              }),
        ),
        // dots
        new DotsIndicator(
            dotsCount: 5,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        // Popular Text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin:  const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color:Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin:  const EdgeInsets.only(bottom: 2  ),
                child: SmallText(text: "Food paring",),
              )
            ],
          ),
        ),
        //list of food and images
       Container(
         height: 900,
         child:  ListView.builder(
           physics: NeverScrollableScrollPhysics(),
           //shrinkWrap: true,
             itemCount: 10,
             itemBuilder: (context, index){
               return Container(
                 margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                 child: Row(
                   children: [
                     //image section
                     Container(
                       width:120,
                       height: 120,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(Dimensions.radius20),
                           color: Colors.white38,
                           image: DecorationImage(
                             fit: BoxFit.cover,
                               image: AssetImage(
                                   "images/food2.png"
                               )
                           )
                       ),
                     )
                     //text container
                   ],
                 ),
               );

             }),
       )
      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix4 = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currScale, 0);
    }else{
      var currScale=0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix4,
        child:Stack(
      children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
            // ignore: prefer_const_constructors
            image:  DecorationImage(
                fit: BoxFit.cover,
                // ignore: prefer_const_constructors
                image: AssetImage(
                    "images/food0.png"
                )
            ),
          ),

        ),
        Align(
            alignment: Alignment.bottomCenter,
            child:Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  // ignore: prefer_const_constructors
                  BoxShadow(
                    // ignore: use_full_hex_values_for_flutter_colors
                    color: Color(0xFFe8e88),
                    blurRadius: 5.0,
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0)
                  )
                ]
                // ignore: prefer_const_constructors

              ),
              child: Container(
                  padding:  EdgeInsets.only(top:Dimensions.height15, left:15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text:"Chinese Side"),
                      // ignore: prefer_const_constructors
                      SizedBox(height: Dimensions.height10,),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {return Icon(Icons.star, color:AppColors.mainColor, size: 15, );}),
                          ),
                          SizedBox(width: 10,),
                          SmallText(text: "4.5"),
                          SizedBox(width: 10,),
                          SmallText(text: "1287"),
                          SizedBox(width: 10,),
                          SmallText(text: "comments")
                        ],
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: Dimensions.height20 ,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(icon: Icons.circle_sharp,
                              text: "Normal",

                              iconColor: AppColors.iconColor1),
                          IconAndTextWidget(icon: Icons.location_on,
                              text: "1.7km",

                              iconColor: AppColors.mainColor),
                          IconAndTextWidget(icon: Icons.access_time_rounded,
                              text: "32min",

                              iconColor: AppColors.iconColor2)
                        ],
                      )
                    ],
                  )
              ),


            ),
        )
      ],
    ));
  }
}
