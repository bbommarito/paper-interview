require_relative './lib/scheduling_service.rb'
# meetings = [
#   { name: "Meeting 1", duration: 3, type: :onsite },
#   { name: "Meeting 2", duration: 2, type: :offsite },
#   { name: "Meeting 3", duration: 1, type: :offsite },
#   { name: "Meeting 4", duration: 0.5, type: :onsite }
# ]

meetings = [
  { name: "Meeting 1", duration: 3, type: :offsite },
  { name: "Meeting 3", duration: 3, type: :offsite },
  { name: "Meeting 2", duration: 2, type: :onsite },
]

SchedulingService.call(meetings:)
