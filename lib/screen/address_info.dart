import 'package:flutter/material.dart';
import 'package:product_api/firebase/firebase.dart';
import 'package:product_api/screen/payment.dart';
import 'package:product_api/widget/container_button.dart';
import '../widget/text_field_edit.dart';

class AddressInfo extends StatefulWidget {
  final num? price;
  const AddressInfo({super.key, this.price});

  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  String? dropDownValue = 'city';

  // List<DropdownMenuItem<Object>>? product;
  String? dropdownValue;
  List<String> city = ['Lahore', 'Karachi', 'Islamabad', 'Peshawar'];

  final firstNameC = TextEditingController();
  final lastNameC = TextEditingController();
  final phoneNumberC = TextEditingController();
  final addressC = TextEditingController();
  String? selectcity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddressInfo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('First Name'),
                      TextFieldEdit(
                        textEditController: firstNameC,
                        hint: 'First Name',
                      ),
                      const Text('Last Name'),
                      TextFieldEdit(
                        textEditController: lastNameC,
                        hint: 'Last Name',
                      ),
                      const Text('Mobile No'),
                      TextFieldEdit(
                        textEditController: phoneNumberC,
                        hint: 'Mobile No',
                      ),
                      const Text('Complete AddressInfo'),
                      TextFieldEdit(
                        textEditController: addressC,
                        hint: 'Enter AddressInfo',
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('select city'),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    // borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  // filled: true,
                  // fillColor: Colors.greenAccent,
                ),
                // dropdownColor: Colors.greenAccent,
                value: dropdownValue, // initiation Value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },

                // style: TextStyle(fontSize: 14),
                items: city.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 35,
              ),
              ContainerButton(
                title: 'Add data',
                onTap: () {
                  final id = DateTime.now().millisecondsSinceEpoch.toString();
                  FireBase().getFirestoredata(
                    id: id,
                    firstN: firstNameC.text.toString(),
                    lastN: lastNameC.text.toString(),
                    phoneN: int.parse(phoneNumberC.text),
                    addres: addressC.text.toString(),
                    city: dropDownValue.toString(),
                  ).then((value) => print('success '));

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => Payment(
                  //               price: widget.price,
                  //             )));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
