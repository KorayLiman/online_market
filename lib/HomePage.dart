import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:online_market/DetailsPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  int _sliderindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Alışverişe başla",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 14),
            child: Stack(children: [
              Icon(Icons.shopping_bag),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: const Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Kategoriler"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Ara"),
          BottomNavigationBarItem(
              icon: Icon(Icons.discount), label: "Fırsatlar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "Profil")
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Container(
                height: 200,
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      _sliderindex = value;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://static.dw.com/image/45954922_401.jpg"),
                                fit: BoxFit.fill))),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.orange,
                    ),
                    Container(
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                left: MediaQuery.of(context).size.width / 3,
                child: SliderIndicator(
                    length: 5,
                    activeIndex: _sliderindex,
                    indicator: Icon(
                      Icons.circle,
                      color: Colors.grey.shade500,
                      size: 20,
                    ),
                    activeIndicator: Icon(
                      Icons.circle,
                      color: Colors.grey.shade300,
                      size: 20,
                    )),
              )
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Meyve & Sebze",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Tümünü gör",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
              )
            ],
          ),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 16 / 26,
            shrinkWrap: true,
            crossAxisCount: 3,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: "anim",
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                  ItemName: "Elma",
                                  ItemCost: "10.99 TL",
                                  ImageUrl:
                                      "https://ayb.akinoncdn.com/products/2021/06/18/7827/73061620-37a9-444e-9d8d-1442ea2c1178_size780x780_quality60_cropCenter.jpg"),
                            )),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://ayb.akinoncdn.com/products/2021/06/18/7827/73061620-37a9-444e-9d8d-1442ea2c1178_size780x780_quality60_cropCenter.jpg"),
                                  fit: BoxFit.fill),
                              border: Border.all(width: 1, color: Colors.grey)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: const Text(
                        "Elma",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: const Text(
                        "1 kilo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "12.99 TL",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "10.99 TL",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://www.turktarim.gov.tr/img/HaberResimleri/456/700/anavatani-anadolu-olan-saglik-deposu-kuskonmaz.jpg"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: const Text(
                        "Kuşkonmaz",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: const Text(
                        "1 kilo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "8.99 TL",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "5.99 TL",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.aftamarket.com.tr/meyve-63-meyveler-manav-12419-17-K.jpg"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: const Text(
                        "Ananas",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: const Text(
                        "1 adet",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "15.99 TL",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "13.99 TL",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Et & Tavuk",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 16 / 26,
            shrinkWrap: true,
            crossAxisCount: 3,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.etineniyisi.com/Uploads/UrunResimleri/kuzu-az-yagli-kiyma-1f-4f9.jpg"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: const Text(
                        "Kıyma",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: const Text(
                        "1 kilo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "91.99 TL",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "88.99 TL",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://atilganet.com.tr/wp-content/uploads/2020/04/Ku%C5%9Fba%C5%9F%C4%B1-1-600x338.jpg"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: const Text(
                        "Kuşbaşı",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: const Text(
                        "1 kilo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "89.99 TL",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "84.99 TL",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://imgrosetta.mynet.com.tr/file/10289769/10289769-728xauto.jpg"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: const Text(
                        "Tavuk göğüs",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: const Text(
                        "1 kilo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "43.99 TL",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: const Text(
                            "40.99 TL",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
