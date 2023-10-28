import 'package:flutter/material.dart';
import 'package:flutter_application_4/config/approute.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
      leadingWidth: 40,
        title: Text('Home'),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.person,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            alignment: Alignment.center,
            child: ListTile(
              onTap: () => Navigator.pushNamed(context, AppRoute.airingRoute),
              title: Text(
                'AiringMovie',
              ),
              leading: Icon(
                Icons.movie,
                color: Colors.amber,
              ),
              trailing: Icon(
                Icons.navigate_next,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 120,
            child: ListTile(
              onTap: () => Navigator.pushNamed(context, AppRoute.popularRoute),
              title: Text('PoppularMovie'),
              leading: Icon(
                Icons.movie,
                color: Colors.red,
              ),
              trailing: Icon(Icons.navigate_next),
            ),
          )
        ],
      ),
    );
  }
}
