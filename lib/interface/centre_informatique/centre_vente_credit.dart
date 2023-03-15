// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, unnecessary_null_comparison, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables, must_be_immutable, unused_field, prefer_final_fields, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/budget_centre.dart';
import '../../modele/credit.dart';
import '../../provider/pr_ovider_gestion_gerant.dart';
import '../../services/user.dart';
import 'centre_facture_vente_credit.dart';
import 'centre_servant_drawer.dart';

class CentreVenteCredit extends StatelessWidget {
  CentreVenteCredit({
    Key? key,
    required this.montant_disponible,
  }) : super(key: key);

  TextEditingController _montant = TextEditingController();
  int montant = 0;
  final int montant_disponible;
  bool affiche = false;

  @override
  Widget build(BuildContext context) {
    final _credit = Provider.of<credit>(context);
    final _budget_centre = Provider.of<budgetCentre>(context);
    final _donne = Provider.of<donnesUtilisateur>(context);
    final _provider = Provider.of<ProviderGestionGerant>(context);
    affiche = _provider.vente_credit;

    if (_credit == null) {
      return Scaffold(
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
            "Crédit",
            style: GoogleFonts.alike(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
          _credit.nom,
          style: GoogleFonts.alike(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
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
                      image: AssetImage("images/reseau2.jpg"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Reséau mobile " + _credit.nom,
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
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Vous dispose de " +
                    _credit.montant_disponible.toString() +
                    " XOF de ce crédit en stock ",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Montant restant de ce crédit svp",
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
                  controller: _montant,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: GoogleFonts.lato(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: SizedBox(
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
                        _provider.put_vente_credit_true();
                        try {
                          montant = _montant.text.isNotEmpty
                              ? int.parse(_montant.text)
                              : 0;
                          if (_montant.text.isEmpty || montant <= 0) {
                            _provider.put_vente_redit_false();
                            final snakbar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Vous n'avez pas renseigné le montant de crédit que vous voudriez vendre ou le montant saisi est incorrecte ! Veuillez réessayez svp !",
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
                            if (montant > _credit.montant_disponible) {
                              _provider.put_vente_redit_false();
                              final snack = SnackBar(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Le stock est insuffisant. Vérifiez diminuer le montant de vente et réessayez !!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                backgroundColor:
                                    Colors.redAccent.withOpacity(.8),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(4),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snack);
                            } else {
                              await FirebaseFirestore.instance
                                  .collection("vente_credits")
                                  .add({
                                'benefice':
                                    (((_credit.montant_disponible - montant) *
                                                _credit.benefice_sur_5000) /
                                            5000)
                                        .toDouble(),
                                'produit_uid': _credit.uid,
                                'user_uid': _donne.uid,
                                "nom": _credit.nom,
                                "montant":
                                    (_credit.montant_disponible - montant),
                                "derniere_vente": DateTime.now()
                              });

                              await FirebaseFirestore.instance
                                  .collection("budget")
                                  .doc(_budget_centre.uid)
                                  .update({
                                "benefice": _budget_centre.benefice +
                                    ((_credit.montant_disponible - montant) *
                                            _credit.benefice_sur_5000) /
                                        5000,
                                "solde_total": _budget_centre.solde_total +
                                    (_credit.montant_disponible - montant),
                              });

                              await FirebaseFirestore.instance
                                  .collection("reseaux_communication")
                                  .doc(_credit.uid)
                                  .update({
                                "benefice": _credit.benefice +
                                    ((_credit.montant_disponible - montant) *
                                            _credit.benefice_sur_5000) /
                                        5000,
                                "montant_disponible": montant,
                                "benefice_cumule": _credit.benefice_cumule +
                                    ((_credit.montant_disponible_cumule -
                                                montant) *
                                            _credit.benefice_sur_5000) /
                                        5000,
                                "montant_disponible_cumule": montant,
                              });

                              if (_credit.montant_disponible <=
                                  _credit.seuil_approvisionnement) {
                                await FirebaseFirestore.instance
                                    .collection("reseaux_communication")
                                    .doc(_credit.uid)
                                    .update({"approvisionne": false});
                              }

                              _provider.put_vente_redit_false();

                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          CentreFactureVenteCredit(
                                            credit_montant_vendu:
                                                montant_disponible - montant,
                                            credit_uid: _credit.uid,
                                            credit_nom: _credit.nom.toString(),
                                            credit_montant_restant: montant,
                                          ))));
                            }
                          }
                          // ignore: empty_catches
                        } catch (e) {
                          _provider.put_vente_redit_false();
                          final snack = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Une erreur intatte,ndue s'est produite pendant l'enregistrement de vente. Vérifier votreconnection internet et réessayez !",
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
