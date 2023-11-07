import 'package:flutter/material.dart';

class RinDashboard extends StatefulWidget {
  @override
  _RinDashboardState createState() => _RinDashboardState();
}

class _RinDashboardState extends State<RinDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                'Ini adalah halaman dashboard',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Cari',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              DashboardCard(
                title: 'Index Masa Tubuh',
                subtitle: 'Deskripsi Index Masa Tubuh',
                onPressed: () {
                  Navigator.pushNamed(context, '/masatubuh');
                },
              ),
              DashboardCard(
                title: 'Energi Basal',
                subtitle: 'Deskripsi Energi Basal',
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
              ),
              DashboardCard(
                title: 'Energi Expenditure',
                subtitle: 'Deskripsi Energi Expenditure',
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  DashboardCard({
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  'Cek Selengkapnya',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
