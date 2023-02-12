class SchedulingService
  # @return [Array] the list of meetings
  attr_reader :meetings

  # @return [Time] the start time of the day
  attr_reader :start_time

  # @return [Time] the end time of the day
  attr_reader :end_time

  # @return [Time] the current time of scheduling
  attr_accessor :current_time

  # @return [Array] the current schedule
  attr_accessor :schedule

  # @params meetings: [Array] the list of meetings
  def self.call(meetings:)
    self.new(meetings:).call
  end

  # @params meetings: [Array] the list of meetings
  def initialize(meetings:)
    @meetings = meetings
    @start_time = Time.new(2021, 12, 13, 9, 0, 0) 
    @end_time = Time.new(2021, 12, 13, 17, 0, 0)
    @current_time = @start_time

    # Ah, an empty schedule. Truly, my favorite thing to see, though
    # it's a shame it won't be empty for long.
    @schedule = []
  end

  def call
    puts "Oh, hai!"
  end

  # @return [Array] of sorted meetings
  def sort_meetings
    meetings.sort { |a,b| a[:type] <=> b[:type] }
  end
end
