import "package:flutter/material.dart";

import "package:flu_avm/config/config.dart";

class ProjectScreen extends StatelessWidget {
  final int index;

  const ProjectScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final project = projectList[index];
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
          ],
        ),
      ),
    );
  }
}