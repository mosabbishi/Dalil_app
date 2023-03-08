import 'package:dalil_app/constant/constants.dart';

class PageViewModel {
  final String title;
  final String content;
  final String image;

  PageViewModel({
    required this.title,
    required this.content,
    required this.image,
  });
}

final List<PageViewModel> pageViewItems = [
  PageViewModel(
    title: '1',
    content: 'content',
    image: Constants.img,
  ),
  PageViewModel(
    title: '1',
    content: 'content',
    image: Constants.img,
  ),
  PageViewModel(
    title: '1',
    content: 'content',
    image: Constants.img,
  ),
];
