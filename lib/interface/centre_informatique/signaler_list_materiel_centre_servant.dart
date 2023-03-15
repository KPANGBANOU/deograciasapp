// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_final_fields, unused_field, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/matriel_centre.dart';
import '../../provider/serac.dart';
import 'centre_servant_drawer.dart';
import 'stream_signaler_materiel_centre_servant.dart';

class CentreSignalerListMaterielServant extends StatelessWidget {
  CentreSignalerListMaterielServant({key});

  String _searc_value = "";
  String value = "";
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _list_materiaux = Provider.of<List<materielCentre>>(context);
    final _search = Provider.of<Search>(context);
    affiche = _search.val;
    !affiche ? _searc_value = "" : _searc_value = _search.searchvalue;

    if (_list_materiaux.isEmpty) {
      return Scaffold(
        drawer: CentreServantdrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          // ignore: prefer_const_literals_to_create_immutables

          centerTitle: true,
          elevation: 0.2,
          backgroundColor: Colors.white,
          title: Text(
            "Matériels du centre",
            style: GoogleFonts.alike(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.cyan,
          ),
        ),
      );
    }

    return Scaffold(
        drawer: CentreServantdrawer(),
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
                  "Materiels du centre",
                  style: GoogleFonts.alike(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: ((context, index) {
                materielCentre _donnes = _list_materiaux[index];

                return !affiche
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      StreamSignalerMaterielCentreServant(
                                          materiel_uid: _donnes.uid))));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            _donnes.nom.substring(0, 1).toUpperCase(),
                            style: GoogleFonts.alike(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          _donnes.nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Le  nombre  en bon état : " +
                              _donnes.nombre_bon_etat.toString(),
                          style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                        ),
                      )
                    : _donnes.nom
                            .toLowerCase()
                            .contains(_searc_value.toLowerCase())
                        ? ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          StreamSignalerMaterielCentreServant(
                                              materiel_uid: _donnes.uid))));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.lightBlue.shade900,
                              child: Text(
                                _donnes.nom.substring(0, 1).toUpperCase(),
                                style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              _donnes.nom,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.alike(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Le  nombre  en bon état : " +
                                  _donnes.nombre_bon_etat.toString(),
                              style: GoogleFonts.alike(
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Container();
              }),
              itemCount: _list_materiaux.length),
        ));
  }
}
