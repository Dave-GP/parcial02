import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotifyclone/paginas/albumimage.dart';
import 'package:spotifyclone/paginas/albumpagina.dart';

import '../constantes/const.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int activoMenu1 = 0;
  int activoMenu2 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      appBar: AppBar(
        title: mostrarAppBar(),
      ),
     
      body: bodyAppSpf(),
      //: mostrarAppBar(),
    );
  }

  Widget mostrarAppBar() {
    return AppBar(
      
      
      backgroundColor: Color.fromARGB(183, 255, 1, 1),
      elevation: 0,
      title: Padding(
        
        padding: const EdgeInsets.only(left: 10, bottom:20, top: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Comercial SIVAR",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 250, 248, 248),
                  fontWeight: FontWeight.bold),
            ),
            
            Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/muebles.jpg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    ),
    
          ],
        ),
      ),
      
    );
  }



  Widget bodyAppSpf() {
    return SingleChildScrollView(
      
      
      
      
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                //crossAxisAlignment: CrossAxisAlignment.start,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  
                  child: Row(
                      children: List.generate(lista.length, (index) {
                        
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        //Bar para las categorias
                        onTap: () {
                           Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPagina(
                                song: songs[index],
                                asset: songs[index],
                              ),
                              type: PageTransitionType.scale));
                          setState(() {
                            activoMenu1 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              
                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight:  Radius.circular(10)),
          border: Border.all(width: 3,color: Color.fromARGB(255, 241, 122, 122),style: BorderStyle.solid)),
                           
                              child: Text(
                                lista[index],
                                style: TextStyle(
                                    //color: Colors.grey,
                                    
                                    fontSize: 20,
                                    color: activoMenu1 == index
                                        ? Color.fromARGB(211, 247, 190, 190)
                                        : Color.fromARGB(255, 255, 255, 255),
                                        backgroundColor: Color.fromARGB(255, 241, 122, 122),
                                        
                                    fontWeight: FontWeight.w600),
                              ),
                            ),

                            
                            SizedBox(
                              height: 3,
                            ),
                            activoMenu1 == index
                                ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(146, 255, 1, 1),
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
            ],
          ),
           
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                  children: List.generate(songs.length - 5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumImage(
                                song: songs[index],
                                

                              ),
                              type: PageTransitionType.scale));
                      /*AlbumPagina;*/
                      //Navigator.push(context, MaterialPageRoute(context)=>AlbumPagina());
                      // Navigator.push(context, PageTransition(child:))
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 160,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(songs[index]['img']),
                                  fit: BoxFit.cover),
                              color: Color.fromARGB(255, 254, 254, 255),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          songs[index]['title'],
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            songs[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 10,
          ),

         
          SizedBox(
            height: 20,
          ),

              /*    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                          
                          child: Text("Paisajes",style: TextStyle(height: 5, fontSize: 25,color: Color.fromARGB(255, 94, 101, 163)),
                          ),
                        ),
                  ),*/
//segundo bloque

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                  children: List.generate(songs.length - 5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: AlbumPagina(
                                song: songs[index + 5],
                              ),
                              type: PageTransitionType.scale));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(songs[index + 5]['img']),
                                  fit: BoxFit.cover),
                              color: Color.fromARGB(255, 2, 6, 247),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          songs[index + 5]['title'],
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            songs[index + 5]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          
          //tercer bloque
            
           SizedBox(
            height: 50,
          ),
        ],
      ),
    );

    
  }
}
