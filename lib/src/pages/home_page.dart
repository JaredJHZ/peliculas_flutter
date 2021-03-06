import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {


  PeliculasProvider peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Movies'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.search) ,
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
          ],
        ) ,
      )
    );
  }


  Widget _swiperTarjetas() {
    
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot <List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            peliculas: snapshot.data,
          );          
        }else {
          return Container(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

      },
    );
  }

  Widget _footer(BuildContext context) {
      return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead  )
          ),
          SizedBox(height: 5.0),

          StreamBuilder(
            stream:peliculasProvider.popularesStream ,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              
              if ( snapshot.hasData ) {
                return MovieHorizontal( 
                  peliculas: snapshot.data,
                  siguientePagina: this.peliculasProvider.getPopulares,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

        ],
      ),
    );
  }
}
