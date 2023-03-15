// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, avoid_print, prefer_final_fields, unused_field, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/produit.dart';
import '../../provider/serac.dart';
import 'drawer_admin_centre.dart';
import 'stream_approvisionner_produit.dart';

class CentreApprovisionnerListProduits extends StatelessWidget {
  CentreApprovisionnerListProduits({key});

  String _search_value = "";
  bool afficche = false;

  @override
  Widget build(BuildContext context) {
    final _list_products = Provider.of<List<products>>(context);
    final _sear_provider = Provider.of<Search>(context);
    afficche = _sear_provider.val;
    !afficche ? _search_value = "" : _search_value = _sear_provider.searchvalue;

    if (_list_products.isEmpty) {
      return Scaffold(
        drawer: DrawerAdminCentre(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Produits",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
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
      drawer: DrawerAdminCentre(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: (() {
                _sear_provider.afficher();
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
        title: afficche
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15,
                ),
                child: TextField(
                  onChanged: (value) {
                    _sear_provider.rechercher(value);
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
                "Produits",
                style: GoogleFonts.alike(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: _list_products.length,
          itemBuilder: ((context, index) {
            products _donnes = _list_products[index];

            return !afficche
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  StreamApprovisionnerProduit(
                                      produit_uid: _donnes.uid))));
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
                      "Stock physique : " +
                          _donnes.quantite_physique.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                                  builder: ((context) =>
                                      StreamApprovisionnerProduit(
                                          produit_uid: _donnes.uid))));
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
                          "Stock physique : " +
                              _donnes.quantite_physique.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container();
          }),
        ),
      ),
    );
  }
}
