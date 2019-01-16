import 'package:flutter/material.dart';
void main() {
  runApp(new MaterialApp(
    home: new Search(),
  ));
}
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Search"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){
            showSearch(context: context, delegate: DataSearch() );
          })
        ],
      ),
      drawer: Drawer(),
    );
  }
}
class DataSearch extends SearchDelegate<String>{
  final categories= [
    "Women Clothing",
    "Men Clothing",
    "Children",
    "Women Footwear",
    "Men Footwear",
    "Winter Wear",
    "Accessories"
  ];
  final recent=[
    "Women Clothing",
    "Men Clothing",
    "Kids",
    "Women Footwear",
    "Men Footwear",
    "Winter Wear",
    "Accessories"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query="";
    })];
     //AppBAr
  }

  @override
  Widget buildLeading(BuildContext context) {
   return IconButton(
     icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
         progress: transitionAnimation,
     ),
       onPressed: (){
       close(context,null);
       });

    //Leading Icon on left
  }

  @override
  Widget buildResults(BuildContext context) {
    //show results
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //search suggestions
    final suggestion= query.isEmpty
        ? recent
        : categories.where((p) => p.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context,index)=>ListTile(
      leading: Icon(Icons.location_city),
      title: RichText(
          text: TextSpan(
            text: suggestion[index].substring(0,query.length),
            style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestion[index].substring(query.length),
                style: TextStyle(color: Colors.grey))
        ]),
      ),
      ),
      itemCount: suggestion.length,
      );
  }
  }