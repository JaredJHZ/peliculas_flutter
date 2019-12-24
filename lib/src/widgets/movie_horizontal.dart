import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  final Function siguientePagina;

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  MovieHorizontal({@required this.peliculas , @required this.siguientePagina});

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent ) {
        print("siguientes peliculas");
        siguientePagina();
      }
    });

    
    return Container(
      height: _screenSize.height * 0.20,
      child: PageView(
        controller: _pageController,
        children: _tarjetas(context),
        pageSnapping: false,
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map(
      (pelicula) {
        return Container(
          margin: EdgeInsets.only(right: 15.0),
          child: Column(
            children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage( pelicula.getPosterImg() ),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 140.0,
              ),
            ),
            SizedBox(height: 5.0,),
             Text(pelicula.title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption,),
            ]
          ),
        );
      }
    ).toList();
  }
}