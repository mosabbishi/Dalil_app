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
    title: 'أفضل المتاجر و\nمقدمي الخدمات',
    content: 'content',
    image: 'assets/pics/banner2.png',
  ),
  PageViewModel(
    title: '',
    content: '',
    image: 'assets/pics/banner2.png',
  ),
  PageViewModel(
    title: '',
    content: '',
    image: 'assets/pics/banner2.png',
  ),
];
