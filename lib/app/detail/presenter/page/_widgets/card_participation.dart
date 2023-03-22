import 'package:flutter/material.dart';
import 'package:marvels/app/list/domain/entities/characters_tumb.dart';

class CardParticipation extends StatelessWidget {
  const CardParticipation({
    required this.image,
    required this.name,
    Key? key,
  }) : super(key: key);

  final CharactersThumb? image;
  final String name;

  @override
  Widget build(BuildContext context) {
    String? img = image?.path;
    img = img != ''
        ? "$img.${image?.extension}"
        : 'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/51B+S8JiAaL._SY346_.jpg';

    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 130,
                  height: 200,
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 130,
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 9,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
