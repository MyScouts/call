class MyProfileConstant {
  static const int textPostPageSize = 10;

  static String reactText({
    required int totalReact,
    required bool isHearted,
  }) {
    print(totalReact);
    if (totalReact == 1 && isHearted) {
      return 'Bạn';
    }

    if (isHearted) {
      return 'Bạn và $totalReact người khác';
    }
    
    if(totalReact == 0){
      return '';
    }

    return '$totalReact người khác';
  }
}

enum PostType { text, video, film }
