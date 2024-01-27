import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/app/types/repository_error.dart';
import 'package:raketech_task/app/types/result.dart';
import 'package:raketech_task/data/repositories/data_source_contracts/remote/events_remote_data_source_contract.dart';
import 'package:raketech_task/domain/models/event_entity.dart';
import 'package:raketech_task/domain/repositoriy_contracts/events_repository_contract.dart';

class EventsRepository implements EventsRepositoryContract {
  final EventsRemoteDataSourceContract _eventsRemoteDataSourceContract;

  EventsRepository({
    required EventsRemoteDataSourceContract eventsRemoteDataSourceContract,
  }) : _eventsRemoteDataSourceContract = eventsRemoteDataSourceContract;

  @override
  Future<Result<List<EventEntity>>> getListOfEventsByDate(
    DateType dateType,
  ) async {
    try {
      // Call the getInvoices method from the remote data source
      final data =
          await _eventsRemoteDataSourceContract.getEventsByDate(dateType);

      // Return the result mapped
      return Result.success(data.map((e) => e.toEventEntity()).toList());
    } catch (error) {
      // we would handle the proper error here
      return const Result.failure(
        error: RepositoryError.badRequest(),
      );
    }
  }
}
