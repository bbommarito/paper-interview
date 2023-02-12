require 'byebug'

class SchedulingService
  # @return [Array] the list of meetings
  attr_reader :meetings

  # @return [Time] the start time of the day
  attr_reader :start_time

  # @return [Time] the end time of the day
  attr_reader :end_time

  # @params meetings: [Array] the list of meetings
  def self.call(meetings:)
    self.new(meetings:).call
  end

  # @params meetings: [Array] the list of meetings
  def initialize(meetings:)
    @meetings = meetings
    @start_time = Time.new(2021, 12, 13, 9, 0, 0) 
    @end_time = Time.new(2021, 12, 13, 17, 0, 0)
  end

  def call
    # Ah, an empty schedule. Truly, my favorite thing to see, though
    # it's a shame it won't be empty for long.
    schedule = []

    current_time = start_time
    sorted_meetings = sort_meetings

    sorted_meetings.each do |meeting|
      # Let's first check if the meeting will fit within the
      # alloted schedule

      # We need to know if it is an offsite or onsite meeting as offsite meetings
      # require a 30 minute padding.
      duration = meeting[:type] == :offsite ? meeting[:duration] + 0.5 : meeting[:duration]

      if current_time + (duration * 60 * 60) > end_time
        # If it is, we'll break out and alert the user as to what meeting
        # won't fit.
        puts "Cannot fit #{meeting[:name]} into current schedule"
        break
      end

      # Now, let's get these meetings scheduled, shall we? Oh, we shall.
      if meeting[:type] == :onsite
        start_meeting_time = current_time
        end_meeting_time = current_time + (meeting[:duration] * 60 * 60)
        current_time = end_meeting_time
      elsif meeting[:type] == :offsite
        start_meeting_time = current_time

        # I pad at the end as we start the day with offsites and I assume the
        # arrival at the offsite would be considered "beginning of day"
        end_meeting_time = start_meeting_time + (meeting[:duration] * 60 * 60) + (0.5 * 60 * 60)
        current_time = end_meeting_time
      end

      schedule << { name: meeting[:name], start_time: start_meeting_time, end_time: end_meeting_time }
    end
  end

  # @return [Array] of sorted meetings
  def sort_meetings
    meetings.sort { |a,b| a[:type] <=> b[:type] }
  end
end
