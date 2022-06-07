import 'package:dartz/dartz.dart';

import '../entities/student_info.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/domain/get_student_info_usecase.dart';
import '../interfaces/infra/student_info_repository.dart';

class GetStudentInfoUsecaseImpl implements GetStudentInfoUsecase {
  final StudentInfoRepository repository;

  const GetStudentInfoUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, StudentInfo>> call(int courseId) async {
    return await repository.get(courseId);
  }
}
