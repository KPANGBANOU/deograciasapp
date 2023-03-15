// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, use_build_context_synchronously, must_be_immutable, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../modele/materiel_bar.dart';
import '../provider/serac.dart';
import 'centre_informatique/stream_info_materiel_bar_gerant.dart';
import 'drawer_gerant.dart';

class BarListMateriauxGerant extends StatelessWidget {
  BarListMateriauxGerant({key});
  bool affiche = false;
  String search_value = "";

  @override
  Widget build(BuildContext context) {
    final _list_produits = Provider.of<List<materielBar>>(context);
    final _search_provider = Provider.of<Search>(context);

    affiche = _search_provider.val;

    !affiche ? search_value = "" : search_value = _search_provider.searchvalue;

    if (_list_produits.isEmpty) {
      return Scaffold(
        drawer: DrawerGerant(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Materiaux du restaurant",
            style: GoogleFonts.alike(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
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
                "Matériaux du restaurant",
                style: GoogleFonts.alike(
                    color: Colors.black,
                    fontSize: 17,
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
              materielBar _donnes = _list_produits[index];
              return !affiche
                  ? ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    StreamInfoMaterielBarGerant(
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
                          .contains(search_value.toLowerCase())
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        StreamInfoMaterielBarGerant(
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
            }),
            itemCount: _list_produits.length),
      ),
    );
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
              Text("Vous etes sur le point de supprimer le matériel  " +
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
                        await FirebaseFirestore.instance
                            .collection("materiaux_bar")
                            .doc(produit_uid)
                            .delete();

                        _speak("Le matériel a été supprimé avec succès");

                        // ignore: empty_catches
                      } catch (e) {}
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
                      _speak("Suppression du matériel annulée");
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
