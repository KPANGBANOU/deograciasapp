// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, prefer_final_fields, unused_field, must_be_immutable, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/serac.dart';
import '../services/user.dart';
import 'drawer.dart';
import 'stream_accorder_droits_employes.dart';

class AccoredrDroitsListEmploye extends StatelessWidget {
  AccoredrDroitsListEmploye({key}) : super(key: key);

  String _search_value = "";
  bool affiche = false;
  int nombre = 0;

  @override
  Widget build(BuildContext context) {
    final _list_employes = Provider.of<List<donnesUtilisateur>>(context);
    final user = Provider.of<donnesUtilisateur>(context);
    final _search_provider = Provider.of<Search>(context);
    affiche = _search_provider.val;
    !affiche
        ? _search_value = ""
        : _search_value = _search_provider.searchvalue;
    _list_employes.forEach((element) {
      if (!element.admin && !element.deleted) {
        nombre++;
      }
    });

    if (_list_employes.isEmpty || nombre <= 0) {
      return Scaffold(
        drawer: DrawerHome(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          actions: [
            Image.asset(
              "images/icon.jpeg",
              height: 60,
              width: 60,
              scale: 2.5,
            ),
          ],
          backgroundColor: Colors.white,
          title: Text(
            "Employés",
            style: GoogleFonts.alike(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        body: Center(
            child: CircularProgressIndicator(
          color: Colors.cyan,
        )),
      );
    }

    return Scaffold(
      drawer: DrawerHome(),
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
              )),
          Image.asset(
            "images/icon.jpeg",
            height: 60,
            width: 60,
            scale: 2.5,
          ),
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
                "Utilisateurs",
                style: GoogleFonts.alike(
                    fontSize: 17,
                    color: Colors.black,
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
              donnesUtilisateur _donnes = _list_employes[index];
              return !affiche
                  ? !_donnes.admin && !_donnes.deleted
                      ? ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        StreamAccorderDroitsEmployes(
                                          uid: _donnes.uid,
                                          user_password: user.mdp,
                                        ))));
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.lightBlue.shade900,
                            child: Text(
                              "DG",
                              style: GoogleFonts.alike(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            _donnes.prenom.toString() +
                                " " +
                                _donnes.nom.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.alike(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "A créé son compte le " + _donnes.date_inscription,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                GoogleFonts.alike(fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container()
                  : _donnes.nom
                              .toString()
                              .toLowerCase()
                              .contains(_search_value.toLowerCase()) ||
                          _donnes.prenom
                              .toString()
                              .toLowerCase()
                              .contains(_search_value.toLowerCase())
                      ? !_donnes.admin && !_donnes.deleted
                          ? ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            StreamAccorderDroitsEmployes(
                                              uid: _donnes.uid,
                                              user_password: user.mdp,
                                            ))));
                              },
                              leading: CircleAvatar(
                                backgroundColor: Colors.lightBlue.shade900,
                                child: Text(
                                  "DG",
                                  style: GoogleFonts.alike(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              title: Text(
                                _donnes.prenom.toString() +
                                    " " +
                                    _donnes.nom.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.alike(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "A créé son compte le " +
                                    _donnes.date_inscription,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.alike(
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Container()
                      : Container();
            }),
            itemCount: _list_employes.length),
      ),
    );
  }
}
