class SchedulingService
  ONE_HOUR = 3600

  # @return [Array] the list of meetings
  attr_reader :meetings

  # @return [Time] the start time of the day
  attr_reader :start_time

  # @return [Time] the end time of the day
  attr_reader :end_time

  # @param meetings: [Array] the list of meetings
  def self.call(meetings:)
    self.new(meetings:).call
  end

  # @param meetings: [Array] the list of meetings
  def initialize(meetings:)
    @meetings = meetings
    @start_time = Time.new(2021, 12, 13, 9, 0, 0) 
    @end_time = Time.new(2021, 12, 13, 17, 0, 0)
  end

  # @return [Array] of meetings, or no meetings if schedule cannot work.
  def call
    # Ah, an empty schedule. Truly, my favorite thing to see, though
    # it's a shame it won't be empty for long.
    schedule = []

    current_time = start_time
    sorted_meetings = sort_meetings

    sorted_meetings.each do |meeting|
      # Let's first check if the meeting will fit within the
      # alloted schedule.
      # I know the instructions hinted at just bombing out if the meeting can't fit
      # but that doesn't make sense to me. If this was a real world application
      # the user may want to know what meeting can't fit, and see a schedule minus
      # that meeting.

      # I'm not usually a fan of doing an unless; end but I also hate
      # negating a boolean so here we are.
      unless can_it_fit?(current_time:, meeting:)
        schedule = []
        break
        # puts "Cannot fit #{meeting[:name]} into current schedule" 
        # next
      end

      # Now, let's get these meetings scheduled, shall we? Oh, we shall.

      start_meeting_time = current_time
      end_meeting_time = current_time + calculate_duration(meeting_type: meeting[:type], meeting_duration: meeting[:duration])
      current_time = end_meeting_time

      schedule << { name: meeting[:name], start_time: start_meeting_time, end_time: end_meeting_time }
    end

    schedule
  end

  # @param meeting_type: [Symbol] of meeting type (either :onsite or :offsite)
  # @param meeting_duration: [Integer] of length of meeting
  # @return [Time] duration of meeting
  def calculate_duration(meeting_type:, meeting_duration:)
    # We need to know if it is an offsite or onsite meeting as offsite meetings
    # require a 30 minute padding.
    meeting_duration += 0.5 if meeting_type == :offsite
    meeting_duration * ONE_HOUR
  end

  # @param current_time: [Time] the current time
  # @param meeting: [Hash] the current meeting
  # @return [Boolean]
  def can_it_fit?(current_time:, meeting:)
      duration = calculate_duration(meeting_type: meeting[:type], meeting_duration: meeting[:duration])

      current_time + duration <= end_time
  end

  # @return [Array] of sorted meetings
  def sort_meetings
    meetings.sort { |a,b| a[:type] <=> b[:type] }
  end
end
