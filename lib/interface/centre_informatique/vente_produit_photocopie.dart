// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, unnecessary_null_comparison, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, must_be_immutable, unused_field, prefer_final_fields, non_constant_identifier_names, use_key_in_widget_constructors, unused_element,

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deogracias/interface/centre_informatique/centre_servant_drawer.dart';
import 'package:deogracias/interface/centre_informatique/facture_de_vente_produit_photocopie_admin.dart';
import 'package:deogracias/modele/photocopie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/budget_centre.dart';
import '../../provider/pr_ovider_gestion_gerant.dart';
import '../../services/user.dart';

class VenteDeProduitPhotocopie extends StatelessWidget {
  VenteDeProduitPhotocopie({
    key,
  });

  TextEditingController _ancien_tableau = TextEditingController();
  TextEditingController _nouveau_tableau = TextEditingController();
  int ancien_tableau = 0;
  int nouveau_tableau = 0;
  bool affiche = false;
  int difference = 0;
  @override
  Widget build(BuildContext context) {
    final _produit = Provider.of<Photocopies>(context);
    final _budget_centre = Provider.of<budgetCentre>(context);
    final _donnes = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<ProviderGestionGerant>(context);
    affiche = _provider.vente_produit;

    return Scaffold(
      backgroundColor: Colors.green.shade800,
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
          _produit.nom,
          style: GoogleFonts.alike(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
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
                      image: AssetImage("images/photocopie.jfif"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Vente de produit de photocopies",
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
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Vous disposez de  " +
                    _produit.quantite_physique.toString() +
                    " unités de ce produit de photocopie en stock de l'entreprise",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 19,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ancien tableau svp",
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
                  controller: _ancien_tableau,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: GoogleFonts.lato(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nouveau tableau svp",
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
                  controller: _nouveau_tableau,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: GoogleFonts.lato(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                    onPressed: (() async {
                      _provider.put_vente_produit_true();
                      try {
                        ancien_tableau = _ancien_tableau.text.isNotEmpty
                            ? int.parse(_ancien_tableau.text)
                            : 0;
                        nouveau_tableau = _nouveau_tableau.text.isNotEmpty
                            ? int.parse(_nouveau_tableau.text)
                            : 0;
                        if (_ancien_tableau.text.isEmpty ||
                            _nouveau_tableau.text.isEmpty ||
                            nouveau_tableau <= 0) {
                          _provider.put_vente_produit_false();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Vous n'avez pas renseigné la quantité que vous voudriez vendre ou la quantité renseignée est incorrecte  ! Veuillez réessayez svp !",
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
                        } else if (nouveau_tableau < ancien_tableau) {
                          _provider.put_vente_produit_false();
                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "La valeur du nouveau tableau doit etre supérieur à celle de l'ancien tableau",
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
                          difference = nouveau_tableau - ancien_tableau;

                          if (difference > _produit.quantite_physique) {
                            _provider.put_vente_produit_false();
                            final snack = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Le stock est insuffisant.!",
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
                                .collection("vente_photocopies")
                                .add({
                              'benefice': difference *
                                  (_produit.prix_unitaire -
                                      _produit.prix_unitaire_achat),
                              'photocopie_uid': _produit.uid,
                              'user_uid': _donnes.uid,
                              "nombre": difference,
                              "montant": difference * _produit.prix_unitaire,
                              "created_at": DateTime.now()
                            });

                            await FirebaseFirestore.instance
                                .collection("budget")
                                .doc(_budget_centre.uid)
                                .update({
                              "benefice": _budget_centre.benefice +
                                  difference *
                                      (_produit.prix_unitaire -
                                          _produit.prix_unitaire_achat),
                              "solde_total": _budget_centre.solde_total +
                                  (difference * _produit.prix_unitaire),
                            });

                            await FirebaseFirestore.instance
                                .collection("photocopies")
                                .doc(_produit.uid)
                                .update({
                              'montant_vendu': _produit.montant_vendu +
                                  _produit.prix_unitaire * difference,
                              'benefice': _produit.benefice +
                                  difference *
                                      (_produit.prix_unitaire -
                                          _produit.prix_unitaire_achat),
                              "quantite_physique":
                                  _produit.quantite_physique - difference,
                              'montant_vendu_cumule':
                                  _produit.montant_vendu_cumule +
                                      _produit.prix_unitaire * difference,
                              'benefice_cumule': _produit.benefice_cumule +
                                  difference *
                                      (_produit.prix_unitaire -
                                          _produit.prix_unitaire_achat),
                              "quantite_physique_cumule":
                                  _produit.quantite_physique_cumule -
                                      difference,
                            });

                            if (_produit.quantite_physique <=
                                _produit.seuil_approvisionnement) {
                              await FirebaseFirestore.instance
                                  .collection("photocopies")
                                  .doc(_produit.uid)
                                  .update({"approvisionne": false});
                            }

                            _provider.put_vente_produit_false();

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        FactureDeVenteDeProduitPhotocopieAdmin(
                                            produit_nom: _produit.nom,
                                            produit_quantite_vendu: difference,
                                            produit_quantite_physique:
                                                _produit.quantite_physique -
                                                    difference,
                                            produit_uid: _produit.uid,
                                            montant_vente:
                                                _produit.prix_unitaire *
                                                    difference,
                                            prix_unitaire:
                                                _produit.prix_unitaire))));
                          }
                        }
                        // ignore: empty_catches
                      } catch (e) {
                        _provider.put_vente_produit_false();
                        final snack = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Une erreur intatte,ndue s'est produite pendant l'enregistrement de vente. Vérifier votreconnection internet et si le nombre saisi n'est pas à virgule et réessayez !",
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
