import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:the_guardian_app/helpers/helpers.dart';
import 'package:the_guardian_app/models/models.dart';


class NewsScreen extends StatelessWidget {
  const NewsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //// recibir argumentos
    final News news = ModalRoute.of(context).settings.arguments as News;

    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              _Header(news: news),
              _InfoPills(news: news),
              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 20.0),
                child: Html(data: news.fields.body),
              )
            ],
          ),
        )
      ),
    );
  }
}

// foto principal mas titulos
class _Header extends StatelessWidget {
  const _Header({
    Key key,
    this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [

        // image
        SizedBox(
          width: double.infinity,
          height: 350,
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/placeHolder.jpg'),
            image: NetworkImage( news.fields.thumbnail ),
          ),
        ),

        // title background color fade, black to transparent
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
        ),

        // news title
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(news.fields.headline, style: TextStyle(color: Colors.white, fontSize: 24) ),
              Text(news.fields.trailText, style: TextStyle(color: Colors.white, fontSize: 14) ),
            ],
          ),
        ),

        // page back arrow
        Positioned(
          top: 5,
          left: 5,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,),
          ),
        )
      ],
    );
  }
}

// info debajo del header
class _InfoPills extends StatelessWidget {
  const _InfoPills({
    Key key,
    this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {  

    // rounded corners black background
    return Container(
      color: Colors.black,

      // container with info
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,                    
          children: [
            
            // section
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.black
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_forward_ios, color: Colors.white,),
                  SizedBox(width: 10,),
                  Text(news.sectionName, style: TextStyle(color: Colors.white),),
                ],
              )
            ),

            SizedBox(width: 15,),

            // fecha
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.grey[300]
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today_rounded, color: Colors.black45,),
                  SizedBox(width: 10,),
                  Text(dateConverterHelper(news.webPublicationDate), style: TextStyle(color: Colors.black45),),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}