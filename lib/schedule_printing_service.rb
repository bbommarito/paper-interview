class SchedulePrintingService
  # @return [Array] of generated schedule strings
  attr_accessor :printed_schedule

  # @return [Array] of scheduled events
  attr_reader :schedule

  # @param schedule: [Array] of scheduled events
  # @return [Array] of generated schedule strings
  def self.call(schedule:)
    self.new(schedule:).call
  end

  # @param schedule: [Array] of scheduled events
  def initialize(schedule:)
    @schedule = schedule
    @printed_schedule = []
  end
   
  # @return [Array] of generated schedule strings
  def call
    printed_schedule << "Schedule cannot work as entered." if schedule.empty?

    schedule.each do |meeting|
      printed_schedule << "#{meeting[:start_time].strftime('%-l:%M %p')} - #{meeting[:end_time].strftime('%-l:%M %p')} - #{meeting[:name]}" 
    end

    printed_schedule
  end
end  