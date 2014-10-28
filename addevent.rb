event = {
  'summary' => 'Appointment',
  'location' => 'Somewhere',
  'start' => {
    'dateTime' => '2011-06-03T10:00:00.000-07:00'
  },
  'end' => {
    'dateTime' => '2011-06-03T10:25:00.000-07:00'
  },
  'attendees' => [
    {
      'email' => 'attendeeEmail'
    },
    #...
  ]
}
result = client.execute(:api_method => service.events.insert,
                        :parameters => {'calendarId' => 'primary'},
                        :body => JSON.dump(event),
                        :headers => {'Content-Type' => 'application/json'})
print result.data.id