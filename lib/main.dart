import 'package:flutter/material.dart';

//global variable for a color
final Color mainColor = Color(0xFFFF5656);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage()
    )
  );
}


//PAGES
//splash page
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MountsApp()));
    });

    return Container(
      color: mainColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.terrain,
              color: Colors.white,
              size: 90,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 80),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//landing page after splash page
class MountsApp extends StatelessWidget {
  const MountsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: mainColor),
        title: Center(
          child: Icon(
            Icons.terrain,
            size: 40,
          ),
        ),
        actions: [
          SizedBox(width: 40, height: 40,)
        ],
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(30),
          color: mainColor,
          alignment: Alignment.bottomLeft,
          child: Icon(
            Icons.terrain,
            color: Colors.white,
            size: 80,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(),
          AppSearch(),
          Expanded(
              child: AppMountListView()
          ),
          AppCategoryList(),
          AppBottomBar()
        ],
      ),
    );
  }
}

//Details page
class  DetailsPage extends StatelessWidget {
  MountModel mount;
  DetailsPage({super.key, required this.mount});

  @override
  Widget build(BuildContext context) {

    var selectedItem = mount;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              selectedItem.path
                            ),
                          fit: BoxFit.cover,
                        ),
                        // borderRadius: BorderRadius.only(
                        //     bottomRight: Radius.circular(20),
                        //   bottomLeft: Radius.circular(20)
                        // )
                      ),
                    ),
                    Positioned.fill(
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7)
                              ],
                              begin: Alignment.center,
                              end: Alignment.bottomCenter
                            )
                          ),
                        )
                    ),
                    Positioned(
                      bottom: 30,
                        left: 30,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedItem.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              selectedItem.location,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                              ),
                            )
                          ],
                        )
                    ),
                    AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      iconTheme: IconThemeData(color: Colors.white),
                      title: Center(
                        child: Icon(
                          Icons.terrain,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      actions: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.pending,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
          ),
          Expanded(
              child: Column(
                children: [
                  DetailsRatingBar(),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                            child: Text(
                              'About ${selectedItem.name}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                            child: Text(
                              '${selectedItem.description}',
                              style: TextStyle(
                                fontSize: 12
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  DetailsBottomActions()
                ],
              )
          )
        ],
      ),
    );
  }
}




//WIDGETS


//Appheader
class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/img.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20,),
          Column(
            children: [
              Text(
                'Hello, Blessing',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Good, Morning',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 12
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AppSearch extends StatelessWidget {
  const AppSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//AppMountListView
class AppMountListView extends StatelessWidget {
  const AppMountListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mountItems.length,
        itemBuilder: (context, index) {

          MountModel currentMount = mountItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailsPage(mount: currentMount))
              );
            },
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(currentMount.path),
                  fit: BoxFit.cover
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      currentMount.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text(
                    currentMount.location,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class AppCategoryList extends StatelessWidget {
  const AppCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                Text(
                    'See More',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(left: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {

              CategoryModel currentCategory = categories[index];
              return Container(
                width: 100,
                margin: EdgeInsets.only(top: 10, right: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      currentCategory.icon,
                      color: mainColor,
                    ),
                    Text(
                      currentCategory.category,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              );
                }
            ),
          )
        ],
      )
    );
  }
}

//AppBottomBar
class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  List<AppBottomBarItem> barItems = [
    AppBottomBarItem(icon: Icons.home, label: 'Home', isSelected: true),
    AppBottomBarItem(icon: Icons.explore, label: 'Explore', isSelected: false),
    AppBottomBarItem(icon: Icons.turned_in_not, label: 'Tag', isSelected: false),
    AppBottomBarItem(icon: Icons.person_outline,label: 'Profile', isSelected: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset.zero
        )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            barItems.length, (index) {
              AppBottomBarItem currentBarItem = barItems[index];

              Widget barItemWidget;
              if(currentBarItem.isSelected) {
                barItemWidget = Container(
                  padding: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: mainColor
                  ),
                  child: Row(
                    children: [
                      Icon(
                        currentBarItem.icon,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        currentBarItem.label,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                );
              } else {
                barItemWidget = IconButton(
                    onPressed: () {
                      setState(() {
                        barItems.forEach((AppBottomBarItem item) {
                          item.isSelected = item == currentBarItem;
                        });
                      });
                    },
                    icon: Icon(
                      currentBarItem.icon
                    )
                );
              }
              return barItemWidget;
        }
        )
      ),
    );
  }
}

