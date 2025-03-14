class AppointmentService {
  // Create a new appointment
  Future<Map<String, dynamic>> createAppointment(
      Map<String, dynamic> appointmentData) async {
    // Mock successful appointment creation
    await Future.delayed(
        const Duration(milliseconds: 800)); // Simulate network delay
    return {
      'success': true,
      'message': 'Appointment created successfully',
      'data': {
        'id': 'mock-appointment-${DateTime.now().millisecondsSinceEpoch}',
        'date': appointmentData['date'],
        'time': appointmentData['time'],
        'status': 'confirmed',
        ...appointmentData,
      }
    };
  }

  // Get all appointments for the current user
  Future<Map<String, dynamic>> getUserAppointments() async {
    // Mock user appointments data
    await Future.delayed(const Duration(milliseconds: 800));
    return {
      'success': true,
      'data': [
        {
          'id': 'mock-appointment-1',
          'date': '2023-11-15',
          'time': '10:00 AM',
          'vet_name': 'Dr. Smith',
          'pet_name': 'Max',
          'status': 'confirmed',
        },
        {
          'id': 'mock-appointment-2',
          'date': '2023-11-20',
          'time': '2:30 PM',
          'vet_name': 'Dr. Johnson',
          'pet_name': 'Bella',
          'status': 'pending',
        },
      ]
    };
  }

  // Get appointment details by ID
  Future<Map<String, dynamic>> getAppointmentDetails(
      String appointmentId) async {
    // Mock appointment details
    await Future.delayed(const Duration(milliseconds: 800));
    return {
      'success': true,
      'data': {
        'id': appointmentId,
        'date': '2023-11-15',
        'time': '10:00 AM',
        'vet_name': 'Dr. Smith',
        'pet_name': 'Max',
        'status': 'confirmed',
        'reason': 'Annual checkup',
        'notes': 'Pet has been having some digestive issues',
      }
    };
  }

  // Cancel an appointment
  Future<Map<String, dynamic>> cancelAppointment(String appointmentId) async {
    // Mock cancellation response
    await Future.delayed(const Duration(milliseconds: 800));
    return {
      'success': true,
      'message': 'Appointment cancelled successfully',
    };
  }

  // Get available time slots for a specific date and vet
  Future<Map<String, dynamic>> getAvailableTimeSlots(
      String vetId, String date) async {
    // Mock available time slots
    await Future.delayed(const Duration(milliseconds: 800));
    return {
      'success': true,
      'data': [
        '9:00 AM',
        '10:00 AM',
        '11:30 AM',
        '2:00 PM',
        '3:30 PM',
        '4:45 PM',
      ]
    };
  }
}
