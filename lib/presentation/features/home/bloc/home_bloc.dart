import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raketech_task/app/types/date_type.dart';
import 'package:raketech_task/app/types/screen_status.dart';
import 'package:raketech_task/domain/models/event_entity.dart';
import 'package:raketech_task/domain/repositoriy_contracts/events_repository_contract.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final EventsRepositoryContract _eventsRepositoryContract;

  HomeBloc({required EventsRepositoryContract eventsRepositoryContract})
      : _eventsRepositoryContract = eventsRepositoryContract,
        super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        fetchEventsByDate: (date) =>
            _mapFetchEventsByDateToState(event, emit, date),
        fetchEventDetails: (eventEntity, dateType) =>
            _mapFetchEventDetailsToState(event, emit, eventEntity, dateType),
        updateEventSelected: (eventEntity, dateType) =>
            _mapUpdateEventSelectedEventToState(
          event,
          emit,
          eventEntity,
          dateType,
        ),
      );
    });
  }


  /// Events to map event for fetching events to a new state
  /// with those events gotten
  ///
  FutureOr<void> _mapFetchEventsByDateToState(
      HomeEvent event,
      Emitter<HomeState> emit,
      DateType dateType,
      ) async {
    // we want to fetch events just if we don't have
    // If we do have we would call fetchMoreEvents
    if (state.getListByDate(dateType).isNotEmpty) {
      return;
    }
    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));

    final response =
    await _eventsRepositoryContract.getListOfEventsByDate(dateType);

    response.when(
      failure: (_) => emit(
        state.copyWith(
          screenStatus: const ScreenStatus.error(),
        ),
      ),
      success: (events) {
        dateType.when(
          yesterday: () => emit(
            state.copyWith(
              yesterdayEvents: events,
              screenStatus: const ScreenStatus.initial(),
            ),
          ),
          today: () => emit(
            state.copyWith(
              todayEvents: events,
              screenStatus: const ScreenStatus.initial(),
            ),
          ),
          tomorrow: () => emit(
            state.copyWith(
              tomorrowEvents: events,
              screenStatus: const ScreenStatus.initial(),
            ),
          ),
          unknown: () => DoNothingAction(),
        );
      },
    );
  }

  /// Update event selected in our lists
  ///
  FutureOr<void> _mapUpdateEventSelectedEventToState(
    HomeEvent event,
    Emitter<HomeState> emit,
    EventEntity? eventEntity,
    DateType dateType,
  ) {
    dateType.when(
      yesterday: () => emit(
        state.copyWith(
          yesterdayEventSelected: eventEntity,
        ),
      ),
      today: () => emit(
        state.copyWith(
          todayEventSelected: eventEntity,
        ),
      ),
      tomorrow: () => emit(
        state.copyWith(
          tomorrowEventSelected: eventEntity,
        ),
      ),
      unknown: () => DoNothingAction(),
    );

    //If we have selected an event entity and we don't have description for it,
    // we trigger an event to get those details
    if (eventEntity != null && eventEntity.eventDescription == null) {
      add(
        HomeEvent.fetchEventDetails(
          event: eventEntity,
          dateType: dateType,
        ),
      );
    }
  }



  /// Map event to fetch Events detail and emit a new state with
  /// details gotten
  FutureOr<void> _mapFetchEventDetailsToState(
      HomeEvent event,
      Emitter<HomeState> emit,
      EventEntity? eventEntity,
      DateType dateType,
      ) async {
    // Another loading state to differentiate it from the main loading
    emit(state.copyWith(screenStatus: const ScreenStatus.loadingMore()));

    final response = await _eventsRepositoryContract
        .getEventDescription(eventEntity?.eventId ?? '');

    response.when(
      failure: (_) => emit(
        state.copyWith(
          screenStatus: const ScreenStatus.error(),
        ),
      ),
      success: (description) {
        // get current event and adding the new description
        final eventUpdated =
        eventEntity?.copyWith(eventDescription: description);

        //We need to update the list too, so next time we open this event we
        // don't trigger the event to fetch the description
        final updatedList = [...state.getListByDate(dateType)];

        final index = updatedList
            .indexWhere((element) => element.eventId == eventEntity?.eventId);

        updatedList[index] = eventUpdated ?? const EventEntity();

        dateType.when(
          yesterday: () => emit(
            state.copyWith(
              yesterdayEventSelected: eventUpdated,
              yesterdayEvents: updatedList,
              screenStatus: const ScreenStatus.initial(),
            ),
          ),
          today: () => emit(
            state.copyWith(
              todayEvents: updatedList,
              todayEventSelected: eventUpdated,
              screenStatus: const ScreenStatus.initial(),
            ),
          ),
          tomorrow: () => emit(
            state.copyWith(
              tomorrowEvents: updatedList,
              tomorrowEventSelected: eventUpdated,
              screenStatus: const ScreenStatus.initial(),
            ),
          ),
          unknown: () => DoNothingAction(),
        );
      },
    );
  }
}
