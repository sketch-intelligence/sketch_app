import 'package:flutter/material.dart';
import 'package:sketch/features/design/data/model/similar_desgin.dart';

class SimilarDesignItem extends StatelessWidget {
  final SimilarDesgin design;

  const SimilarDesignItem({super.key, required this.design});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: Container(
        width: 350,
        height: 550,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  design.imageUrl ?? '',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.broken_image,
                          size: 50, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                design.imageName ?? "Unknown Image",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "Similarity Score: ${(design.similarityScore ?? 0).toStringAsFixed(2)}",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
