require_relative './lib/scheduling_service.rb'
require_relative './lib/schedule_printing_service.rb'

meetings = [
  { name: "Meeting 1", duration: 1.5, type: :onsite },
  { name: "Meeting 2", duration: 2, type: :offsite },
  { name: "Meeting 3", duration: 1, type: :onsite },
  { name: "Meeting 4", duration: 1, type: :offsite },
  { name: "Meeting 5", duration: 1, type: :offsite },
]

# meetings = [
#   { name: "Meeting 1", duration: 3, type: :offsite },
#   { name: "Meeting 3", duration: 3, type: :offsite },
#   { name: "Meeting 2", duration: 2, type: :onsite },
# ]

schedule = SchedulingService.call(meetings:)
printed_schedule = SchedulePrintingService.call(schedule:)
schedule_strings = printed_schedule.join("\n")

puts printed_schedule