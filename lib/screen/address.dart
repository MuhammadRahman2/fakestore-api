import 'package:flutter/material.dart';
import 'package:product_api/screen/payment.dart';
import 'package:product_api/widget/container_button.dart';
import '../widget/text_field_edit.dart';

class Address extends StatefulWidget {
  final num? price;
  const Address({super.key, this.price});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  String? dropDownValue;

  // List<DropdownMenuItem<Object>>? product;
  String dropdownValue = 'Lahore';
  List<String> city = ['Lahore', 'Karachi', 'Islamabad', 'Peshawar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Address'),
              const Text('First Name'),
              const TextFieldEdit(
                hint: 'First Name',
              ),
              const Text('Last Name'),
              const TextFieldEdit(
                hint: 'Last Name',
              ),
              const Text('Mobile No'),
              const TextFieldEdit(
                hint: 'Mobile No',
              ),
              const Text('Complete Address'),
              const TextFieldEdit(
                hint: 'Enter Address',
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
                height: 35
                ,
              ),
              ContainerButton(
                title: 'Next',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Payment(
                                price: widget.price,
                              )));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
