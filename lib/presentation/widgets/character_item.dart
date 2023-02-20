import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/constants/colors.dart';
import 'package:flutter_bloc_app/constants/strings.dart';
import 'package:flutter_bloc_app/data/models/characters.dart';
import 'package:flutter_bloc_app/router.dart';


class CharacterItem extends StatelessWidget {
  const CharacterItem(
      {super.key, required this.charactersModel, required this.index});

  final CharactersModel charactersModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.
          pushNamed(context,
           AppStrings.charactersDetailsScreen,
           arguments:Data(index: index, charactersModel: charactersModel),
          );
        },
        child: GridTile(
          footer: Hero(
            tag: charactersModel.results![index].id!,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              color: Colors.black54,
              alignment: AlignmentDirectional.bottomCenter,
              child: Text(
                charactersModel.results![index].name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.1,
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          child: Container(
              color: AppColors.grey,
              child: charactersModel.results![index].image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loader.gif',
                      image: charactersModel.results![index].image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/loader.gif')),
        ),
      ),
    );
  }
}
