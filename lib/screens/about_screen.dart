import 'package:flutter/material.dart';
import 'package:the_guardian_app/styles/styles.dart';

class AboutScreen extends StatelessWidget {

  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String info ='Desarrollado en Flutter por Andrés Pugliese\npara Android Challenge de NaranjaX';
    String info2 ='Mail: andresdecba@gmail.com\nLinkedIn: andres-pugliese\nCel.: 351 6 639258';

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: kBlue,
          elevation: 0,
        ),
    
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [

              // THE GUARDIAN APP
              Divider(thickness: 1, color: kBlue, height: 100,),
              Text('The Guardian APP', style: TextStyle(fontSize: 30, color: kBlue),),
              Divider(thickness: 1, color: kBlue, height: 100,),

              // INFO + CONTACTS
              Text(
                info,
                style: TextStyle(fontSize: 20, color: kBlue),
                textAlign: TextAlign.center,
              ),
              Divider(height: 50,),
              Text(
                info2,
                style: TextStyle(fontSize: 20, color: kBlue),
                textAlign: TextAlign.center,
              ),
              Divider(height: 50,),

              // LOGOS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 35,
                    child: Image.asset('assets/the-guardian-logo-blue.png'),
                  ),
                  SizedBox(
                    height: 30,
                    child: Image.asset('assets/naranjax-logo.png'),
                  ),
                ],
              ),
              Divider(height: 50,),

              // DATE
              Spacer(),
              Text('02/09/2021', style: TextStyle( color: kBlue),)    
            ],
          ),
        ),
      ),
    );
  }
}