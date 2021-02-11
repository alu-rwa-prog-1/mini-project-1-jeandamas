import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const primaryColor = Color(0xFF784421);
const primaryTextColor = Color(0xFFEA430F);
const primaryBackgroundColor = Color(0xFFFFFFFF);

const double padding18 = 25.0;
main() {
  runApp(Store());
}

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      theme: ThemeData(
        scaffoldBackgroundColor: primaryBackgroundColor,
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: primaryTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StoreHome(),
    );
  }
}

class StoreHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),color: Colors.white,
        onPressed: () {},
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provide us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "TopSale", press: () {}),
          TopSeller(),
          TitleWithMoreBtn(title: "Featured Products", press: () {}),
          FeaturedProducts(),
          SizedBox(height: padding18),
        ],
      ),
    );
  }
}

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      //container that consist of all sections above products
      margin: EdgeInsets.only(bottom: padding18 * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: padding18,
              right: padding18,
              bottom: 36 + padding18,
            ),
            height: size.height,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'It\'s Friday Yay🤗',
                  //Home page title
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            //search bar positioning
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: padding18),
              padding: EdgeInsets.symmetric(horizontal: padding18),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: primaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: primaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding18),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          Spacer(),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: primaryColor,
            onPressed: press,
            child: Text(
              "More",
              //more button above the product listing category
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: padding18 / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(right: padding18),
              height: 7,
              color: primaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}

class TopSeller extends StatelessWidget {
  const TopSeller({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          TopSell(
            image: "assets/images/avocado.jpg",
            title: "Avocado",
            location: "Kigali",
            price: 440,
          ),
          TopSell(
            image: "assets/images/chicken.jpg",
            title: "Chicken",
            location: "Kigali",
            price: 440,
          ),
          TopSell(
            image: "assets/images/avocado.jpg",
            title: "Avocado",
            location: "Kigali",
            price: 440,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class TopSell extends StatelessWidget {
  const TopSell({
    Key key,
    this.image,
    this.title,
    this.location,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, location;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: padding18,
        top: padding18 / 2,
        bottom: padding18 * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(padding18 / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: primaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$location".toUpperCase(),
                          style: TextStyle(
                            color: primaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Rwf $price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: primaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturedProductsCard(
            image: "assets/images/chicken.jpg",
            press: () {},
          ),
          FeaturedProductsCard(
            image: "assets/images/chicken2.jpg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class FeaturedProductsCard extends StatelessWidget {
  const FeaturedProductsCard({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: padding18,
          top: padding18 / 2,
          bottom: padding18 / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}