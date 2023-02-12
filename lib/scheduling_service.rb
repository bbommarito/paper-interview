class SchedulingService
  # @return [Array] the list of meetings
  attr_reader :meetings

  # @params meetings: [Array] the list of meetings
  def self.call(meetings:)
    self.new(meetings:).call
  end

  # @params meetings: [Array] the list of meetings
  def initialize(meetings:)
    @meetings = meetings
  end

  def call
    puts "Oh, hai!"
  end

  def sort_meetings
    meetings.sort { |a,b| a[:type] <=> b[:type] }
  end
end
