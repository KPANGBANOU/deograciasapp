// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, must_be_immutable, prefer_final_fields, unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/credit.dart';
import '../../provider/serac.dart';
import 'bar_stream_vente_credit.dart';
import 'drawer_servant.dart';

class BarVenteListCredits extends StatelessWidget {
  BarVenteListCredits({key});

  String _search_value = "";
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _list_credits = Provider.of<List<credit>>(context);
    final _search_provider = Provider.of<Search>(context);
    affiche = _search_provider.val;
    !affiche
        ? _search_value = ""
        : _search_value = _search_provider.searchvalue;
    if (_list_credits.isEmpty) {
      return Scaffold(
        drawer: servantdrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Crédits",
            style: GoogleFonts.alike(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.cyan,
          ),
        ),
      );
    }

    return Scaffold(
      drawer: servantdrawer(),
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
                "Crédits",
                style: GoogleFonts.alike(
                  fontSize: 17,
                  color: Colors.black,
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
              credit _donnes = _list_credits[index];
              return !affiche
                  ? ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => StreamVenteCreditBar(
                                    montant_disponible:
                                        _donnes.montant_disponible,
                                    credit_uid: _donnes.uid))));
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
                        _donnes.nom.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.alike(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "stock physique " +
                            _donnes.montant_disponible.toString() +
                            " F",
                        style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                      ),
                    )
                  : _donnes.nom
                          .toLowerCase()
                          .contains(_search_value.toLowerCase())
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => StreamVenteCreditBar(
                                        montant_disponible:
                                            _donnes.montant_disponible,
                                        credit_uid: _donnes.uid))));
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
                            _donnes.nom.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.alike(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "stock physique " +
                                _donnes.montant_disponible.toString() +
                                " F",
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
