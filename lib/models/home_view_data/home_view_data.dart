import 'package:flutter/material.dart';

class HomeViewData {
  late String title;
  late String content;
  late Color color;
  late String imagePath;

  HomeViewData({
    required this.title,
    required this.content,
    required this.color,
    required this.imagePath,
  });

  static List<HomeViewData> homeviewData = [
    HomeViewData(
      title: 'Yoga',
      content:
          'Yoga is a sophisticated, age-old discipline that has its roots in Indian philosophy. Although it started out as a spiritual practice, it has gained popularity as a means of fostering both physical and emotional wellbeing.',
      imagePath: 'assets/images_home/yoga_w_sited.png',
      color: Colors.green.shade600,
    ),
    HomeViewData(
      title: 'Vegetables',
      content:
          'Any veggie, or juice made entirely of vegetables, falls under the category of vegetables. Fresh, refrigerated, canned, dried, or cooked vegetables are all acceptable. They may be served whole, chopped, or pureed. Dark green, red and orange, beans, peas, and lentils; starchy; and other veggies are the five subgroups of vegetables that are categorized according to their nutritional value.',
      imagePath: 'assets/images_home/vegetable_w_hart.png',
      color: Colors.lightGreen.shade300,
    ),
    HomeViewData(
      title: 'Sleep',
      content:
          'Sleep is a regular, reversible condition of decreased responsiveness to external stimulation accompanied by intricate and predictable physiologic changes. Among these modifications are variations in hormone levels, relaxation of the musculature, and coordinated, spontaneous, internally produced brain activity.',
      imagePath: 'assets/images_home/sleep_w.png',
      color: Colors.green.shade600,
    ),
    HomeViewData(
      title: 'Meat & Fruit',
      content:
          'Since renowned podcaster Joe Rogan decided to stick to a strict meat-and-fruit diet for an entire month in January of last year, the meat-and-fruit diet has gained popularity. But nothing about this is brand-new or unexpected. In reality, every January, Rogan has been observed adopting a carnivore diet. ',
      imagePath: 'assets/images_home/food_w.png',
      color: Colors.lightGreen.shade300,
    ),
    HomeViewData(
      title: 'Weigth',
      content:
          'Depending on your level of exercise and other variables, your body requires a specific number of calories per day to maintain your current weight. Tell us which one would be ideal for you.',
      imagePath: 'assets/images_home/weigth_w.png',
      color: Colors.green.shade600,
    ),
  ];
}
