import 'dart:convert';
import 'package:diet_student/common/values.dart';
import 'package:diet_student/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

//--------------------------------------------------> VARIABLES

class NewMealView extends StatefulWidget {
  @override
  _NewMealViewState createState() => _NewMealViewState();

  NewMealView({
    Key key,
  }) : super(key: key);
}

class _NewMealViewState extends State<NewMealView>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _barcode;
  String _name;
  String _calories;
  String _proteines;
  String _carbohydrates;
  String _lipids;
  String barcodeScanRes = "";
  String foodNotFound = "";

  _NewMealViewState();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBarcode() {
    return Container(
      width: 200,
      child: TextFormField(
        key: Key("form_barcode"),
        decoration: InputDecoration(labelText: 'Numéro de code barre'),
        keyboardType: TextInputType.number,
        validator: (String value) {
          int barecode = int.tryParse(value);
          if (barecode == null) {
            return 'Code barre requis';
          }
          return null;
        },
        onSaved: (String value) {
          _barcode = value;
        },
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
      key: Key("form_name"),
      decoration: InputDecoration(labelText: "Nom de l'aliment"),
      maxLength: 60,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nom requis';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      key: Key("form_cal"),
      decoration: InputDecoration(labelText: 'Calories (Kcal)'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories < 0) {
          return 'le nombre de calories doit être positif ou nul';
        }

        return null;
      },
      onSaved: (String value) {
        _calories = value;
      },
    );
  }

  Widget _buildProteins() {
    return TextFormField(
      key: Key("form_pro"),
      decoration: InputDecoration(labelText: 'Protéines (g)'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int proteines = int.tryParse(value);

        if (proteines == null || proteines < 0) {
          return 'le nombre de protéines doit être positif ou nul';
        }

        return null;
      },
      onSaved: (String value) {
        _proteines = value;
      },
    );
  }

  Widget _buildCarbohydrates() {
    return TextFormField(
      key: Key("form_car"),
      decoration: InputDecoration(labelText: 'Carbohydrates (g)'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int Carbohydrates = int.tryParse(value);

        if (Carbohydrates == null || Carbohydrates < 0) {
          return 'le nombre de carbohydrates doit être positif ou nul';
        }

        return null;
      },
      onSaved: (String value) {
        _carbohydrates = value;
      },
    );
  }

  Widget _buildLipids() {
    return TextFormField(
      key: Key("form_lip"),
      decoration: InputDecoration(labelText: 'Lipides (g)'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int Lipides = int.tryParse(value);

        if (Lipides == null || Lipides < 0) {
          return 'le nombre de lipides doit être positif ou nul';
        }

        return null;
      },
      onSaved: (String value) {
        _lipids = value;
      },
    );
  }

  Widget _scanBarcode() {
    return GestureDetector(
      onTap: () async {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#004297", "Retour", true, ScanMode.BARCODE);
        if (barcodeScanRes == "-1") {
          barcodeScanRes = "Code barre illisible?";
          backScan = true;
        } else {
          //backScan = true;
          //typeBarcode = false;
          String res = await _addFoodByBarcode(barcodeScanRes);
          if (res != null) {
            //barcodeScanRes = res;
            print(res);
            typeBarcode = false;
            backScan = false;
            scanNotFound = false;
            SnackBar snackbar = new SnackBar(
                content: Text("Consommation enregistrée avec succès."));
            Scaffold.of(context).showSnackBar(snackbar);
          } else {
            scanNotFound = true;
            foodNotFound = "Aliment introuvable, essayez manuellement";
            typeBarcode = true;
          }
        }
        (context as Element).reassemble();
      },
      child: Container(
        height: 50.0,
        width: 250,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.barcode),
            SizedBox(
              width: 10,
            ),
            Text(
              "Scannez votre aliment",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _manualEntry() {
    return GestureDetector(
      onTap: () {
        manualEntry = !manualEntry;
        (context as Element).reassemble();
      },
      child: Container(
        height: 50.0,
        width: 250,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.keyboard),
            SizedBox(
              width: 10,
            ),
            Text(
              "Entrée manuelle",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _addFood(String calories, String proteins, String carbohydrates,
      String lipids, String name) async {
    /*var address = host + foodRoute + user.id.toString();
    print(address);
    var data = {
      "kcal": calories,
      "protein": proteins,
      "carbohydrates": carbohydrates,
      "lipids": lipids,
      "name": name,
    };
    var body = json.encode(data);
    var res = await http.post(
      address,
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    if (res.statusCode == 201){
      print(res.body);
      //return res.body;
      return true;
    }*/
    return false;
  }

  Future<String> _addFoodByBarcode(String barcode) async {
    //List<FoodModel> foods = [];
    var address =
        "https://world.openfoodfacts.org/api/v0/product/" + barcode + ".json";
    var data =
        await http.get(address, headers: {"Content-Type": "application/json"});
    //print("----------------------data-------------------");
    //print(data.body);
    var jsonData = json.decode(utf8.decode(data.bodyBytes));
    print("----------------------json-------------------");
    print(jsonData);
    FoodModel food = FoodModel(
        id: jsonData["id"],
        carbohydrates: jsonData["carbohydrates"],
        kcal: jsonData["kcal"],
        protein: jsonData["protein"],
        lipids: jsonData["lipids"],
        name: jsonData["name"],
        idDaily: 1);
    //foods.add(food);
    print(food);
    if (food != null) return food.id.toString();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Vous avez consommé quelque chose?",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20),
                  _scanBarcode(),
                  Visibility(
                    visible: backScan,
                    child: SizedBox(height: 20),
                  ),
                  Visibility(
                    visible: backScan,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          barcodeScanRes,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            typeBarcode = !typeBarcode;
                            (context as Element).reassemble();
                          },
                          child: Text(
                            "Saisir",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: scanNotFound,
                    child: SizedBox(height: 20),
                  ),
                  Visibility(
                    visible: scanNotFound,
                    child: Text(
                      foodNotFound,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: typeBarcode,
                    child: SizedBox(height: 20),
                  ),
                  Visibility(
                    visible: typeBarcode,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildBarcode(),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            print(_barcode);
                            String res = await _addFoodByBarcode(_barcode);
                            if (res != null) {
                              print(res);
                              //barcodeScanRes = res;
                              _formKey.currentState.reset();
                              typeBarcode = false;
                              backScan = false;
                              scanNotFound = false;
                              SnackBar snackbar = new SnackBar(
                                  content: Text(
                                      "Consommation enregistrée avec succès."));
                              Scaffold.of(context).showSnackBar(snackbar);
                            } else {
                              scanNotFound = true;
                              foodNotFound =
                                  "Aliment introuvable, essayez manuellement";
                              typeBarcode = true;
                            }
                            (context as Element).reassemble();
                          },
                          child: Icon(
                            FontAwesomeIcons.arrowCircleRight,
                            size: 30,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Pas de code barre?",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20),
                  _manualEntry(),
                  SizedBox(height: 20),
                  Visibility(
                    child: _buildName(),
                    visible: manualEntry,
                  ),
                  Visibility(
                    child: _buildCalories(),
                    visible: manualEntry,
                  ),
                  Visibility(
                    child: _buildProteins(),
                    visible: manualEntry,
                  ),
                  Visibility(
                    child: _buildCarbohydrates(),
                    visible: manualEntry,
                  ),
                  Visibility(
                    child: _buildLipids(),
                    visible: manualEntry,
                  ),
                  Visibility(
                    child: SizedBox(height: 50),
                    visible: manualEntry,
                  ),
                  Visibility(
                    child: RaisedButton(
                      key: Key("btn_save"),
                      child: Text(
                        'Enregistrer',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();

                        print(_name);
                        print(_calories);
                        print(_proteines);
                        print(_carbohydrates);
                        print(_lipids);

                        //Send to API
                        bool res = await _addFood(_calories, _proteines,
                            _carbohydrates, _lipids, _name);
                        if (res) {
                          SnackBar snackbar = new SnackBar(
                              content: Text(
                                  "Consommation enregistrée avec succès."));
                          Scaffold.of(context).showSnackBar(snackbar);
                          // nextId = nextId + 1;
                          _formKey.currentState.reset();
                          typeBarcode = false;
                          backScan = false;
                          scanNotFound = false;
                          manualEntry = false;
                          (context as Element).reassemble();
                        }
                      },
                    ),
                    visible: manualEntry,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // here
    super.dispose();
  }
}
