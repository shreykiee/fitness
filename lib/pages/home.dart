import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';



class HomePage extends StatelessWidget {
   HomePage ({super.key});
  List<CategoryModel> categories =[];
  List<DietModel> diets =[];
  List<PopularDietsModel> popularDiets =[];

  //method to get categories
  void _getInitialInfo()
  {  
    diets= DietModel.getDiets();
    categories = CategoryModel.getCategories();
    popularDiets = PopularDietsModel.getPopularDiets();
  }




  @override
  Widget build(BuildContext context) {
    _getInitialInfo();

    //creating Scaffold 
    return Scaffold(

      backgroundColor: Colors.white,

      //Creating AppBar
      appBar: appBar(),

      
      
      
      body: ListView
      (
       
        children: [
          //creating Search Textfield 
          searchfield(),

          //creating distance from top
          const SizedBox(height: 40,),

          //Adding column for childeran 
           categoriesSection(),
           const SizedBox(height: 40,),

           //diet recommandation section

           //Title
            _dietSection(),


            const SizedBox(height: 40,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              SizedBox(height: 15,),

              ListView.separated(
                itemCount: popularDiets.length,
                shrinkWrap: true,
                separatorBuilder: (context,index) => SizedBox(height: 25,),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemBuilder: (context,index){
                  return Container(
                    
                    height: 100,
                    decoration: BoxDecoration(
                      color: popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: popularDiets[index].boxIsSelected ? [
                        BoxShadow( 
                          color: Color(0xff1D1617).withOpacity(0.07),
                          offset: Offset(0,10),
                          blurRadius: 40,
                          spreadRadius: 0,

                        ),
                      ] : []

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      SvgPicture.asset(popularDiets[index].iconPath,width: 65,height: 65,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            popularDiets[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calorie ,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff7B6F72),
                              fontSize: 14,
                            ),
                            ),
                        ],
                      ),

                      //creating button to view more
                      GestureDetector(
                        onTap:(){

                        } ,
                        child: SvgPicture.asset(
                          'assets/icons/button.svg',
                          width: 30,
                          height: 30,
                        ),
                      )
                    ],),

                  );
                }

              )
              
              ],
            ),
             const SizedBox(height: 40,),


        ],
      ),
    );
  
  }

  Column _dietSection() {
    //Title
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Recommendation\nfor diet',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
              
              
                ),),
            ),

            //content
            const SizedBox(
              height: 15,
            ),

            Container
            (
              color:  Colors.white,
              height: 240,

              //building view for items
              child: ListView.separated
              (
                itemBuilder:  (context,index)
                {
                  return Container
                  // adding container decoration
                  (
                    width: 210,
                    decoration: BoxDecoration
                    (
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),

                  //adding container information
                  child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: 
                    [ //Display Svg
                      SvgPicture.asset(diets[index].iconPath),
                      //Display text 
                      Column(
                        children: [
                          Text(
                            diets[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            ),
                          
                          //Display level
                          Text(
                            diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calorie ,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff7B6F72),
                              fontSize: 14,
                            ),
                            ),
                        ],
                      ),

                      //Implement View button
                      Container
                      
                      (
                        
                        height: 45 ,
                        width: 130,
                        decoration:  BoxDecoration(
                           gradient: LinearGradient
                           (colors:
                            [ diets[index].viewIsSelected ? Color(0xff9DCEFF) : Colors.transparent,
                              diets[index].viewIsSelected ? Color(0xff92A3FD) : Colors.transparent]
                            ),
                        ),
                        child: Center(
                          child: Text(
                            
                            'View',
                            style : TextStyle(
                              color:diets[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            )
                          ),
                        ),

                      ),
                    ],
                  ),


                  );


                }, 
                separatorBuilder:(context,index) => const SizedBox(width: 25,),
                 itemCount: diets.length,
                 scrollDirection: Axis.horizontal,
                 padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                 ),
              ),
            ),

            

            
          ],
         );
  }

  Column categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
              
              
                ),
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 120,
              
              child: ListView.separated(
                separatorBuilder: (context,index) => const SizedBox(width: 25,),
                itemCount:  categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left:  20, right: 20),
                itemBuilder: (context,index)
                { 
                  
                  return Container(
                    
                    width: 100,
                    decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                        
                      ),

                     
                      
                             Text(
                              
                              
                              categories[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                                                     ),
                           ],
                         ),
                      
                      
               
                  );
                                    
                }
                ),

            ),
          ],
        );
  }

  
  Container searchfield() {
    return Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,

              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Search Pancake',
              hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14,
              ),

                border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(15) ,
                borderSide: BorderSide.none),

              //Creating Icon to display at the start of the Search text field
              prefixIcon:Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              


              //Creating Icon to display at the end of the Search text field
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),

              
          
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      //Title
      title: const Text(
          'Breakfast',
          //Additing Style to title
          style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        ),
      //Setting AppBar design
      backgroundColor: Colors.white,
      centerTitle: true,

      //Wrapping button inside GestureDetector
      leading: GestureDetector(

        //Additig on tap functionality
        onTap:()
        {

        },
        //creating button 
        child: Container
      
        (
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration:  BoxDecoration
              (
                color:const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10),

              ),
              
        child: SvgPicture.asset
              (
                'assets/icons/Arrow - Left 2.svg',
                height: 20,
                width: 20
              ),
           
    
    
      ),
    ),

    //creating widgit for dots 

    actions: [
      GestureDetector(
        onTap: () 
        {

        },

        child: Container
      
        (
        width: 37,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration:  BoxDecoration
              (
                color:const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10),

              ),
              
        child: SvgPicture.asset
              (
                'assets/icons/dots.svg',
                height: 5,
                width: 5,
              ),
           
    
    
          ),
        )
      ],

    );
  }
  

}