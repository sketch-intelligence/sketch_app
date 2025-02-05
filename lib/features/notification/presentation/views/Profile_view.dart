import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/notification/presentation/views/follows_view.dart';
import 'package:sketch/translations.dart';

class ProfilePage extends StatelessWidget {
  PersonModel user1 = PersonModel(
    userName: "Katie Lee",
  );
  PersonModel user2 = PersonModel(
    userName: "jena",
  );

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(user1.userName),
            centerTitle: true,
            backgroundColor: Colors.white,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    width: double.infinity,
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg/800px-Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg/800px-Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg'),
                  ),
                ],
              ),
            ),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    user2.userName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Photographer, travelholic, food lover',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.connected,
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.message,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    Assets.imagesDotsThreeVertical,
                    color: Colors.red,
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.posts,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.projects,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserProfilePage(),
                        ));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.follows,
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ProjectCard(
                  title: 'Skyline Tower',
                  description:
                      'A state-of-the-art skyscraper featuring sustainable design.',
                  imageUrl: 'https://via.placeholder.com/150',
                ),
                const ProjectCard(
                  title: 'Luxury Villa',
                  description:
                      'This villa combines modern design with luxury living.',
                  imageUrl: 'https://via.placeholder.com/150',
                ),
                const ProjectCard(
                  title: 'Green Office',
                  description:
                      'An environmentally-conscious workspace promoting sustainability.',
                  imageUrl: 'https://via.placeholder.com/150',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(description),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.viewProject,
                    ),
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
