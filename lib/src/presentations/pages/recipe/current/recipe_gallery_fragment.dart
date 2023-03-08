import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/config/theme/main.dart';
import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import '../../../../data/models/local/detected_object.dart';
import '../../../blocs/recipe_gallery/create_recipe_shot.dart';
import '../../../blocs/recipe_gallery/gallery_by_recipe.dart';
import '../gallery/create_recipe_shot_page.dart';
import '../gallery/image_gallery_list_page.dart';

class RecipeGalleryFragment extends StatelessWidget {
  const RecipeGalleryFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = context.watch<GalleryListByRecipeCubit>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (listState.isLoading)
          const SizedBox(
            height: 150,
            child: Center(child: CircularProgressIndicator()),
          ),
        if (!listState.isLoading && listState.list.isNotEmpty)
          SizedBox(
            height: 150,
            child: (ListView.builder(
              itemBuilder: (context, index) {
                var item = listState.list[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ImageGalleryListPage(
                          image: listState.list,
                          currentIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image.memory(item.data),
                  ),
                );
              },
              itemCount: listState.list.length,
              scrollDirection: Axis.horizontal,
            )),
          ),
        ElevatedButton.icon(
          onPressed: () {
            context.read<CreateRecipeShotCubit>().createShot().then((value) {
              if (value?.image != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                            value: context.read<CreateRecipeShotCubit>()),
                        BlocProvider.value(
                            value: context.read<GalleryListByRecipeCubit>()),
                      ],
                      child: const CreateRecipeShotPage(),
                    ),
                  ),
                );
              }
            });
          },
          label: const Text(
            'Добавить изображение',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          icon: const Icon(
            Icons.camera_alt_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}


