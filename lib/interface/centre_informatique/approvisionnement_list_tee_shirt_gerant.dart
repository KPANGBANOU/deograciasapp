// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_final_fields, unused_field, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/serigraphie.dart';
import '../../provider/serac.dart';
import '../drawer_gerant.dart';
import 'streamapprovisionnementteeshirtgerant.dart';

class CentreRechargementListTeeShirtGerant extends StatelessWidget {
  CentreRechargementListTeeShirtGerant({key});

  String _searc_value = "";
  String value = "";
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _list_tee_shirts = Provider.of<List<serigraphie>>(context);
    final _search = Provider.of<Search>(context);
    affiche = _search.val;
    !affiche ? _searc_value = "" : _searc_value = _search.searchvalue;

    if (_list_tee_shirts.isEmpty) {
      return Scaffold(
        drawer: DrawerGerant(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          // ignore: prefer_const_literals_to_create_immutables

          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Tee shirt",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
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
          elevation: 0,
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
                  "Tee shirt",
                  style: GoogleFonts.alike(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
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
                                      StreamApprovisionnerTeeShirtGerant(
                                          tee_shirt_uid: _donnes.uid))));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Text(
                            _donnes.tee_shirt_nom
                                    .substring(0, 1)
                                    .toUpperCase() +
                                _donnes.tee_shirt_nom
                                    .substring(13, 14)
                                    .toUpperCase(),
                            style: GoogleFonts.alike(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          _donnes.tee_shirt_nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("Stock physique: " +
                            _donnes.quantite_physique.toString()),
                      )
                    : _donnes.tee_shirt_nom
                            .toString()
                            .toLowerCase()
                            .contains(_searc_value.toLowerCase())
                        ? ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          StreamApprovisionnerTeeShirtGerant(
                                              tee_shirt_uid: _donnes.uid))));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.lightBlue.shade900,
                              child: Text(
                                _donnes.tee_shirt_nom
                                        .substring(0, 1)
                                        .toUpperCase() +
                                    _donnes.tee_shirt_nom
                                        .substring(13, 14)
                                        .toUpperCase(),
                                style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              _donnes.tee_shirt_nom.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.alike(
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
        ));
  }
}
