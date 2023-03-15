// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_function_literals_in_foreach_calls, prefer_interpolation_to_compose_strings

import 'package:deogracias/interface/Bar_restaurant/drawer_admin_bar.dart';
import 'package:deogracias/modele/bieere_petit_model.dart';
import 'package:deogracias/modele/bierre_grand_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoriqueStockCumulesBar extends StatelessWidget {
  const HistoriqueStockCumulesBar({super.key});

  @override
  Widget build(BuildContext context) {
    final petits_modeles = Provider.of<List<donneesBieerePetitModele>>(context);
    final grands_modeles = Provider.of<List<donnesBierresGrandModel>>(context);

    int total = 0;
    int total_grand_modele = 0;
    int total_petit_modele = 0;
    int total_benefice_grand_modele = 0;
    int total_benefice_petit_modele = 0;
    int benefice = 0;

    grands_modeles.forEach((element) {
      total_grand_modele += element.montant_cumule;
      total_benefice_grand_modele += element.benefice_cumule;
    });

    petits_modeles.forEach((element) {
      total_petit_modele += element.montant_vendu_cumule;
      total_benefice_petit_modele += element.benefice_cumule;
    });

    benefice = total_benefice_petit_modele + total_benefice_grand_modele;

    total = total_petit_modele + total_grand_modele;

    if (petits_modeles.isEmpty && grands_modeles.isEmpty) {
      return Scaffold(
        drawer: DrawerAdminBar(),
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
          centerTitle: true,

          iconTheme: IconThemeData(color: Colors.black),
          //centerTitle: true,
          title: Text(
            "Stocks cumulés",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      drawer: DrawerAdminBar(),
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
        centerTitle: true,

        iconTheme: IconThemeData(color: Colors.black),
        //centerTitle: true,
        title: Text(
          "Stocks cumulés",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
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
                      image: AssetImage("images/bierre_bon.webp"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Stocks cumulés du restaurant",
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
              width: MediaQuery.of(context).size.width * 0.96,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  grands_modeles.isNotEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.99,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.lightBlue.shade900),
                                  onPressed: () {},
                                  child: Text(
                                    "Grands modèles".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.alike(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  border: TableBorder.all(
                                      color: Colors.lightBlue.shade800,
                                      style: BorderStyle.solid,
                                      width: 3),
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                      "".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Stock initial cumulé".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Stock vendu cumulé".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Stock physique".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Prix unitaire".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Montant de vente cumulé".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Bénéfice cumulé".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                  rows: grands_modeles.map((produit) {
                                    return DataRow(cells: [
                                      DataCell(Text(
                                        produit.nom,
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.quantite_initial_cumule
                                            .toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        (produit.quantite_initial_cumule -
                                                produit.quantite_physique)
                                            .toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.quantite_physique.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.prix_unitaire.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.montant_cumule.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.benefice_cumule.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      ))
                                    ]);
                                  }).toList()),
                            ),
                            Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 0.999,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue.shade800,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Total grands modèles :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_grand_modele.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        )
                      : Container(),
                  petits_modeles.isNotEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.99,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.lightBlue.shade900),
                                  onPressed: () {},
                                  child: Text(
                                    "Pétits modèles".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.alike(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  border: TableBorder.all(
                                      color: Colors.lightBlue.shade800,
                                      style: BorderStyle.solid,
                                      width: 3),
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                      "".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Stock initial cumulé".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Stock vendu cumulé".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Stock physique".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Prix unitaire".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Montant de vente cumulé".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Bénéfice cumulé".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.lightBlue.shade800,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                  rows: petits_modeles.map((produit) {
                                    return DataRow(cells: [
                                      DataCell(Text(
                                        produit.nom,
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.quantite_initial_cumule
                                            .toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        (produit.quantite_initial_cumule -
                                                produit.quantite_physique)
                                            .toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.quantite_physique.toString(),
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.prix_unitaire.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.montant_vendu_cumule
                                                .toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                        produit.benefice_cumule.toString() +
                                            " XOF",
                                        style: GoogleFonts.alike(
                                            color: Colors.lightBlue.shade800,
                                            fontWeight: FontWeight.bold),
                                      ))
                                    ]);
                                  }).toList()),
                            ),
                            Container(
                              height: 47,
                              width: MediaQuery.of(context).size.width * 0.999,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue.shade800,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Total pétits modèles :".toUpperCase(),
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      total_petit_modele.toString() + " XOF",
                                      style: GoogleFonts.alike(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 47,
                    width: MediaQuery.of(context).size.width * 0.999,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade900,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.monetization_on,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Total de vente :".toUpperCase(),
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            total.toString() + " XOF",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 47,
                    width: MediaQuery.of(context).size.width * 0.999,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade900,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.monetization_on,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Bénéfice brute :".toUpperCase(),
                                style: GoogleFonts.alike(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            benefice.floor().toString() + " XOF",
                            style: GoogleFonts.alike(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
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
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
