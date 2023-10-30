import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:mockito/mockito.dart';

import 'gen_mock/mock_object.mocks.dart';

void main() {
  final serverGetList = MockServiceGetList();
  group('GetListBloc', () {
    GetListBloc? getListBloc;

    setUp(() {
      // Given
      final resultListStr = ['a', 'b'];

      // When
      when(serverGetList.getListingString())
          .thenAnswer((_) async => resultListStr);

      getListBloc = GetListBloc<String>(serverGetList.getListingString);
    });

    tearDownAll(() {
      getListBloc?.close();
    });

    blocTest(
      'emits [GetListDataEvent] when Inittial',
      build: () => getListBloc!,
      act: (GetListBloc bloc) => bloc.add(GetListDataEvent()),
      expect: () => [
        isA<GetListDataLoading<String>>(),
        isA<GetListDataSuccess<String>>(),
      ],
    );
  });

  group('GetListBloc', () {
    GetListBlocParam1? getListBlocParam1;
    const param1 = 1;

    setUp(() {
      // Given
      final resultListStr = ['a', 'b'];

      // When
      when(serverGetList.getListingStringParam1(param1))
          .thenAnswer((_) async => resultListStr);

      getListBlocParam1 =
          GetListBlocParam1<String, int>(serverGetList.getListingStringParam1);
    });

    tearDownAll(() {
      getListBlocParam1?.close();
    });

    blocTest(
      'emits [GetListDataParam1Event] when getLit',
      build: () => getListBlocParam1!,
      act: (GetListBlocParam1 bloc) => bloc.add(GetListDataParam1Event(param1)),
      expect: () => [
        isA<GetListDataLoading<String>>(),
        isA<GetListDataSuccess<String>>(),
      ],
    );
  });
}
