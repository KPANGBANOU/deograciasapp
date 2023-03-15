// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, must_be_immutable, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modele/credit.dart';
import 'drawer_admin_centre.dart';
import 'stream_approvisionner_credit.dart';
import 'stream_update_reseau_credit.dart';

class CentreLiquiditeCredit extends StatelessWidget {
  CentreLiquiditeCredit({key});

  @override
  Widget build(BuildContext context) {
    final _credit = Provider.of<credit>(context);

    return Scaffold(
      backgroundColor: Colors.green.shade800,
      drawer: DrawerAdminCentre(),
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
          _credit.nom,
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
                          "Disponibilité du crédit ".toUpperCase(),
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
                        "Montant initial",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _credit.montant_initial.toString() + " XOF",
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
                        "Montant vendu",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        (_credit.montant_initial - _credit.montant_disponible)
                                .toString() +
                            " XOF",
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
                        "Montant restant",
                        style: GoogleFonts.alike(
                            color: Colors.lightBlue.shade800,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _credit.montant_disponible.toString() + " XOF",
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
                        _credit.benefice.toString() + " XOF",
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
                        _credit.seuil_approvisionnement.toString() + " XOF",
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
                                    StreamUpdateCredit(credit_uid: _credit.uid),
                              ));
                        },
                        child: Text(
                          "Modifiez le crédit".toUpperCase(),
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
                                    StreamApprovisionnerCredit(
                                        credit_uid: _credit.uid),
                              ));
                        },
                        child: Text(
                          "Approvisionnez le crédit".toUpperCase(),
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
