import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

final TextEditingController _reminderController = TextEditingController();

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<String, List<String>> _events = {};

  @override
  void initState() {
    super.initState();
    _loadEvents();
    _selectedDay = DateTime.now();
  }

  Future<void> _loadEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedEvents = prefs.getString('events');
    if (storedEvents != null) {
      setState(() {
        _events = Map<String, List<String>>.from(
          (json.decode(storedEvents) as Map).map(
            (key, value) => MapEntry(key, List<String>.from(value)),
          ),
        );
      });
    }
  }

  Future<void> _saveEvents() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('events', json.encode(_events));
  }

  String _dateToString(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[_dateToString(day)] ?? [];
  }

  void _showAddDialog({DateTime? initialDate}) async {
  DateTime selectedDate = initialDate ?? (_selectedDay ?? DateTime.now());

  _reminderController.clear();

  // Ако нема конкретна дата (од plus-от), прати го да избере
  if (initialDate == null) {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (pickedDate == null) return; // ако корисникот откаже
    selectedDate = pickedDate;
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Додади потсетник за ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
      content: TextField(
        controller: _reminderController,
        decoration: const InputDecoration(hintText: 'Внеси текст'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Откажи'),
        ),
        TextButton(
          onPressed: () {
            final text = _reminderController.text.trim();
            if (text.isNotEmpty) {
              setState(() {
                final key = _dateToString(selectedDate);
                if (_events[key] != null) {
                  _events[key]!.add(text);
                } else {
                  _events[key] = [text];
                }
                _saveEvents();
              });
            }
            Navigator.pop(context);
          },
          child: const Text('Зачувај'),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    final eventsForSelectedDay = _selectedDay != null
        ? _getEventsForDay(_selectedDay!)
        : [];

    return Scaffold(
      appBar: AppBar(title: const Text('Календар')),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: eventsForSelectedDay.length,
                  itemBuilder: (context, index) {
                    final event = eventsForSelectedDay[index];
                    return ListTile(
                      title: Text(event),
                      leading: const Icon(Icons.note),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            final key = _dateToString(_selectedDay!);
                            _events[key]!.removeAt(index);
                            if (_events[key]!.isEmpty) {
                              _events.remove(key);
                            }
                            _saveEvents();
                          });
                        },
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 70,
                  right: 30,
                  child: FloatingActionButton(
                    onPressed: _showAddDialog,
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
