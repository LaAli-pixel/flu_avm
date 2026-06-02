import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "package:flu_avm/config/config.dart";
import "package:flu_avm/presentation/providers/providers.dart";

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      appBar: AppBar(
      title: const Text('Mis Proyectos'),
      actions: [
          IconButton(
          onPressed: () {
          ref.read(estTenebrisModusProvider.notifier).state =
                  !estTenebrisModus;
          },
          icon: Icon(
            estTenebrisModus
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
          ),
          ),
        ],
      ),
      body: const _ProjectsView(),
    );
  }
}

class _ProjectsView extends StatelessWidget {
  const _ProjectsView();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: projectList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final project = projectList[index];
        return _ProjectCard(project: project, index: index);
      },
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final int index;

  const _ProjectCard({
    required this.project,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colorum = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        context.push('/projects/$index');
      },
 child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (project.imago != null)
              Image(
                image: AssetImage(project.imago!),
                fit: BoxFit.cover,
              ),
            if (project.imago != null)
              Container(color: Colors.black.withAlpha(90)),
              Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: project.imago != null
                   ? Colors.white.withAlpha(220)
                   : colorum.primary.withAlpha(60),
                child: Icon(project.icon, color: colorum.primary),
              ),
              const Spacer(),
              Text(
                project.titulus,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                project.subtitulus,
                style: TextStyle(
                  fontSize: 13,
                  color: colorum.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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