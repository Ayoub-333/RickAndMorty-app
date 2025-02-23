import 'package:flutter/material.dart';
import 'package:learn_bloc/constants/colors.dart';
import 'package:learn_bloc/data/models/character_model.dart';
import 'package:learn_bloc/data/models/episode_model.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  late List<Episode> episode;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      centerTitle: true,
      backgroundColor: Mycolors.lightTurquoise,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.character.name,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: "Nexa",
          ),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: widget.character.charId,
          child: Image.network(
            widget.character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Nexa",
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: "Nexa",
            ),
          )
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Mycolors.warmBeige,
      thickness: 5,
      height: 20,
      endIndent: endIndent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.myWhile,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            buildSliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        characterInfo("Name : ", widget.character.name),
                        buildDivider(315),
                        characterInfo("Status : ", widget.character.status),
                        buildDivider(310),
                        characterInfo("Species : ", widget.character.species),
                        buildDivider(300),
                        characterInfo("Gender : ", widget.character.gender),
                        buildDivider(300),
                        SizedBox(
                          height: 1000,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
