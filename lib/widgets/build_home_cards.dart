import 'package:flutter/material.dart';
import 'package:the_guardian_app/helpers/helpers.dart';
import 'package:the_guardian_app/models/models.dart';

class BuildHomeCards extends StatelessWidget {

  final News news;
  const BuildHomeCards({Key key, this.news}) : super(key: key);  

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () => Navigator.pushNamed(context, '/newsScreen', arguments: news ),

      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // imagen
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(height: 100,
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/placeHolder.jpg'),
                  image: NetworkImage( news.fields.thumbnail )
                ),
              ),
            ),

            SizedBox(width: 15,),

            // titulo + fecha
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    news.webTitle, //'Titulo',
                    style: TextStyle( 
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w900
                    ),
                    maxLines: 2,
                    ),
                  SizedBox(height: 20,),
                  Text(
                    dateConverterHelper(news.webPublicationDate), //'Fecha',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                    ),
                    ),    
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}