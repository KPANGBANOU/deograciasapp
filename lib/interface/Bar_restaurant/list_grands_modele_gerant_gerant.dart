// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, must_be_immutable, prefer_final_fields, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, unnecessary_null_comparison, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/bierre_grand_model.dart';
import '../../provider/serac.dart';
import '../drawer_gerant.dart';
import 'stream_stock_physique_grand_modele_gerant.dart';

class ListGrandModeleGerant extends StatelessWidget {
  ListGrandModeleGerant({key}) : super(key: key);

  String _search_value = "";
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _bierre_grand_modele =
        Provider.of<List<donnesBierresGrandModel>>(context);
    final _search_provider = Provider.of<Search>(context);
    affiche = _search_provider.val;
    !affiche
        ? _search_value = ""
        : _search_value = _search_provider.searchvalue;
    if (_bierre_grand_modele.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.4,
          centerTitle: true,
          title: Text(
            "Grand modèles",
            style: GoogleFonts.alike(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        drawer: DrawerGerant(),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.cyan,
          ),
        ),
      );
    }

    return Scaffold(
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
                  "Grands modèles",
                  style: GoogleFonts.alike(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        drawer: DrawerGerant(),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: _bierre_grand_modele.length,
              itemBuilder: ((context, index) {
                donnesBierresGrandModel _donnes = _bierre_grand_modele[index];

                return !affiche
                    ? ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      StreamStockPhysiqueGrandModeleGerant(
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
                        trailing: IconButton(
                            onPressed: (() {
                              _showMyDialog(context, _donnes.nom, _donnes.uid);
                            }),
                            icon: Icon(
                              Icons.delete,
                              color: Colors.black,
                            )),
                        title: Text(
                          _donnes.nom,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
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
                                          StreamStockPhysiqueGrandModeleGerant(
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
                            trailing: IconButton(
                                onPressed: (() {
                                  _showMyDialog(
                                      context, _donnes.nom, _donnes.uid);
                                }),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                )),
                            title: Text(
                              _donnes.nom,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.alike(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Container();
              })),
        ));
  }
}

Future<void> _showMyDialog(
    BuildContext context, String produit_nom, String produit_uid) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("Etes vous sur ?".toUpperCase()),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Vous etes sur le point de supprimer le produit  " +
                  produit_nom.toLowerCase() +
                  " de la base de données de cette entreprise"),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo, textStyle: TextStyle()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Confirmer'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      try {
                        _speak("Veuillez patienter");
                        await FirebaseFirestore.instance
                            .collection("bierres_petit_modele")
                            .doc(produit_uid)
                            .delete();

                        _speak("La bièrre " +
                            produit_nom +
                            " a été supprimé avec succèes ");

                        // ignore: empty_catches
                      } catch (e) {
                        _speak("Une erreur inattendue s'est produite ");
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(.7),
                        textStyle: TextStyle()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Annuler'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () {
                      _speak("Suppression de la bièrre annulée");
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      );
    },
  );
}

Future _speak(String text) async {
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}
