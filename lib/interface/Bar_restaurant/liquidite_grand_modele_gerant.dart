// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, must_be_immutable, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:deogracias/interface/Bar_restaurant/stream_update_grand_modele_gerant.dart';
import 'package:deogracias/interface/Bar_restaurant/streamapprovisionnergrandmodelegerant.dart';
import 'package:deogracias/interface/drawer_gerant.dart';
import 'package:deogracias/modele/bierre_grand_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LiquiditeGrandModeleGerant extends StatelessWidget {
  LiquiditeGrandModeleGerant({key});

  @override
  Widget build(BuildContext context) {
    final _produit = Provider.of<donnesBierresGrandModel>(context);

    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerGerant(),
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
        title: Text(
          _produit.nom,
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
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
                      image: AssetImage("images/bierre_bon.webp"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Stock de " + _produit.nom,
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
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlue.shade800),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Disponibilité du bièrre ".toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.vertical_align_bottom,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Stock initial",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _produit.quantite_initial.toString(),
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Stock vendu",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        (_produit.quantite_initial - _produit.quantite_physique)
                            .toString(),
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Stock physique",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _produit.quantite_physique.toString(),
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Prix unitaire de vente",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _produit.prix_unitaire.toString() + " XOF",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total de vente du bièrre",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _produit.montant_vendu.toString() + " XOF",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Bénéfice brute",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _produit.benefice.toString() + " XOF",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Suil d'approvisionnement ",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _produit.seuil_approvisionnement.toString(),
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.96,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade800),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamUpdateGrandModeleGerant(
                                        produit_uid: _produit.uid),
                              ));
                        },
                        child: Text(
                          "Modifiez le produit".toUpperCase(),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.96,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue.shade900),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamApprovisionnerGrandModeleGerant(
                                        produit_uid: _produit.uid),
                              ));
                        },
                        child: Text(
                          "Approvisionnez le produit".toUpperCase(),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
