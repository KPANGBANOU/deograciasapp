// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, unnecessary_null_comparison, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, must_be_immutable, unused_field, prefer_final_fields, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/budget_centre.dart';
import '../../modele/serigraphie.dart';
import '../../provider/serac.dart';
import '../../services/user.dart';
import 'centre_servant_drawer.dart';
import 'facturevente_tee_shirt.dart';

class VenteTeeShirt extends StatelessWidget {
  VenteTeeShirt({
    key,
    required this.quantite_disponible,
  });

  TextEditingController _quantite = TextEditingController();
  int quantite = 0;
  bool affiche = false;
  final int quantite_disponible;

  @override
  Widget build(BuildContext context) {
    final _donnes = Provider.of<donnesUtilisateur>(context);
    final _produit = Provider.of<serigraphie>(context);
    final _budget_centre = Provider.of<budgetCentre>(context);
    final _provider = Provider.of<Search>(context);
    affiche = _provider.val;

    if (_produit == null) {
      return Scaffold(
        drawer: CentreServantdrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0.4,
          title: Text(
            _produit.tee_shirt_nom,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.green.shade900,
      drawer: CentreServantdrawer(),
      appBar: AppBar(
        actions: [
          Image.asset(
            "images/icon.jpeg",
            height: 60,
            width: 60,
            scale: 2.5,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: Text(
          _produit.tee_shirt_nom,
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/tee_shirt.jfif"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Vente de tee shirt",
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Vous disposez de  " +
                    _produit.quantite_physique.toString() +
                    " unités de ce tee shirt en stock de l'entreprise",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 19,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Quantité restante du tee shirt svp",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _quantite,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: GoogleFonts.lato(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        textStyle: TextStyle()),
                    // ignore: sort_child_properties_last
                    child: affiche
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  color: Colors.cyanAccent,
                                )),
                          )
                        : Text(
                            "Enregistrez la vente".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                    onPressed: (() async {
                      _speak("Veuillez patientre ");
                      _provider.puttrue();
                      try {
                        quantite = _quantite.text.isNotEmpty
                            ? int.parse(_quantite.text)
                            : 0;
                        if (_quantite.text.isEmpty || quantite <= 0) {
                          _provider.putfalse();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Vous n'avez pas renseigné la quantité que vous voudriez vendre ou la quantité saisie est incorrecte. Veuillez réessayez svp !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        } else {
                          if (quantite > _produit.quantite_physique) {
                            _provider.putfalse();
                            final snack = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le stock est insuffisant. Vérifiez diminuer la quantité de vente et réessayez !!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              backgroundColor: Colors.redAccent.withOpacity(.8),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(4),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                          } else {
                            await FirebaseFirestore.instance
                                .collection("vente_tee_shirts")
                                .add({
                              'benefice':
                                  (_produit.quantite_physique - quantite) *
                                      (_produit.prix_unitaire_vente -
                                          _produit.prix_unitaire_achat),
                              'produit_uid': _produit.uid,
                              'user_uid': _donnes.uid,
                              'nom': _produit.tee_shirt_nom,
                              'quantite':
                                  (_produit.quantite_physique - quantite),
                              'montant':
                                  ((_produit.quantite_physique - quantite) *
                                      _produit.prix_unitaire_vente),
                              "derniere_vente": DateTime.now()
                            });

                            await FirebaseFirestore.instance
                                .collection("budget")
                                .doc(_budget_centre.uid)
                                .update({
                              "benefice": _budget_centre.benefice +
                                  (_produit.quantite_physique - quantite) *
                                      (_produit.prix_unitaire_vente -
                                          _produit.prix_unitaire_achat),
                              "solde_total": _budget_centre.solde_total +
                                  (_produit.quantite_physique - quantite) *
                                      _produit.prix_unitaire_vente,
                            });

                            await FirebaseFirestore.instance
                                .collection("tee_shirts")
                                .doc(_produit.uid)
                                .update({
                              'montant_vendu': _produit.montant_vendu +
                                  (_produit.quantite_physique - quantite) *
                                      _produit.prix_unitaire_vente,
                              'benefice': _produit.benefice +
                                  (_produit.quantite_physique - quantite) *
                                      (_produit.prix_unitaire_vente -
                                          _produit.prix_unitaire_achat),
                              "quantite_physique": quantite,
                              'montant_vendu_cumule':
                                  _produit.montant_vendu_cumule +
                                      (_produit.quantite_physique_cumule -
                                              quantite) *
                                          _produit.prix_unitaire_vente,
                              'benefice_cumule': _produit.benefice_cumule +
                                  (_produit.quantite_physique_cumule -
                                          quantite) *
                                      (_produit.prix_unitaire_vente -
                                          _produit.prix_unitaire_achat),
                              "quantite_physique_cumule": quantite,
                            });

                            if (_produit.quantite_physique <=
                                _produit.seuil_approvisionnement) {
                              await FirebaseFirestore.instance
                                  .collection("tee_shirts")
                                  .doc(_produit.uid)
                                  .update({"approvisionne": false});
                            }

                            _provider.putfalse();
                            _speak("vente effecué avec succès");

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => FactureVenteTeeShirt(
                                        prix_unitaire:
                                            _produit.prix_unitaire_vente,
                                        produit_nom:
                                            _produit.tee_shirt_nom.toString(),
                                        produit_quantite_vendu:
                                            quantite_disponible - quantite,
                                        produit_quantite_physique: quantite,
                                        produit_uid: _produit.uid,
                                        montant_vente: (quantite_disponible -
                                                quantite) *
                                            _produit.prix_unitaire_vente))));
                          }
                        }
                        // ignore: empty_catches
                      } catch (e) {
                        _speak("Une erreur s'est produite ");
                        _provider.putfalse();
                        final snack = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Une erreur intatte,ndue s'est produite pendant l'enregistrement de vente. Vérifier votre connection internet et aussi si le nombre saisi n'est pas à virgule réessayez !",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          backgroundColor: Colors.redAccent.withOpacity(.8),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(4),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                      }
                    })),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

Future _speak(String text) async {
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}
