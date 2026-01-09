import 'package:clean_arch_moovz/core/enums.dart';
import 'package:clean_arch_moovz/domain/characters/entities/character_entity.dart';
import 'package:clean_arch_moovz/presentation/pages/home/viewModels/characters_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharacterViewModel>().loadCharacters();
    });
  }

  void _showCharacterDialog(BuildContext context, CharacterEntity character) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(character.name),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (character.images?.isNotEmpty ?? false) ...[
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(character.images!.first),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
              ],
              if (character.personal?.clan?.isNotEmpty ?? false) ...[
                _buildDialogItem('Clan', character.personal!.clan!.join(', ')),
                const Divider(),
              ],
              if (character.personal?.sex != null) ...[
                _buildDialogItem('Sex', character.personal!.sex!),
                const Divider(),
              ],
              if (character.personal?.birthdate != null) ...[
                _buildDialogItem('Birthdate', character.personal!.birthdate!),
                const Divider(),
              ],
              if (character.personal?.affiliation?.isNotEmpty ?? false) ...[
                _buildDialogItem('Affiliation', character.personal!.affiliation!.join(', ')),
                const Divider(),
              ],
              if (character.natureType?.isNotEmpty ?? false) ...[
                _buildDialogItem('Nature Types', character.natureType!.join(', ')),
                const Divider(),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterViewModel>(
      builder: (context, viewModel, child) {
        switch (viewModel.state) {
          case ViewModelState.loading:
            return const Center(child: CircularProgressIndicator());
          case ViewModelState.error:
            return Center(child: Text('Error: ${viewModel.errorMessage}'));
          case ViewModelState.success:
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'All Characters',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: viewModel.characters.length > 20
                        ? 20
                        : viewModel.characters.length,
                    itemBuilder: (context, index) {
                      final character = viewModel.characters[index];
                      final firstName = character.name.split(' ').first;
                      return GestureDetector(
                        onTap: () => _showCharacterDialog(context, character),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: (character.images?.isNotEmpty ?? false)
                                    ? NetworkImage(character.images!.first)
                                    : null,
                                child: (character.images?.isEmpty ?? true)
                                    ? const Icon(Icons.person, size: 35)
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              firstName,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: viewModel.currentPage > 1
                            ? () => viewModel.previousPage()
                            : null,
                        child: const Text('Prev'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Page ${viewModel.currentPage}'),
                      ),
                      ElevatedButton(
                        onPressed: () => viewModel.nextPage(),
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}