import 'package:clean_arch_moovz/core/enums.dart';
import 'package:clean_arch_moovz/domain/akatsuki/entities/akatsuki_entity.dart';
import 'package:clean_arch_moovz/presentation/pages/home/viewModels/akatsuki_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AkatsukiView extends StatefulWidget {
  const AkatsukiView({super.key});

  @override
  State<AkatsukiView> createState() => _AkatsukiViewState();
}

class _AkatsukiViewState extends State<AkatsukiView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AkatsukiViewModel>().loadMembers();
    });
  }

  void _showMemberDialog(BuildContext context, AkatsukiEntity member) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(member.name),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (member.images?.isNotEmpty ?? false) ...[
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(member.images!.first),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
              ],
              if (member.debut?.anime != null) ...[
                _buildDialogItem('Anime Debut', member.debut!.anime!),
                const Divider(),
              ],
              if (member.debut?.manga != null) ...[
                _buildDialogItem('Manga Debut', member.debut!.manga!),
                const Divider(),
              ],
              if (member.natureType?.isNotEmpty ?? false) ...[
                _buildDialogItem('Nature Types', member.natureType!.join(', ')),
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
    return Consumer<AkatsukiViewModel>(
      builder: (context, viewModel, child) {
        switch (viewModel.state) {
          case ViewModelState.loading:
            return const Center(child: CircularProgressIndicator());
          case ViewModelState.error:
            return Center(child: Text('Error: ${viewModel.errorMessage}'));
          case ViewModelState.success:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Akatsuki',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: viewModel.members.length,
                    itemBuilder: (context, index) {
                      final member = viewModel.members[index];
                      final firstName = member.name.split(' ').first;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () => _showMemberDialog(context, member),
                          child: SizedBox(
                            width: 70,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: (member.images?.isNotEmpty ?? false)
                                      ? NetworkImage(member.images!.first)
                                      : null,
                                  child: (member.images?.isEmpty ?? true)
                                      ? const Icon(Icons.person, size: 35)
                                      : null,
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
