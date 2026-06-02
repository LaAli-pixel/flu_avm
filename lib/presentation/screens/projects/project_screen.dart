import "package:flutter/material.dart";

import "package:flu_avm/config/config.dart";
import "package:go_router/go_router.dart";

class ProjectScreen extends StatefulWidget {
  final int index;

  const ProjectScreen({super.key, required this.index});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  bool monstratScheda = false;

  @override
  Widget build(BuildContext context) {
    final project = projectList[widget.index];
    final colorum = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(project.titulus),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    monstratScheda = !monstratScheda;
                  });
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: colorum.primary.withAlpha(60),
                  child: Icon(
                    project.icon,
                    size: 50,
                    color: colorum.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Toca el icono para ver la ficha técnica',
                style: TextStyle(
                  fontSize: 12,
                  color: colorum.onSurfaceVariant,
                ),
              ),
            ),
            if (monstratScheda && project.schedaTechnica != null)
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorum.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  project.schedaTechnica!,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
              ),
            const SizedBox(height: 24),
            Text(
              project.titulus,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              project.subtitulus,
              style: TextStyle(
                fontSize: 16,
                color: colorum.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              project.descriptio,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            if (project.technologiae.isNotEmpty) ...[
              const Text(
                'Medios',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
 Wrap(
                spacing: 8,
                runSpacing: 8,
                children: project.technologiae
                    .map((tech) => Chip(label: Text(tech)))
                    .toList(),
              ),
            ],
            if (project.habetTabulam) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () {
                  context.push('/projects/${widget.index}/tabula');
                },
                icon: const Icon(Icons.touch_app_outlined),
                label: const Text('Explorar el collar'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}