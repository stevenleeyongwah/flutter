import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  bool _isFingerprintEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 166, 8, 171),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
            
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),

                  SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Steven',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        'Edit profile',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  side: const BorderSide(color: Colors.purpleAccent),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Log out', style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 32),
              
              _buildSectionTitle('MY ACCOUNT'),
              
              const SizedBox(height: 8),

              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                title: const Text('View account details', style: TextStyle(color: Colors.white)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16, // Set the desired size here
                ),
                onTap: () {},
                tileColor: const Color(0xFF1C1C3A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10), // Top left corner
                    topRight: Radius.circular(10), // Top right corner
                  ),
                ),
              ),
              
              const SizedBox(height: 0.5),

              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                title: const Text('Manage DuitNow ID', style: TextStyle(color: Colors.white)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16, // Set the desired size here
                ),
                onTap: () {},
                tileColor: const Color(0xFF1C1C3A)
              ),

              const SizedBox(height: 0.5),

              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                title: const Text('Change limits', style: TextStyle(color: Colors.white)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16, // Set the desired size here
                ),
                onTap: () {},
                tileColor: const Color(0xFF1C1C3A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10), // Bottom left corner
                    bottomRight: Radius.circular(10), // Bottom right corner
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildListTile({required String title, Widget? trailing, VoidCallback? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: onTap,
      tileColor: const Color(0xFF1C1C3A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}