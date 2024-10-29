import '../models/model.dart';

List<Map<String, dynamic>> festivalName = [
  {
    'name': 'Makar Sankranti',
    'day': 'Wednesday',
    'month': 'January',
    'date': '14',
    'description':
        " Makar Sankranti is the celebration of the sun's journey from the Southern to the Northern Hemisphere and is considered an auspicious time.",
    'religion': 'Hinduism'
  },
  {
    'name': 'Independence Day',
    'day': 'Thursday',
    'month': 'August',
    'date': '15',
    'description':
        "The Independence Day is celebrated on August 15 every year to commemorate India's freedom from the British rule in 1947.",
    'religion': 'Hinduism'
  },
  {
    'name': 'Holi',
    'day': 'Monday',
    'month': 'March',
    'date': '18',
    'description':
        'Holi, Hindu spring festival celebrated in India and Nepal on the full-moon day of Phalguna.',
    'religion': 'Hinduism'
  },
  {
    'name': 'Raksha Bandhan',
    'day': 'Thursday',
    'month': 'August',
    'date': '22',
    'description':
        'Rakhsha Bandhan is defined as the safety bond that shows the purity and bonding between siblings.',
    'religion': 'Hinduism'
  },
  {
    'name': 'Mahatma Gandhi Jayanti',
    'day': 'Wednesday',
    'month': 'october',
    'date': '2',
    'description':
        'Gandhi Jayanti is celebrated on 2nd October every year and honours the life and principles of Mahatma Gandhi.',
    'religion': 'Hinduism'
  },
  {
    'name': 'Ram Navami',
    'day': 'Sunday',
    'month': 'April',
    'date': '10',
    'description':
        'This festival celebrates the birth of Lord Rama who is an incarnation of Lord Vishnu.',
    'religion': 'Hinduism'
  },
  {
    'name': 'Ganesh Chaturthi',
    'day': 'Friday',
    'month': 'September',
    'date': '22',
    'description':
        'Ganesh Chaturthi is a 10-day Hindu festival that celebrates the birth of Lord Ganesha, the god of new beginnings, wisdom, and prosperity.',
    'religion': 'Hinduism'
  },
  {
    'name': 'Navratri',
    'day': 'Thursday',
    'month': 'october',
    'date': '3',
    'description':
        'Navratri, in Hinduism, major festival held in honour of the divine feminine.',
    'religion': 'Hinduism'
  },
  {
    'name': 'Durga Ashtami',
    'day': 'Friday',
    'month': 'october',
    'date': '11',
    'description':
        'That celebrates the victory of the goddess Durga over the demon Mahishasura and the triumph of good over evil.',
    'religion': 'Hinduism'
  },
  {
    'name': 'Dussehra',
    'day': 'Saturday',
    'month': 'october',
    'date': '12',
    'description':
        'Dussehra is celebrated to mark the victory of good over evil.',
    'religion': 'Hinduism'
  },
  {
    'name': 'Diwali',
    'day': 'Friday',
    'month': 'November',
    'date': '1',
    'description':
        'Diwali is a major Hindu festival that symbolizes the victory of light over darkness, good over evil, and knowledge over ignorance',
    'religion': 'Hinduism'
  },
  {
    'name': 'Lakshmi Puja',
    'day': 'Friday',
    'month': 'November',
    'date': '1',
    'description':
        'The puja is done on the third day of Tihar and is considered as the main event of Deepawali.',
    'religion': 'Hinduism'
  },
  {
    'name': 'Bhaiya Dooj',
    'day': 'Sunday',
    'month': 'November',
    'date': '3',
    'description':
        ' On the day of the festival, sisters invite their brothers for a sumptuous meal often including their favourite dishes/sweets.',
    'religion': 'Hinduism'
  },
];

List festivalmap = festivalName
    .map(
      (e) => FestivalModelClass.fun(
        data: e,
      ),
    )
    .toList();

List allFest = festivalmap
    .map(
      (e) => e['religion'],
    )
    .toList()
    .toSet()
    .toList();
