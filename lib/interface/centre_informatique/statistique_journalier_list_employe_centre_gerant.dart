// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_field, non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, must_be_immutable, prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/serac.dart';
import '../../services/user_centre.dart';
import '../drawer_gerant.dart';
import 'stream_satistique_journalier_employe_centre_gerant.dart';

class StatistiqueJournalierListEmployeCentreGerant extends StatelessWidget {
  StatistiqueJournalierListEmployeCentreGerant({key}) : super(key: key);
  String _search_value = "";
  bool affiche = false;
  int nombre = 0;
  @override
  Widget build(BuildContext context) {
    final _list_servants = Provider.of<List<userCentre>>(context);
    final _search_provider = Provider.of<Search>(context);
    affiche = _search_provider.val;
    !affiche
        ? _search_value = ""
        : _search_value = _search_provider.searchvalue;
    _list_servants.forEach((element) {
      if (!element.admin && !element.deleted && element.role != "Gerant") {
        nombre++;
      }
    });
    // ignore: curly_braces_in_flow_control_structures
    if (_list_servants.isEmpty || nombre <= 0)
      // ignore: curly_braces_in_flow_control_structures
      return Scaffold(
        drawer: DrawerGerant(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "vente journalière du centre",
            style: GoogleFonts.lato(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0.4,
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.cyan,
          ),
        ),
      );
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
        elevation: 0.2,
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
                "vente journalière du centre",
                style: GoogleFonts.lato(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: _list_servants.length,
            itemBuilder: ((context, index) {
              userCentre _donnes = _list_servants[index];
              return !affiche
                  ? !_donnes.admin && _donnes.role != "Gerant"
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        StreamStatistiqueJournalierEmployeCentreGerant(
                                            uid: _donnes.uid))));
                          },
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.indigo,
                            child: ClipOval(
                              child: _donnes.photo_url.isEmpty
                                  ? _donnes.sexe == "Masculin"
                                      ? Image.asset(
                                          "images/homme.png",
                                          width: 50,
                                          height: 50,
                                          scale: 2.5,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          "images/homme.png",
                                          width: 50,
                                          height: 50,
                                          scale: 2.5,
                                          fit: BoxFit.cover,
                                        )
                                  : Image.network(
                                      _donnes.photo_url,
                                      width: 50,
                                      height: 50,
                                      scale: 2.5,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          title: Text(
                            _donnes.prenom.toString() +
                                " " +
                                _donnes.nom.toString().toUpperCase(),
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "A créé son compte le " + _donnes.date_inscription,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Container()
                  : _donnes.nom
                              .toString()
                              .toLowerCase()
                              .contains(_search_value.toLowerCase()) ||
                          _donnes.prenom
                              .toString()
                              .toLowerCase()
                              .contains(_search_value.toLowerCase())
                      ? !_donnes.admin && _donnes.role != "Gerant"
                          ? ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            StreamStatistiqueJournalierEmployeCentreGerant(
                                                uid: _donnes.uid))));
                              },
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.indigo,
                                child: ClipOval(
                                  child: _donnes.photo_url.isEmpty
                                      ? _donnes.sexe == "Masculin"
                                          ? Image.asset(
                                              "images/homme.png",
                                              width: 50,
                                              height: 50,
                                              scale: 2.5,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              "images/homme.png",
                                              width: 50,
                                              height: 50,
                                              scale: 2.5,
                                              fit: BoxFit.cover,
                                            )
                                      : Image.network(
                                          _donnes.photo_url,
                                          width: 50,
                                          height: 50,
                                          scale: 2.5,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              title: Text(
                                _donnes.prenom.toString() +
                                    " " +
                                    _donnes.nom.toString().toUpperCase(),
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "A créé son compte le " +
                                    _donnes.date_inscription,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Container()
                      : Container();
            })),
      ),
    );
  }
}
