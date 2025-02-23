import 'package:learn_bloc/data/datasources/episode_api.dart';
import 'package:learn_bloc/data/models/episode_model.dart';

class EpisodeRepository {
  final EpisodeApi episodeApi;

  EpisodeRepository(this.episodeApi);

  Future<List<Episode>> getAllEpisodes() async {
    final episode = await episodeApi.getAllEpisodes();

    return episode.map((episode) => Episode.fromJson(episode)).toList();
  }
}

// void main() async {
//   final episodeApi = EpisodeApi();
//   final episodeRepository = EpisodeRepository(episodeApi);

//   try {
//     final episodes = await episodeRepository.getAllEpisodes();
//     print("Fetched Characters: ");
//     for (var episode in episodes) {
//       print("Name: ${episode.name}, air date: ${episode.airDate}");
//     }
//   } catch (e) {
//     print("Error fetching characters: $e");
//   }
// }

