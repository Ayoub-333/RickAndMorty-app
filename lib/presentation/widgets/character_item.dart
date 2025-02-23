import 'package:flutter/material.dart';
import 'package:learn_bloc/constants/colors.dart';
import 'package:learn_bloc/constants/strings.dart';
import 'package:learn_bloc/data/models/character_model.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Mycolors.lightTurquoise,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, charactersDetailsScreen,
            arguments: character),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GridTile(
            header: Hero(
              tag: character.charId,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.black54,
                alignment: Alignment.topCenter,
                child: Text(
                  "${character.status} - ${character.species}",
                  style: TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: Mycolors.myWhile,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nexa",
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: Container(
              color: Mycolors.lightSkyBlue,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: character.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        placeholder: "assets/images/Loading.gif",
                        image: character.image,
                        fit: BoxFit.cover,
                      )
                    : Image.asset("assets/images/Place_holder_image.png"),
              ),
            ),
            footer: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                "${character.name}",
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Mycolors.myWhile,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
