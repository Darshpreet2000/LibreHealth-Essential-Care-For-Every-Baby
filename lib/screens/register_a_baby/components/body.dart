import 'package:flutter/material.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/screens/register_a_baby/components/register_baby_details.dart';
import 'package:newborn_care/screens/register_a_baby/components/register_mother_details.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late RegisterBabyModel registerBabyModel=new RegisterBabyModel();
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RegisterMotherDetails(registerBabyModel),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: registerBabyModel.children.length,
            itemBuilder: (context, index) {
              return RegisterBabyDetails(registerBabyModel.children[index]);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                onPressed: () {},
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
