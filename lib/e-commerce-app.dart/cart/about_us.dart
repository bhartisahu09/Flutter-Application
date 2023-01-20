import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
       
        title: const Text(
          "About Us",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Card(
                    elevation: 40,
                    margin: EdgeInsets.all(20.0),
                    child: Text(
                      "Ever wanted to buy a book but could not because it was too expensive? worry not! because BookStore is here! BookStore, these days in news,is being called as the Robinhood of the world of books. BookStore team is committed to bring to you all kinds of best books at the minimal prices ever seen anywhere. Yes, we are literally giving you away a steal.",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 0,
                    child: Text(
                      "CONTACT US",
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 25,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/img4.jpg')),
                      title: Text(
                        'VIKASH CHAUHAN',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 127, 167, 199)),
                      ),
                      subtitle: Text('vikash.chauhan@kelltontech.com'),
                    ),
                  ),
                  const Card(
                    elevation: 25,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/img8.jpg')),
                      title: Text(
                        'NEDDHE RAPARIA',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 127, 167, 199)),
                      ),
                      subtitle: Text('neddhe.raparia@kelltontech.com'),
                    ),
                  ),
                  const Card(
                    elevation: 25,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/img9.jpg')),
                      title: Text(
                        'BHARTI SAHU',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 132, 164, 190)),
                      ),
                      subtitle: Text('bharti.sahu@kelltontech.com'),
                    ),
                  ),

           const SizedBox(
             height: 150,
           ),
                  Card(
                    elevation: 0,
                    child: CurvedNavigationBar(
                    
                      buttonBackgroundColor: Colors.grey,
                        backgroundColor: Color.fromARGB(255, 170, 197, 243),
                        items: const [
                          Icon(Icons.phone, size: 20.0),
                          Icon(Icons.email, size: 20.0),
                          Icon(Icons.facebook, size: 20)
                        ],
                    ),
                  ),
                ],
              )
              );
            
          }),
    );
  }
}
