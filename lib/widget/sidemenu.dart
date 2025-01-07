import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/white.png',
                        width: 90,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Tunde Babs',
                                style: GoogleFonts.montserrat(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '@tunde_babs',
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.monetization_on,
                    color: Color.fromRGBO(43, 71, 252, 1),
                  ),
                  title: Text('Payments',
                      style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(
                            43,
                            71,
                            252,
                            1,
                          ),
                          fontSize: 19)),
                  onTap: () => {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.compare_arrows,
                    color: Color.fromRGBO(43, 71, 252, 1),
                  ),
                  title: Text('Transactions',
                      style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(
                            43,
                            71,
                            252,
                            1,
                          ),
                          fontSize: 19)),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.payment,
                    color: Color.fromRGBO(43, 71, 252, 1),
                  ),
                  title: Text(
                    'My Cards',
                    style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(
                          43,
                          71,
                          252,
                          1,
                        ),
                        fontSize: 19),
                  ),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.label,
                    color: Color.fromRGBO(43, 71, 252, 1),
                  ),
                  title: Text('Promotions',
                      style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(
                            43,
                            71,
                            252,
                            1,
                          ),
                          fontSize: 19)),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.savings,
                    color: Color.fromRGBO(43, 71, 252, 1),
                  ),
                  title: Text('Savings',
                      style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(
                            43,
                            71,
                            252,
                            1,
                          ),
                          fontSize: 19)),
                  onTap: () => {Navigator.of(context).pop()},
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromRGBO(39, 67, 253, 1),
              side: const BorderSide(color: Color.fromRGBO(39, 67, 253, 1)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              fixedSize: const Size(250, 80),
            ),
            child: Row(
              children: [
                Text(
                  'Sign Out',
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: const Color.fromRGBO(39, 67, 253, 1)),
                ),
                const SizedBox(
                  width: 70,
                ),
                const Icon(Icons.logout)
              ],
            ),
          )
        ],
      ),
    );
  }
}
