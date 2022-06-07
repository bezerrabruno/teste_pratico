import 'package:dartz/dartz.dart';

import '/app/core/shared/utils/failures_defalt.dart';

import '../interfaces/domain/delete_student_info_usecase.dart';
import '../interfaces/infra/student_info_repository.dart';

class DeleteStudentInfoUsecaseImpl implements DeleteStudentInfoUsecase {
  final StudentInfoRepository repository;

  const DeleteStudentInfoUsecaseImpl(this.repository);

  @override
  Future<Either<FailureApp, String>> call(int courseId) async {
    return await repository.delete(courseId);
  }
}
