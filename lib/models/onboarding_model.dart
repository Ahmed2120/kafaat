class OnBoardingModel {
  final String backgroundPath;
  final String imagePath;
  final String title;
  final String lastTitle;
  final String lastWord;
  final String description;
  final String secondaryDescription;

  OnBoardingModel({
    required this.backgroundPath,
    required this.imagePath,
    required this.lastWord,
    required this.lastTitle,
    required this.title,
    required this.description,
    required this.secondaryDescription,
  });
}


List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    backgroundPath: '1_b',
    imagePath: '1',
    title: 'Lorem Ipsum is simply',
    lastWord: 'text?',
    lastTitle: 'dummy',
    description: 'Welcome !!! Do you want to clear task super',
    secondaryDescription: ' fast with Mane?',
  ),
  OnBoardingModel(
    backgroundPath: '2_b',
    imagePath: '2',
    title: 'Lorem Ipsum is simply',
    lastTitle: 'dummy',
    lastWord: 'text?',
    description: 'Easily arrange work order for you to mange.',
    secondaryDescription: ' Many functions to choose.',
  ),
];