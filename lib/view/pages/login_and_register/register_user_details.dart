import 'package:flutter/material.dart';
import 'package:reelant_1/constants.dart';
import 'package:reelant_1/view/pages/app_main/home_page.dart';

class RegisterUserDetailsPage extends StatefulWidget {
  final UserType userType;

  RegisterUserDetailsPage({required this.userType});

  @override
  _RegisterUserDetailsPageState createState() => _RegisterUserDetailsPageState();
}

class _RegisterUserDetailsPageState extends State<RegisterUserDetailsPage> {
  bool lookingForJob = false;
  List<String> selectedSkills = [];

  final List<String> skills = [    'Java',    'Python',    'C++',    'JavaScript',    'PHP',    'Swift',    'HTML/CSS',    'Ruby',    'React',    'Angular',    'Node.js',    'MySQL',    'MongoDB',    'AWS',    'Firebase'  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('User Details'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              widget.userType == UserType.seeker
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Upload your resume'),
                  // Add file picker widget here to upload resume
                  SizedBox(height: 20),
                  Text('Select your skills (minimum 2, maximum 5)'),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: skills
                        .map((skill) => FilterChip(
                      label: Text(skill),
                      selected: selectedSkills.contains(skill),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            if (selectedSkills.length < 5) {
                              selectedSkills.add(skill);
                            }
                          } else {
                            selectedSkills.remove(skill);
                          }
                        });
                      },
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: lookingForJob,
                        onChanged: (bool? value) {
                          setState(() {
                            lookingForJob = value ?? false;
                          });
                        },
                      ),
                      Text('Looking for job'),
                    ],
                  ),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What skills are you looking for?'),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: skills
                        .map((skill) => FilterChip(
                      label: Text(skill),
                      selected: selectedSkills.contains(skill),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            if (selectedSkills.length < 5) {
                              selectedSkills.add(skill);
                            }
                          } else {
                            selectedSkills.remove(skill);
                          }
                        });
                      },
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Text('Current organization'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your current organization',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Description about your organization'),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Enter description about your organization',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(

                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
