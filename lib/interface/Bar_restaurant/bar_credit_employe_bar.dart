// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously
import 'package:deogracias/interface/Bar_restaurant/drawer_admin_bar.dart';
import 'package:deogracias/modele/credits_servants.dart';
import 'package:deogracias/services/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreditEmployeBar extends StatelessWidget {
  const CreditEmployeBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<donnesUtilisateur>(context);
    final vente_a_credit = Provider.of<VenteACreditBars>(context);
    return Scaffold(
      drawer: DrawerAdminBar(),
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          Image.asset(
            "images/icon.jpeg",
            scale: 4.5,
            height: 100,
            width: 100,
          ),
        ],
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Vente à crédit",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  image: DecorationImage(
                      image: AssetImage(
                        "images/resto1.jfif",
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Vente à crédit ",
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
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.89,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue.shade900),
                        onPressed: () {},
                        child: Text(
                          "Informations sur la vente".toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alike(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nom du client",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.nom_client,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Achat éffectué",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.achat_effectue,
                            maxLines: 8,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Description de l'achat :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.description,
                            maxLines: 25,
                            softWrap: true,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Montant de l'achat",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.montant.toString() + " XOF",
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date de vente :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.created_at +
                                " à " +
                                vente_a_credit.created_at_heure,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Statut du crédit",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            vente_a_credit.paye
                                ? "Payé".toUpperCase()
                                : "Non payé".toUpperCase(),
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: vente_a_credit.paye
                                    ? Colors.green.shade800
                                    : Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  vente_a_credit.paye
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payé le :",
                                style: GoogleFonts.alike(
                                    color: Colors.lightBlue.shade800,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: Text(
                                  vente_a_credit.updated_at +
                                      " à " +
                                      vente_a_credit.updated_at_heure,
                                  maxLines: 2,
                                  softWrap: true,
                                  style: GoogleFonts.alike(
                                      color: Colors.lightBlue.shade800,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vente enregistré par :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            user.prenom + " " + user.nom,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contact :",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            user.telephone,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Adresse E-Mail",
                          style: GoogleFonts.alike(
                              color: Colors.lightBlue.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            user.email,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.alike(
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
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
