import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foursysteste/app/modules/album/domain/entities/photo.dart';
import 'package:foursysteste/app/modules/album/domain/repositories/i_get_photo_repository.dart';
import 'package:foursysteste/app/modules/album/domain/usecases/get_photo_usecase_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_photo_usecase_impl_test.mocks.dart';

@GenerateMocks([IGetPhotoRepository])
void main() {
  late GetPhotoUsecaseImpl usecase;
  late MockIGetPhotoRepository mockGetPhotoRepository;

  setUp(() {
    mockGetPhotoRepository = MockIGetPhotoRepository();
    usecase = GetPhotoUsecaseImpl(mockGetPhotoRepository);
  });

  const albumId = 1;
  final list = <Photo>[
    const Photo(
        albumId: 1,
        id: 1,
        title: 'Teste',
        url: '"https://via.placeholder.com/600/92c95',
        thumbnailUrl: 'https://via.placeholder.com/150/92c952')
  ];

  test('Deve retornar uma lista de fotos List<Photo> do repositório', () async {
    when(mockGetPhotoRepository.getPhotos(any))
        .thenAnswer((_) async => Right(list));

    final result = await usecase(albumId: albumId);

    expect(result, Right(list));
    verify(mockGetPhotoRepository.getPhotos(albumId));
    verifyNoMoreInteractions(mockGetPhotoRepository);
  });
}
