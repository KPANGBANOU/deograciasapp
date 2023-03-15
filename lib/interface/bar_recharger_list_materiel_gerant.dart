// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_final_fields, unused_field, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../modele/materiel_bar.dart';
import '../provider/serac.dart';
import 'centre_informatique/stream_recharger_materiel_bar_gerant.dart';
import 'drawer_gerant.dart';

class BarRechargementListMaterielGerant extends StatelessWidget {
  BarRechargementListMaterielGerant({key});

  String _searc_value = "";
  String value = "";
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _list_materiaux = Provider.of<List<materielBar>>(context);
    final _search = Provider.of<Search>(context);
    affiche = _search.val;
    !affiche ? _searc_value = "" : _searc_value = _search.searchvalue;

    if (_list_materiaux.isEmpty) {
      return Scaffold(
        drawer: DrawerGerant(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          // ignore: prefer_const_literals_to_create_immutables

          centerTitle: true,
          elevation: 0.4,
          backgroundColor: Colors.white,
          title: Text(
            "Matériaux du restaurant",
            style: GoogleFonts.lato(
                color: Colors.black, fontWeight: FontWeight.bold),
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
                  _search.afficher();
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
                      _search.rechercher(value);
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
                  "Materiaux du restaurant",
                  style: GoogleFonts.lato(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: ((context, index) {
                materielBar _donnes = _list_materiaux[index];

                return !affiche
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      StreamRechargerMaterielBarGerant(
                                          materiel_uid: _donnes.uid))));
                        },
                        title: Text(
                          _donnes.nom,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("Le  nombre  en bon état : " +
                            _donnes.nombre_bon_etat.toString()),
                      )
                    : _donnes.nom
                            .toString()
                            .toLowerCase()
                            .contains(_searc_value.toLowerCase())
                        ? ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          StreamRechargerMaterielBarGerant(
                                              materiel_uid: _donnes.uid))));
                            },
                            title: Text(
                              _donnes.nom,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("Le nombre en bon état est: " +
                                _donnes.nombre_bon_etat.toString()),
                          )
                        : Container();
              }),
              itemCount: _list_materiaux.length),
        ));
  }
}
