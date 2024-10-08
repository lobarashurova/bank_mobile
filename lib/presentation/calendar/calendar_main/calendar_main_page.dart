import 'package:bank_mobile/data/api_model/event_model/event_model.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/presentation/calendar/calendar_provider/calendar_privder.dart';
import 'package:bank_mobile/utils/calendar_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarMainPage extends StatefulWidget {
  const CalendarMainPage({super.key});

  @override
  State<CalendarMainPage> createState() => _CalendarMainPageState();
}

class _CalendarMainPageState extends State<CalendarMainPage> {
  TextEditingController searchController = TextEditingController();

  late final ValueNotifier<List<EventModel>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    Future.delayed(Duration(seconds: 0)).then((value){
      context
          .read<CalendarProvider>()
          .getEvents(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    });

    _selectedEvents =
        ValueNotifier(context.read<CalendarProvider>().events ?? []);
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      // _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // if (start != null && end != null) {
    //   _selectedEvents.value = _getEventsForRange(start, end);
    // } else if (start != null) {
    //   _selectedEvents.value = _getEventsForDay(start);
    // } else if (end != null) {
    //   _selectedEvents.value = _getEventsForDay(end);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalendarProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TableCalendar<EventModel>(
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                        color: context.colors.onPrimary, fontSize: 17),
                    leftChevronIcon: Icon(
                      Icons.keyboard_arrow_left,
                      color: context.colors.onPrimary,
                    ),
                    rightChevronIcon: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: context.colors.onPrimary,
                    )),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                        color: context.colors.onPrimary,
                        fontWeight: FontWeight.w600),
                    weekendStyle: TextStyle(
                        color: context.colors.warningLight,
                        fontWeight: FontWeight.w700)),
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: (day) {
                  return provider.events ?? [];
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  outsideTextStyle: TextStyle(color: context.colors.onPrimary),
                  markerDecoration: BoxDecoration(
                      color: context.colors.onPrimary, shape: BoxShape.circle),
                  weekendDecoration: BoxDecoration(
                      color: context.colors.warningDark,
                      shape: BoxShape.circle),
                  outsideDaysVisible: false,
                  weekendTextStyle: TextStyle(color: context.colors.onPrimary),
                  weekNumberTextStyle:
                      TextStyle(color: context.colors.onPrimary),
                  defaultTextStyle: TextStyle(color: context.colors.onPrimary),
                ),
                onDaySelected: (start, end) {
                  if (!isSameDay(_selectedDay, start)) {
                    setState(() {
                      _selectedDay = start;
                      _focusedDay = end;
                      _rangeStart = null; // Important to clean those
                      _rangeEnd = null;
                      _rangeSelectionMode = RangeSelectionMode.toggledOff;
                    });
                    context
                        .read<CalendarProvider>()
                        .getEvents(DateFormat('yyyy-MM-dd').format(start));
                    _selectedEvents.value = provider.events ?? [];
                    _selectedEvents.value = provider.events ?? [];
                  }
                },
                onRangeSelected: (start, end, focused) {
                  setState(() {
                    _selectedDay = null;
                    _focusedDay = focused;
                    _rangeStart = start;
                    _rangeEnd = end;
                    _rangeSelectionMode = RangeSelectionMode.toggledOn;
                  });

                  if (start != null && end != null) {
                    _selectedEvents.value = provider.events ?? [];
                  } else if (start != null) {
                    _selectedEvents.value = provider.events ?? [];
                  } else if (end != null) {
                    _selectedEvents.value = provider.events ?? [];
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ValueListenableBuilder<List<EventModel>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              trailing: InkWell(
                                  onTap: () {},
                                  child: "Join"
                                      .s(14)
                                      .w(400)
                                      .c(context.colors.display)),
                              onTap: () => print('${value[index]}'),
                              title: Text(
                                '${value[index]}',
                                style: TextStyle(
                                    color: context.colors.onPrimary,
                                    fontSize: 14),
                              ),
                              subtitle: "Event was organized by admin"
                                  .s(12)
                                  .w(500)
                                  .c(context.colors.onPrimary),
                              leading: Icon(
                                Icons.meeting_room,
                                color: context.colors.display,
                              ),
                            ),
                            Divider(
                              color: context.colors.display,
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
