import 'dart:developer';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:srs_admin/app/constants/colors.dart';
import 'package:srs_admin/app/controller/export_controllers.dart';
import 'package:srs_admin/app/model/services_model.dart';

class ServicesPage extends StatelessWidget {
  var serviceFormKey = GlobalKey<FormState>();
  var cardKeys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: Card(
          color: appbarColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Liste des services offrets',
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.dialog(_addServiceDialog(context));
                      },
                      icon: Icon(Icons.add),
                      label: Text('Ajouter'),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Obx(() => ListView(
                      shrinkWrap: true,
                      children: [
                        for (var i = 0;
                            i < commonservicesCTL.servicesList.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: ExpansionTileCard(
                              onExpansionChanged: (value) {
                                if (value) {
                                  for (var item in commonservicesCTL.cardKeys) {
                                    if (item != commonservicesCTL.cardKeys[i]) {
                                      item.currentState?.collapse();
                                    }
                                  }
                                }
                              },
                              key: commonservicesCTL.cardKeys[i],
                              expandedTextColor: Colors.orangeAccent,
                              title: Text(
                                  '${commonservicesCTL.servicesList[i].title}'),
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 1, child: Text('price:')),
                                          Expanded(
                                            flex: 4,
                                            child: Text(commonservicesCTL
                                                .servicesList[i].price
                                                .toString()),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text('duration:')),
                                          Expanded(
                                            flex: 4,
                                            child: Text(commonservicesCTL
                                                .servicesList[i].duration
                                                .toString()),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text('createdat:')),
                                          Expanded(
                                            flex: 4,
                                            child: Text(commonservicesCTL
                                                .servicesList[i].createdat
                                                .toString()),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text('updatedat:')),
                                          Expanded(
                                            flex: 4,
                                            child: Text(commonservicesCTL
                                                .servicesList[i].updatedat
                                                .toString()),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text('inprogress:')),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                                '${commonservicesCTL.servicesList[i].inprogresss}'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text('description:')),
                                          Expanded(
                                            flex: 4,
                                            child: Text(commonservicesCTL
                                                .servicesList[i].description
                                                .toString()),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.spaceAround,
                                  buttonHeight: 52.0,
                                  buttonMinWidth: 90.0,
                                  children: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        commonservicesCTL.deleteService(
                                            commonservicesCTL
                                                .servicesList[i].id);
                                        for (var item
                                            in commonservicesCTL.cardKeys)
                                          item.currentState?.collapse();
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(Icons.delete,
                                              color: Colors.orangeAccent),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          Text('Supprimer',
                                              style: TextStyle(
                                                  color: Colors.orangeAccent)),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        commonservicesCTL.isupdating.value =
                                            true;
                                        commonservicesCTL.editId.value =
                                            commonservicesCTL
                                                .servicesList[i].id;
                                        commonservicesCTL.titleTC.text =
                                            commonservicesCTL
                                                .servicesList[i].title;
                                        commonservicesCTL.priceTC.text =
                                            commonservicesCTL
                                                .servicesList[i].price
                                                .toString();
                                        commonservicesCTL.durationTC.text =
                                            commonservicesCTL
                                                .servicesList[i].duration
                                                .toString();
                                        commonservicesCTL.descriptionTC.text =
                                            commonservicesCTL
                                                .servicesList[i].description;
                                        commonservicesCTL.inprogresss.value =
                                            commonservicesCTL
                                                .servicesList[i].inprogresss;
                                        Get.dialog(_addServiceDialog(context));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(Icons.edit, color: Colors.green),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          Text(
                                            'Editer',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AlertDialog _addServiceDialog(BuildContext context) {
    return AlertDialog(
      title: Text('AJOUTER UN SERVICE'),
      content: Container(
        width: Get.width / 2,
        height: Get.height / 2,
        child: Form(
          child: ListView(children: <Widget>[
            Container(
              child: TextFormField(
                controller: commonservicesCTL.titleTC,
                maxLength: 50,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                    hintText: 'ex: hello', labelText: 'title', filled: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid title';
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: TextFormField(
                controller: commonservicesCTL.priceTC,
                maxLength: 20,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                    hintText: 'ex: 55,000.00',
                    labelText: 'Price',
                    filled: true),
                validator: (value) {
                  if (!value!.isNum) {
                    return 'Please enter a valid title';
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: TextFormField(
                controller: commonservicesCTL.durationTC,
                maxLength: 20,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                    hintText: 'ex: 31', labelText: 'duration', filled: true),
                validator: (value) {
                  if (!value!.isNum) {
                    return 'Please enter a valid title';
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: TextFormField(
                controller: commonservicesCTL.descriptionTC,
                maxLength: 255,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                    hintText: 'ex: Bon prix',
                    labelText: 'Description',
                    filled: true),
              ),
            ),
            Obx(
              () => Container(
                child: DropdownButton(
                  hint: Text(
                    'ACTIF OU NON ?',
                  ),
                  onChanged: (newValue) {
                    commonservicesCTL.inprogressTC.text = newValue.toString();
                    commonservicesCTL.inprogresss.value = newValue.toString();
                  },
                  value: commonservicesCTL.inprogresss.value,
                  items: <String>['ACTIVE', 'INACTIVE'].map((selectedType) {
                    return DropdownMenuItem(
                      child: new Text(
                        selectedType,
                      ),
                      value: selectedType,
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                      commonservicesCTL.clearTC();
                    },
                    child: Text('annuler'),
                  ),
                  TextButton(
                    onPressed: () {
                      commonservicesCTL.addService();
                      Get.back();
                      commonservicesCTL.clearTC();
                    },
                    child: Text('Enregistrer'),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
