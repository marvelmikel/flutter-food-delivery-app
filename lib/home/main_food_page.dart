import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/dimensions.dart';

import '../utlis/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    //step4
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top:Dimensions.height45, bottom: Dimensions.height15),
               padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Nigeria", color: AppColors.mainColor),
                     Row(
                       children: [
                         SmallText(text: "Abuja", color: Colors.black54,),
                         Icon(Icons.arrow_drop_down_rounded)
                       ],
                     )
                    ],
                  ),
                  Center(
                    child:Container(
                    width: Dimensions.width30,
                    height: Dimensions.height30,
                    child: Icon(Icons.search, color:Colors.white, size:Dimensions.iconSize24,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color:  AppColors.mainColor,
                    ),

                  ),
                  ),

                ],
              ),

            ),
          ),
          //showing the body
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}