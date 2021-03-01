import 'package:bloc/bloc.dart';

enum PageEvent { images, animation, audio, video }

class PageBlock extends Bloc<PageEvent, int> {
  PageBlock() : super(0);

  @override
  Stream<int> mapEventToState(PageEvent event) async* {
    switch (event) {
      case PageEvent.images:
        yield 0;
        break;
      case PageEvent.animation:
        yield 1;
        break;
      case PageEvent.audio:
        yield 2;
        break;
      case PageEvent.video:
        yield 3;
        break;
    }
  }
}
