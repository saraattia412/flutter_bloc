// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/business_logic/cubit/characters_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../data/models/characters.dart';
import '../widgets/character_item.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  List<CharactersModel>? allCharacters;

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = state.characters.results!.cast<CharactersModel>();
        return buildLoadedWidget();
      } else {
        return Center(
          child: Image.asset('assets/images/loader.gif'),
        );
      }
    });
  }

  Widget buildLoadedWidget() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.grey,
        child: Column(
          children: [
            buildCharatersDesign(),
          ],
        ),
      ),
    );
  }

  Widget buildCharatersDesign() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters!.length,
      itemBuilder: ((context, index) {
        return CharacterItem(
            index: index,
            charactersModel: CharactersCubit.git(context).charactersModel!);
      }),
    );
  }

  Widget buildAppBarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: AppColors.grey),
    );
  }

  Widget buildNoInternetConnection() {
    return Center(
      child: Container(
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: 5.h,
            ),
             Text(
              'Can\'t Connect ... Check Internet',
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.grey,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Image.asset('assets/images/warning.png'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        title: buildAppBarTitle(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocWidget();
          } else {
            return buildNoInternetConnection();
          }
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
