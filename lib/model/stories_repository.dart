import 'package:story_app/widgets/main_menu.dart';

import '../story_choice_page.dart';
import 'story.dart';

class StoriesRepository {
  static List<Story> stories = [
    Story(
        id: 0,
        name: 'Let Me a Legend',
        imageUrl: 'assets/images/let-me-a-legend.jpeg',
        page: const MainMenuPage()),
    Story(
        id: 1,
        name: 'Mary',
        imageUrl: 'assets/images/training-area.jpeg',
        page: const StoryChoicePage()),
    Story(
        id: 2,
        name: 'Tom',
        imageUrl: 'assets/images/yatakhane.jpeg',
        page: const StoryChoicePage()),
    Story(
        id: 3,
        name: 'Jane',
        imageUrl: 'assets/images/yemekhane.jpeg',
        page: const MainMenuPage()),
    Story(
        id: 4,
        name: 'Mike',
        imageUrl: 'assets/images/yatakhane.jpeg',
        page: const MainMenuPage()),
  ];
  static List<Story> loadStories() {
    return stories;
  }
}