//DetailsRatingBar
class DetailsRatingBar extends StatelessWidget {
  //const DetailsRatingBar({Key? key}) : super(key: key);
  
  var sampleRatingData = {
    'Rating': '4.6',
    'Price': '\$12',
    'Open': '24hrs'
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            sampleRatingData.entries.length,
                (index) => Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.2)
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Text(
                        sampleRatingData.entries.elementAt(index).key,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        sampleRatingData.entries.elementAt(index).value,
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                )
        ),
      ),
    );
  }
}

//DetailsBottomActions
class DetailsBottomActions extends StatelessWidget {
  const DetailsBottomActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          children: [
            Expanded(
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: mainColor,
                  child: InkWell(
                    highlightColor: Colors.white.withOpacity(0.2),
                    splashColor: Colors.white.withOpacity(0.2),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(21),
                      child: Text(
                        'Book Now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(
                    color: mainColor,
                  width: 2
                )
              ),
              child: Icon(
                Icons.turned_in_not,
                color: mainColor,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}






//MODELS

class MountModel {
  String path;
  String name;
  String location;
  String description;

  MountModel({
    this.path = '',
    this.name = '',
    this.location = '',
    this.description = ''
});
}

class CategoryModel {
  String category;
  IconData? icon;

  CategoryModel({
    this.category = '',
    this.icon
});
}

class AppBottomBarItem {
  IconData? icon;
  bool isSelected;
  String label;

  AppBottomBarItem({
    this.icon,
    this.label = '',
    this.isSelected = false
});
}


//DATA
final List<MountModel> mountItems = [
  MountModel(
      path: 'assets/images/nyangani.jpg',
      name: 'Mount Nyangani',
      description:
      'Mount Nyangani (formerly Mount Inyangani) is the highest mountain in Zimbabwe at 2,592 metres. The mountain, which is located within Nyanga National Park in Nyanga District, is about 110 km north-west of Mutare. The summit lies atop a small outcrop of rock around 40m above the surrounding area',
      location: 'Mutare'),
  MountModel(
      path:'assets/images/guruguru.jpg',
      name: 'Mount Guruguru',
      description:
      'Guruguru Mountain is a solid dome-shaped volcanic rock in Shurugwi, Zimbabwe, near Pakame Mission. Guruguru, its Shona name, and Nkulunkulu, its Ndebele name, both mean "the biggest". It is by far the highest mountain in the Shurugwi Rural Areas and the Midlands Province of Zimbabwe',
      location: 'Shurugwi'),
  MountModel(
      path: 'assets/images/ngomakurira.jpg',
      name: 'Mount Ngomakurira',
      description:
      'Ngomakurira is known to many Harare residents as an area of intense beauty and great spiritual significance. Many of the hilltops and woodland areas have stone altars that are used by the Zionist churches as places of worship. Only thirty ....',
      location: 'Harare'),
  MountModel(
      path:'assets/images/chimanimani.jpg',
      name: 'Chimanimani mountains',
      description:
      'The Chimanimani Mountains are a mountain range on the border of Zimbabwe and Mozambique. The mountains are in the southern portion of the Eastern Highlands, or Manica Highlands, a belt of highlands that extend north and south along the international border, between the Zambezi and Save rivers',
      location: 'Chimanimani')
];

final List<CategoryModel> categories = [
  CategoryModel(category: 'Mountain', icon: Icons.terrain),
  CategoryModel(category: 'Forest', icon: Icons.park),
  CategoryModel(category: 'Beach', icon: Icons.beach_access),
  CategoryModel(category: 'Hiking', icon: Icons.directions_walk)
];