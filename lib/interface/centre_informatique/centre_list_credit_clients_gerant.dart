// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, must_be_immutable, use_key_in_widget_constructors, avoid_function_literals_in_foreach_calls

import 'package:deogracias/interface/centre_informatique/stream_credit_employe_centre_gerant.dart';
import 'package:deogracias/interface/drawer_gerant.dart';
import 'package:deogracias/modele/credits_vente.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/serac.dart';

class CentreListCreditsClientsGerant extends StatelessWidget {
  CentreListCreditsClientsGerant({key});

  String _search_value = "";
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _list_credits = Provider.of<List<VenteACreditsCentre>>(context);
    final _search_provider = Provider.of<Search>(context);
    affiche = _search_provider.val;
    !affiche
        ? _search_value = ""
        : _search_value = _search_provider.searchvalue;
    final user = Provider.of<donnesUtilisateur>(context);
    int nombre = 0;

    if (_list_credits.isEmpty) {
      return Scaffold(
        drawer: DrawerGerant(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "crédits des clients",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          backgroundColor: Colors.white,
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
                "crédits des clients",
                style: GoogleFonts.alike(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context)
            .size
            .height, //MediaQuery.of(context).size.height,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: ((context, index) {
              VenteACreditsCentre _donnes = _list_credits[index];
              return !affiche
                  ? ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    StreamCreditEmployeCentreGerant(
                                      credit_uid: _donnes.uid,
                                      user_uid: _donnes.uid,
                                    ))));
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlue.shade900,
                        child: Text(
                          _donnes.nom_client.substring(0, 1).toUpperCase(),
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        _donnes.nom_client,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.alike(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Enregistré le  : " +
                            _donnes.created_at +
                            " à " +
                            _donnes.created_at_heure,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                      ),
                    )
                  : _donnes.nom_client
                          .toLowerCase()
                          .contains(_search_value.toLowerCase())
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        StreamCreditEmployeCentreGerant(
                                            credit_uid: _donnes.uid,
                                            user_uid: _donnes.user_uid))));
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.lightBlue.shade900,
                            child: Text(
                              _donnes.nom_client.substring(0, 1).toUpperCase(),
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            _donnes.nom_client,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.alike(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Enregistré le  : " +
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
            itemCount: _list_credits.length),
      ),
    );
  }
}
