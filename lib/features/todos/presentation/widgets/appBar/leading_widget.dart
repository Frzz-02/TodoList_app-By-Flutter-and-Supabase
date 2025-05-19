import 'package:flutter/material.dart';

class LeadingWidget extends StatelessWidget {
  const LeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 28, right: 0, top: 9, bottom: 9),


        decoration: BoxDecoration(
          color: const Color.fromARGB(46, 0, 0, 0),
          borderRadius: BorderRadius.circular(10),
          
          border: Border.all(
            color:const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
            width: 2,
          ),
        ),
    


        child: Center(
          child: Tooltip(
            message: 'Menu',
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                elevation: 0,
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                shadowColor: Colors.transparent,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              
              
              

              child: const Icon(
                Icons.menu_outlined,
                color: Colors.white,
              ),



              onPressed: () {

              },



            ),
          ),
        
        
        
        
        
        
        
        
        ) 
      );
  }
}
