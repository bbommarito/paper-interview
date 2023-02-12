require_relative "../../lib/schedule_printing_service.rb"

RSpec.describe SchedulePrintingService do

  context "#call" do
    context "with an array of events" do
      it "generates a string for each event" do
        events = [
          {start_time: Time.new(2021, 12, 13, 9, 0, 0),
          end_time: Time.new(2021, 12, 13, 9, 30, 0),
          name: "A Meeting"
          }
        ]

        sps = SchedulePrintingService.new(schedule: events)
        expect(sps.call).to eq(["9:00 AM - 9:30 AM - A Meeting"])
      end
    end

    context "with an empty schedule array" do
      it "returns an error message" do
        sps = SchedulePrintingService.new(schedule: [])
        expect(sps.call).to eq(["Schedule cannot work as entered."])
      end
    end
  end
end
