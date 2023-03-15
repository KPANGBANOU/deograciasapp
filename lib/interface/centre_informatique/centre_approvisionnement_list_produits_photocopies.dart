// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, avoid_print, prefer_final_fields, unused_field, must_be_immutable, use_key_in_widget_constructors

import 'package:deogracias/interface/centre_informatique/drawer_admin_centre.dart';
import 'package:deogracias/interface/centre_informatique/stream_approvisionner_produit_photocopie.dart';
import 'package:deogracias/modele/photocopie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/serac.dart';

class CentreApprovisionnerListProduitsPhotocopies extends StatelessWidget {
  CentreApprovisionnerListProduitsPhotocopies({key});

  String _search_value = "";
  bool afficche = false;

  @override
  Widget build(BuildContext context) {
    final _list_products = Provider.of<List<Photocopies>>(context);
    final _sear_provider = Provider.of<Search>(context);
    afficche = _sear_provider.val;
    !afficche ? _search_value = "" : _search_value = _sear_provider.searchvalue;

    if (_list_products.isEmpty) {
      return Scaffold(
        drawer: DrawerAdminCentre(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Photocopies",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
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
                "Photocopies",
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
            Photocopies _donnes = _list_products[index];

            return !afficche
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  StreamApprovisionnerProduitPhotocopi(
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
                      style: GoogleFonts.alike(fontWeight: FontWeight.bold),
                    ),
                  )
                : _donnes.nom
                        .toString()
                        .toLowerCase()
                        .contains(_search_value.toLowerCase())
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      StreamApprovisionnerProduitPhotocopi(
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
                          "stock physique : " +
                              _donnes.quantite_physique.toString(),
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
