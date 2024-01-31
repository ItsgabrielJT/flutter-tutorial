import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourists Places', textAlign: TextAlign.center ),
      ),
    
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('places').get(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }

          if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }

          // Obtener los datos de Firestore
          final places = snapshot.data!.docs;

          return SingleChildScrollView(
            child: Column(
              children: places.map((place){
                final data = place.data() as Map<String, dynamic>;
                return Column(
                  children:[
                    ImageSection(image: data['image']),
                    TitleSection(name: data['name'], location: data['location']),
                    ButtonSection(),
                    TextSection(description: data['description']),
                  ],
                );
              }).toList(),
            ),
          );
        }
      ),
      // body: const SingleChildScrollView(
      //       child: Column(
      //     children: [
      //       ImageSection(image: 'images/catedral.jpg'),
      //       TitleSection(
      //           name: "Iglesia de la Catedral",
      //           location: "Quito"), //Title section
      //       ButtonSection(),
      //       TextSection(
      //           description:
      //               'La Catedral Metropolitana y Primada de Quito se ubica junto a la plaza de la independencia en la capital de todos los ecuatorianos. Es un tesoro arquitectónico y espiritual en Ecuador. En este artículo, exploraremos la fascinante historia, la impresionante arquitectura y el valor cultural de esta majestuosa catedral, mientras abordamos los aspectos comunes que la gente busca sobre ella.'),

      //       TitleSection(
      //           name: "La Carolina", location: "Quito"), //Title section
      //       ButtonSection(),
      //       ImageSection(image: 'images/carolina.jpg'),
      //       TextSection(
      //           description:
      //               'El distrito comercial central de La Carolina está rodeado del parque del mismo nombre, con un lago para navegar, jardines botánicos con orquídeas y bromelias autóctonas, y un museo de dinosaurios. Los modernos centros comerciales El Jardín y CCI albergan boutiques de moda y cafeterías. Algunos de los bares de la zona cuentan con karaoke o tienen presentaciones de música en vivo, y la animada escena gastronómica está orientada a los restaurantes italianos y ecuatorianos de moda.'),

      //       TitleSection(
      //           name: "El Panecillo", location: "Quito"), //Title section
      //       ButtonSection(),
      //       ImageSection(image: 'images/panecillo.jpg'),
      //       TextSection(
      //           description:
      //               'El Panecillo es una elevación natural de 3.000 metros sobre el nivel del mar, (200 metros más alto que el promedio de la ciudad de Quito) enclavada en el corazón mismo de la ciudad de Quito (Ecuador). Es el sitio más visitado de la ciudad. Por su ubicación se ha convertido en el más importante mirador natural de la ciudad, desde el que se puede apreciar la disposición urbana de la capital ecuatoriana, desde su centro histórico y hacia los extremos norte y sur. El Panecillo está coronado por una escultura gigante de aluminio de la «Virgen de Quito», creada por el español Agustín de la Herrán Matorras, el cual se basó en la obra compuesta por Bernardo de Legarda, uno de los más importantes representantes de la Escuela quiteña.'),

      //       TitleSection(
      //           name: "La Guaragua", location: "Quito"), //Title section
      //       ButtonSection(),
      //       ImageSection(image: 'images/guaragua.jpg'),
      //       TextSection(
      //           description:
      //               'En el Quito de 1920-1930, hasta el siglo XX, hablar de La Guaragua era referirse a un barrio ideal, porque lo frecuentaban pintores, bohemios y enamorados. La segunda cuadra de la calle Vargas, conocida como La Guaragua, entre Esmeraldas y Oriente, era el lugar de reunión de los artistas de la época. En una estrofa de la canción ‘El chulla quiteño’, se menciona a esta tradicional calle, que actualmente es conocida como Galápagos. Todas las casas tienen la arquitectura colonial y republicana, con balcones tallados. Los registros históricos muestran que la calle se muestra en un mapa de la ciudad hecho en 1922. En quechua, guaragua es lugar pintoresco.'),

      //       TitleSection(name: "La Ronda", location: "Quito"), //Title section
      //       ButtonSection(),
      //       ImageSection(image: 'images/ronda.jpg'),
      //       TextSection(
      //           description:
      //               'El centro colonial de Quito guarda un sinfín de secretos. Jardines interiores en sus casas de estilo español que solo se ven a través de puertas entreabiertas. Antiguos almacenes donde los zapateros aún reparan calzado. Restaurantes que sirven dulces y repostería tradicional ecuatoriana. Casonas antiguas que alguna vez sirvieron como punto de encuentro de algunos de los más destacados libertadores sudamericanos. y no muy lejos de Casa Gangotena ? el hotel perfectamente situado dentro de este Patrimonio de la Humanidad? es una calle donde los poetas más famosos de Ecuador solían reunirse para compartir sus puntos de vista sobre la vida, el amor, la política y la religión. Camine hasta la calle Juan de Dios Morales, mejor conocida como La Ronda, para obtener una verdadera sensación de Quito de una sola vez, completa e intensa.')
      //     ],
      //   )),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    // #docregion Image-asset
    return Image.network(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
    // #enddocregion Image-asset
  }
}
// #enddocregion ImageSection

// #docregion FavoriteWidget
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}
// #enddocregion FavoriteWidget

// #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isFavorited = false;
  int _favoriteCount = 0;

  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  // #enddocregion _toggleFavorite

  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
// #docregion _FavoriteWidgetState-fields
}