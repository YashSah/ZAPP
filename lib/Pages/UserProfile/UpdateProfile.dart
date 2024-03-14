import 'package:flutter/material.dart';
import 'package:zapp/Widget/PrimaryButton.dart';

class UserUpdateProfile extends StatelessWidget {
  const UserUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update UserProfile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer
              ),
              child: Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Icon(Icons.add_photo_alternate_rounded, size: 40,),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(
                            "Personal Information",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter Full Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(
                            "Email Address",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Example@gmail.com",
                          prefixIcon: Icon(Icons.alternate_email_rounded),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(
                            "Phone Number",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "0123456789",
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(height: 40,),
                      PrimaryButton(
                        btnName: "Save",
                        icon: Icons.save,
                        ontap: () {

                        },
                      ),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
