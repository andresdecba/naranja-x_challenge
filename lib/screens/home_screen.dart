import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_guardian_app/providers/home_provider.dart';
import 'package:the_guardian_app/styles/styles.dart';
import 'package:the_guardian_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final newsProvider = Provider.of<NewsProvider>(context);

    return SafeArea(
      child: Scaffold(
        drawer: _Drawer(),
        body: _BuildNewsList(
          newsProvider: newsProvider
        )
      ),
    );
  }
}

// drawer
class _Drawer extends StatelessWidget {

  const _Drawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kYellow,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Home', style: TextStyle(fontSize: 20, color: kBlue),),
              leading: Icon(Icons.home, color: kBlue,),
              dense: true,
              horizontalTitleGap: 0,
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            Divider(color: kBlue.withOpacity(0.5), thickness: 1,),
            ListTile(
              title: Text('Opinion', style: TextStyle(fontSize: 20, color: kBlue),),
              leading: Icon(Icons.arrow_forward_ios, size: 20, color: kBlue,),
              dense: true,
              horizontalTitleGap: 0,
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            Divider(color: kBlue.withOpacity(0.5), thickness: 1,),
            ListTile(
              title: Text('Sports', style: TextStyle(fontSize: 20, color: kBlue),),
              leading: Icon(Icons.arrow_forward_ios, size: 20, color: kBlue,),
              dense: true,
              horizontalTitleGap: 0,
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            Divider(color: kBlue.withOpacity(0.5), thickness: 1,),
            ListTile(
              title: Text('Culture', style: TextStyle(fontSize: 20, color: kBlue),),
              leading: Icon(Icons.arrow_forward_ios, size: 20, color: kBlue,),
              dense: true,
              horizontalTitleGap: 0,
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            Divider(color: kBlue.withOpacity(0.5), thickness: 1,),
            ListTile(
              title: Text('More...', style: TextStyle(fontSize: 20, color: kBlue),),
              leading: Icon(Icons.arrow_forward_ios, size: 20, color: kBlue,),
              dense: true,
              horizontalTitleGap: 0,
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            Divider(color: kBlue.withOpacity(0.5), thickness: 1,),
            Spacer(),
            ListTile(
              title: Text('About this APP', style: TextStyle(fontSize: 18, color: kBlue),),
              //leading: Icon(Icons.info_outline, size: 20, color: kBlue,),
              dense: true,
              horizontalTitleGap: 0,
              onTap: () => Navigator.pushNamed(context, '/aboutScreen'),
            ),
          ],
        ),
      ),
    );
  }
}

// logo retraible
class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      
      backgroundColor: kBlue,
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.search)
        )
      ],
      expandedHeight: 210,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Column(
          children: [
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(60),
                child:  Image.asset(
                    'assets/the-guardian-logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
            ),
            Container(
              color: kYellow,
              height: 10,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

// construir lista de las noticias
class _BuildNewsList extends StatefulWidget {

  const _BuildNewsList({
    Key key,
    this.newsProvider,
  }) : super(key: key);

  final NewsProvider newsProvider;

  @override
  State<_BuildNewsList> createState() => _BuildNewsListState();
}

class _BuildNewsListState extends State<_BuildNewsList> {

  ///////// controller para Generar el scroll infinito
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ( scrollController.position.pixels == scrollController.position.maxScrollExtent ) {
        widget.newsProvider.getNews();
      }
      //print(scrollController.position.pixels);
      //print(scrollController.position.maxScrollExtent);
    });
  }
  @override
  void dispose(){
    super.dispose();
  }
  ///////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      controller: scrollController,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      slivers: [

        //appbar retraible
        _CustomAppBar(),

        //widgets y lista de noticias
        SliverList(
          delegate: SliverChildListDelegate([
            ListView.builder(
              addAutomaticKeepAlives: true,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.newsProvider.newsResultList.length,
              itemBuilder: (BuildContext context, int index) {                
                return BuildHomeCards(news: widget.newsProvider.newsResultList[index],);
              },        
            ),    
          ])
        )
      ],
    );
  }
}

