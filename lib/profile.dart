import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
//import 'main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;
  File? _achievementPdf;
  final _picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _nationController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();

  // Function to pick profile image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Function to pick PDF
  Future<void> _pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _achievementPdf = File(result.files.single.path!);
      });
    }
  }

  // Function to validate email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  // Function to validate phone number
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // This will now work if Get.to() is used
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image Section
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          _profileImage != null
                              ? FileImage(_profileImage!)
                              : null,
                      child:
                          _profileImage == null
                              ? const Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.grey,
                              )
                              : null,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // First Name
                _buildTextField(_firstNameController, "First Name", (value) {
                  if (value == null || value.isEmpty) {
                    return 'First Name is required';
                  }
                  return null;
                }),

                // Last Name
                _buildTextField(_lastNameController, "Last Name", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last Name is required';
                  }
                  return null;
                }),

                // Email
                _buildTextField(
                  _emailController,
                  "Email ID",
                  _validateEmail,
                  TextInputType.emailAddress,
                ),

                // Phone Number
                _buildTextField(
                  _phoneController,
                  "Phone Number",
                  _validatePhone,
                  TextInputType.phone,
                ),

                // WhatsApp Number
                _buildTextField(
                  _whatsappController,
                  "WhatsApp Number",
                  _validatePhone,
                  TextInputType.phone,
                ),

                const SizedBox(height: 10),
                const Text(
                  "Address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                // Nation
                _buildTextField(_nationController, "Nation", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nation is required';
                  }
                  return null;
                }),

                // State
                _buildTextField(_stateController, "State", (value) {
                  if (value == null || value.isEmpty) {
                    return 'State is required';
                  }
                  return null;
                }),

                // District
                _buildTextField(_districtController, "District", (value) {
                  if (value == null || value.isEmpty) {
                    return 'District is required';
                  }
                  return null;
                }),

                // City
                _buildTextField(_cityController, "City", (value) {
                  if (value == null || value.isEmpty) {
                    return 'City is required';
                  }
                  return null;
                }),

                // Pin Code
                _buildTextField(_pinCodeController, "Pin Code", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pin Code is required';
                  }
                  if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                    return 'Invalid Pin Code';
                  }
                  return null;
                }, TextInputType.number),

                const SizedBox(height: 10),

                // Skills in Game
                _buildTextField(_skillsController, "Skills in Game", (value) {
                  if (value == null || value.isEmpty) {
                    return 'Skills are required';
                  }
                  return null;
                }),

                const SizedBox(height: 10),

                // Upload Achievements PDF
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upload Achievements (PDF)",
                      style: TextStyle(fontSize: 16),
                    ),
                    ElevatedButton(
                      onPressed: _pickPdf,
                      child: const Text("Upload"),
                    ),
                  ],
                ),
                if (_achievementPdf != null)
                  Text(
                    "Selected File: ${_achievementPdf!.path.split('/').last}",
                  ),

                const SizedBox(height: 20),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid
                        print("Profile Saved!");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Profile Saved Successfully!'),
                          ),
                        );
                      }
                    },
                    child: const Text("Save Profile"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom TextField Widget
  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String? Function(String?) validator, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
