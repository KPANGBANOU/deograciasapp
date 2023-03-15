// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_final_fields, unused_field, must_be_immutable, use_key_in_widget_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/serigraphie.dart';
import '../../provider/serac.dart';
import '../drawer_gerant.dart';
import 'stream_liquidite_tee_shirt_gerant.dart';

class CentreListTeeShirtGerant extends StatelessWidget {
  CentreListTeeShirtGerant({key});

  String _search_value = "";
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _list_tee_shirts = Provider.of<List<serigraphie>>(context);
    final _search_provider = Provider.of<Search>(context);
    affiche = _search_provider.val;

    !affiche
        ? _search_value = ""
        : _search_value = _search_provider.searchvalue;

    if (_list_tee_shirts.isEmpty) {
      return Scaffold(
        drawer: DrawerGerant(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0.4,
          backgroundColor: Colors.white,
          title: Text(
            "Liste des tee shirts",
            style: GoogleFonts.lato(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      drawer: DrawerGerant(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: (() {
                _search_provider.afficher();
              }),
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 20,
              ))
        ],
        centerTitle: true,
        elevation: 0.4,
        backgroundColor: Colors.white,
        title: affiche
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15,
                ),
                child: TextField(
                  onChanged: (value) {
                    _search_provider.rechercher(value);
                  },
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Recherchez ...",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true),
                ),
              )
            : Text(
                "Liste de tee shirts",
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: ((context, index) {
              serigraphie _donnes = _list_tee_shirts[index];
              return !affiche
                  ? ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    StreamLiquiditeTeeShirtGerant(
                                        tee_shirt_uid: _donnes.uid))));
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Text(
                          _donnes.tee_shirt_nom.substring(0, 1).toUpperCase() +
                              _donnes.tee_shirt_nom
                                  .substring(13, 14)
                                  .toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        _donnes.tee_shirt_nom,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("stock physique: " +
                          _donnes.quantite_physique.toString()),
                    )
                  : _donnes.tee_shirt_nom
                          .toString()
                          .toLowerCase()
                          .contains(_search_value.toLowerCase())
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        StreamLiquiditeTeeShirtGerant(
                                            tee_shirt_uid: _donnes.uid))));
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo,
                            child: Text(
                              _donnes.tee_shirt_nom
                                      .substring(0, 1)
                                      .toUpperCase() +
                                  _donnes.tee_shirt_nom
                                      .substring(13, 14)
                                      .toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            _donnes.tee_shirt_nom,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text("Stock physique: " +
                              _donnes.quantite_physique.toString()),
                        )
                      : Container();
            }),
            itemCount: _list_tee_shirts.length),
      ),
    );
  }
}
