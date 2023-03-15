// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables, must_be_immutable, prefer_final_fields, unused_field, unused_local_variable, non_constant_identifier_names, unred_type_equality_checks, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/bierre_grand_model.dart';
import '../../modele/budgetBar.dart';
import '../../provider/serac.dart';
import '../../services/user.dart';
import 'drawer_servant.dart';
import 'facture_vente_bar.dart';

class VenteGrandModele extends StatelessWidget {
  VenteGrandModele({
    key,
    required this.quantite_disponible,
  });

  TextEditingController _quantite = TextEditingController();
  int quantite = 0;
  int montant = 0;
  String message = "";
  bool affiche = false;
  final int quantite_disponible;

  @override
  Widget build(BuildContext context) {
    final _bierre = Provider.of<donnesBierresGrandModel>(context);
    final _user = Provider.of<donnesUtilisateur>(context);
    final _budget_bar = Provider.of<BudgetBar>(context);
    final _provider = Provider.of<Search>(context);
    affiche = _provider.val;

    return Scaffold(
      drawer: servantdrawer(),
      backgroundColor: Colors.green.shade800,
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
          _bierre.nom.toLowerCase(),
          style: GoogleFonts.alike(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/bierre2.jfif"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Vente de bièrre",
              textAlign: TextAlign.center,
              style: GoogleFonts.alike(color: Colors.white, fontSize: 24),
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
                    _bierre.quantite_physique.toString() +
                    " unités de cette bièrre en stock de l'entreprise",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 19,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Quantité restante de la bièrre svp",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _quantite,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    hintStyle: GoogleFonts.lato(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
              child: SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87, textStyle: TextStyle()),
                  onPressed: (() async {
                    _provider.puttrue();
                    quantite = _quantite.text.isNotEmpty
                        ? int.parse(_quantite.text)
                        : 0;
                    montant = (_bierre.quantite_physique - quantite) *
                        _bierre.prix_unitaire;

                    try {
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
                        if (quantite <= _bierre.quantite_physique) {
                          await FirebaseFirestore.instance
                              .collection("ventes_grand_modele")
                              .add({
                            'benefice': (_bierre.quantite_physique - quantite) *
                                (_bierre.prix_unitaire -
                                    _bierre.prix_unitaire_achat),
                            'produit_uid': _bierre.uid,
                            'user_uid': _user.uid,
                            'user_nom': _user.nom,
                            'user_prenom': _user.prenom,
                            'nom_bierre': _bierre.nom,
                            'type': "Grand modèle",
                            'quantite': _bierre.quantite_physique - quantite,
                            'montant': (_bierre.quantite_physique - quantite) *
                                _bierre.prix_unitaire,
                            'time': DateTime.now(),
                          });
                          await FirebaseFirestore.instance
                              .collection("budget")
                              .doc(_budget_bar.uid)
                              .update({
                            'benefice': _budget_bar.benefice +
                                (_bierre.quantite_physique - quantite) *
                                    (_bierre.prix_unitaire -
                                        _bierre.prix_unitaire_achat),
                            'solde_total': _budget_bar.solde_total + montant,
                          });

                          await FirebaseFirestore.instance
                              .collection("bierres_grand_modele")
                              .doc(_bierre.uid)
                              .update({
                            'benefice': _bierre.benefice +
                                (_bierre.quantite_physique - quantite) *
                                    (_bierre.prix_unitaire -
                                        _bierre.prix_unitaire_achat),
                            'montant_vendu': _bierre.montant_vendu + montant,
                            'benefice_cumule': _bierre.benefice_cumule +
                                (_bierre.quantite_physique_cumule - quantite) *
                                    (_bierre.prix_unitaire -
                                        _bierre.prix_unitaire_achat),
                            'montant_vendu_cumule':
                                _bierre.montant_cumule + montant,
                            'quantite_physique_cumule': quantite,
                            'quantite_physique': quantite,
                          });

                          if (_bierre.quantite_physique <=
                              _bierre.seuil_approvisionnement) {
                            await FirebaseFirestore.instance
                                .collection("bierres_grand_modele")
                                .doc(_bierre.uid)
                                .update({"approvisionne": false});
                          }

                          _provider.putfalse();

                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => FactureVenteBar(
                                      produit_nom: _bierre.nom,
                                      produit_quantite_vendu:
                                          quantite_disponible - quantite,
                                      produit_quantite_physique: quantite,
                                      produit_uid: _bierre.uid,
                                      montant_vente:
                                          (quantite_disponible - quantite) *
                                              _bierre.prix_unitaire,
                                      prix_unitaire: _bierre.prix_unitaire))));
                        } else {
                          _provider.putfalse();

                          message = "Désolé !  Le stock de  " +
                              _bierre.nom +
                              " est insuffisant pour effectuer cette vente. Vous ne disposez que " +
                              _bierre.quantite_physique.toString() +
                              " unités de ce produit en stock à cet instant !";

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.7),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        }
                      }
                    } catch (e) {
                      _provider.putfalse();
                      message =
                          "Une erreur intattendue s'est produite epndant l'enregistrement de votre vente ! Réessayez svp !"
                              .toUpperCase();
                      final snakbar = SnackBar(
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        backgroundColor: Colors.redAccent.withOpacity(.7),
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snakbar);
                    }
                  }),
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
