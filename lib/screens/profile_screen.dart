import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/bottom_navigation_bar.dart';
import 'package:flutter_basic/screens/home_screen.dart';
import 'package:flutter_basic/screens/login_screen.dart';
import 'package:flutter_basic/screens/profil_manage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> profileOptions = [
    {'text': 'Kelola Akun', 'icon': Icons.manage_accounts},
    {'text': 'Notifikasi', 'icon': Icons.notifications},
    {'text': 'Kebijakan Privasi', 'icon': Icons.privacy_tip},
    {'text': 'Ketentuan Layanan', 'icon': Icons.description},
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      setState(() {
        _selectedIndex = index;
      });
    } else if (index == 2) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  void _onProfileOptionTap(String option) {
    if (option == 'Kelola Akun') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilManage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://via.placeholder.com/150',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Nama Lengkap: Gilang',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Card(
                elevation: 4,
                margin: EdgeInsets.only(top: 8.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text('Email: gilang@gmail.com'),
                      ),
                      ListTile(
                        title: Text('Alamat: Yogyakarta'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edit Profil'),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: profileOptions.length,
                itemBuilder: (context, index) {
                  String optionText = profileOptions[index]['text'];
                  IconData optionIcon = profileOptions[index]['icon'];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(optionIcon),
                      title: Text(optionText),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () => _onProfileOptionTap(optionText),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class KelolaAkunScreen extends StatelessWidget {
  const KelolaAkunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kelola Akun"),
      ),
      body: Center(
        child: const Text("Kelola Akun Content Here"),
      ),
    );
  }
}
