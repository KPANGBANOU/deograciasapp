// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, prefer_final_fields, unused_field, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../modele/pertes_centre.dart';
import '../provider/serac.dart';
import 'centre_informatique/drawer_admin_centre.dart';
import 'stream_pertes_centre.dart';

class ListPertesCentre extends StatelessWidget {
  ListPertesCentre({key});

  String _search_value = "";
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _list_depenses = Provider.of<List<pertesCentre>>(context);
    final _search_provider = Provider.of<Search>(context);

    affiche = _search_provider.val;
    !affiche
        ? _search_value = ""
        : _search_value = _search_provider.searchvalue;

    if (_list_depenses.isEmpty) {
      return Scaffold(
        drawer: DrawerAdminCentre(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Pertes du centre",
            style: GoogleFonts.alike(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      drawer: DrawerAdminCentre(),
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
                "Pertes du centre",
                style: GoogleFonts.alike(
                    fontSize: 17,
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
              pertesCentre _donnes = _list_depenses[index];
              return !affiche
                  ? ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => StreamPerteCentre(
                                      perte_uid: _donnes.uid,
                                      user_uid: _donnes.user_uid,
                                    ))));
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlue.shade900,
                        child: Text(
                          "DG",
                          style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        _donnes.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.alike(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Enrégistré le " +
                            _donnes.created_at +
                            " à " +
                            _donnes.created_at_heure,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                      ),
                    )
                  : _donnes.description
                          .toString()
                          .toLowerCase()
                          .contains(_search_value.toLowerCase())
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => StreamPerteCentre(
                                          perte_uid: _donnes.uid,
                                          user_uid: _donnes.user_uid,
                                        ))));
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.lightBlue.shade900,
                            child: Text(
                              "DG",
                              style: GoogleFonts.alike(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            _donnes.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.alike(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Enrégistré le " +
                                _donnes.created_at +
                                " à " +
                                _donnes.created_at_heure,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                GoogleFonts.alike(fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container();
            }),
            itemCount: _list_depenses.length),
      ),
    );
  }
}
