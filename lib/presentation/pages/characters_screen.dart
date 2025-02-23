import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/constants/colors.dart';
import 'package:learn_bloc/data/models/character_model.dart';
import 'package:learn_bloc/domain/cubit/character_cubit.dart';
import 'package:learn_bloc/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> bufferList;
  bool _isSearching = false;
  final _searchController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        hintText: "Search for a character",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.black54,
          fontSize: 18,
          fontFamily: "Nexa",
        ),
      ),
      style: TextStyle(fontSize: 18, color: Colors.black54),
      onChanged: (searchedCharacter) {
        searchCharacter(searchedCharacter);
      },
    );
  }

  void searchCharacter(String searchedCharacter) {
    bufferList = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: Colors.black54,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search),
          color: Colors.black54,
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  Widget _buildAppBarTitle() {
    return Text(
      "Characters",
      style: TextStyle(
        color: Colors.black54,
        fontSize: 20,
        fontFamily: "Nexa",
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildBlockWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacters = (state).characters;
          return buildLoadedWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Mycolors.lightSkyBlue,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 10),
      shrinkWrap: true,
      itemCount: _searchController.text.isEmpty
          ? allCharacters.length
          : bufferList.length,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return CharacterItem(
            character: _searchController.text.isEmpty
                ? allCharacters[index]
                : bufferList[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mycolors.warmBeige,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
        leading: _isSearching
            ? BackButton(
                color: Colors.black54,
              )
            : null,
      ),
      body: SafeArea(
        child: buildBlockWidget(),
      ),
    );
  }
}
