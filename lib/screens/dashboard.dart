import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_application/widget/dashboard_button.dart';
import 'package:money_application/widget/sidemenu.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(73, 96, 249, 1),
                Color.fromRGBO(25, 55, 254, 1)
              ],
            ),
          ),
        ),
      ),
      drawer: const Drawer(
    
        child:  NavDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(73, 96, 249, 1),
                    Color.fromRGBO(25, 55, 254, 1)
                  ],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(70),
                ),
              ),
              height: 200,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 40, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Good morning,\n Grace,',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                 const Padding(
                    padding: EdgeInsets.only(bottom:130, right: 25),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/white.png'), // Example profile image
                      radius: 30,
                    ),
                  ),
                ],
              ),
            ),
            // Floating Card
            Transform.translate(
              offset: const Offset(0, -50),
              child: SizedBox(
                height: 300,
                child: Card(
                  elevation: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                   
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Your total balance',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '€8500,00',
                          style: GoogleFonts.montserrat(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Placeholder for the chart or graph
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          // Example color for the chart area
                          child: Center(
                            child: Text(
                              'Chart Area',
                              style: GoogleFonts.montserrat(color: Colors.blue[700]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            DashboardButton(text: '          Check your\n          bank accounts', height: 150, width: 350),
            const SizedBox(height: 50),
           BottomNavigationBar(items:const[
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Account'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
           ] , currentIndex: 0, onTap: (index) {
          
           }),
          ],
        ),
      ),
    );
  }
}