import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foursysteste/app/modules/album/domain/entities/album.dart';
import 'package:foursysteste/app/modules/album/domain/repositories/i_get_album_repository.dart';
import 'package:foursysteste/app/modules/album/domain/usecases/get_album_usecase_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_album_usecase_impl_test.mocks.dart';

@GenerateMocks([IGetAlbumRepository])
void main() {
  late GetAlbumUsecaseImpl usecase;
  late MockIGetAlbumRepository mockIGetAlbumRepository;

  setUp(() {
    mockIGetAlbumRepository = MockIGetAlbumRepository();
    usecase = GetAlbumUsecaseImpl(mockIGetAlbumRepository);
  });

  final list = <Album>[const Album(userId: 1, id: 1, title: 'teste')];

  test('Deve retornar uma lista de albuns', () async {
    when(mockIGetAlbumRepository.getAlbuns())
        .thenAnswer((_) async => Right(list));

    final result = await usecase();

    expect(result, Right(list));
    verify(mockIGetAlbumRepository.getAlbuns());
    verifyNoMoreInteractions(mockIGetAlbumRepository);
  });
}
