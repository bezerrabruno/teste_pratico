import 'package:dartz/dartz.dart';

import '../entities/student_info.dart';
import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/domain/update_student_info_usecase.dart';
import '../interfaces/infra/student_info_repository.dart';

class UpdateStudentInfoUsecaseImpl implements UpdateStudentInfoUsecase {
  final StudentInfoRepository repository;

  const UpdateStudentInfoUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, StudentInfo>> call(
      int studentId, StudentInfo studentInfo) async {
    return await repository.update(studentId, studentInfo);
  }
}
