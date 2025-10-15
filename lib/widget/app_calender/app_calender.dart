import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final String startDate;
  final String endDate;

  const CustomCalendar({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  /// Parse date string like "2025 - 10 - 08"
  DateTime _parseDate(String dateString) {
    final parts = dateString.split('-').map((e) => e.trim()).toList();
    return DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  /// Generate all dates between start and end
  List<DateTime> _generateDateRange(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    DateTime current = start;
    while (current.isBefore(end.add(const Duration(days: 1)))) {
      dates.add(current);
      current = current.add(const Duration(days: 1));
    }
    return dates;
  }

  /// Navigate months
  void _previousMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
    });
  }

  /// Navigate years
  void _previousYear() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year - 1, _focusedDay.month, 1);
    });
  }

  void _nextYear() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year + 1, _focusedDay.month, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final start = _parseDate(widget.startDate);
    final end = _parseDate(widget.endDate);
    final redDates = _generateDateRange(start, end);

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Previous Year
                IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 24,
                    color: (_focusedDay.year > DateTime.now().year - 3)
                        ? Colors.blue
                        : Colors.blue[100],
                  ),

                  onPressed: (_focusedDay.year > DateTime.now().year - 3)
                      ? _previousYear
                      : null,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),

                // Month and Year display
                Expanded(
                  child: Center(
                    child: Text(
                      DateFormat('MMM yyyy').format(_focusedDay),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                // Next Year
                IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: (_focusedDay.year < DateTime.now().year + 3)
                        ? Colors.blue
                        : Colors.blue[10],
                  ),

                  onPressed: (_focusedDay.year < DateTime.now().year + 3)
                      ? _nextYear
                      : null,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                SizedBox(width: 80),
                // Previous Month
                IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 34,
                    color: Colors.lightBlueAccent,
                  ),
                  onPressed: _previousMonth,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),

                // Next Month
                IconButton(
                  icon: const Icon(
                    Icons.chevron_right,
                    size: 34,
                    color: Colors.lightBlueAccent,
                  ),
                  onPressed: _nextMonth,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),

          // Table Calendar
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            pageAnimationCurve: Curves.easeInOut,

            calendarFormat: CalendarFormat.month,
            headerVisible: false,
            availableGestures: AvailableGestures.none,
            daysOfWeekHeight: 25,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey.withValues(alpha: 0.5),
              ),
              weekendStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey.withValues(alpha: 0.5),
              ),
            ),
            calendarStyle: CalendarStyle(
              defaultTextStyle: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              weekendTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              outsideTextStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 18,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.black87.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              isTodayHighlighted: false,
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                bool isInRange = redDates.any(
                  (d) =>
                      d.year == day.year &&
                      d.month == day.month &&
                      d.day == day.day,
                );
                if (isInRange) {
                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
