require_relative "../../lib/scheduling_service"

RSpec.describe SchedulingService do
  let(:meetings) do
    [
      { name: "Meeting 1", duration: 3, type: :onsite },
      { name: "Meeting 2", duration: 2, type: :offsite },
      { name: "Meeting 3", duration: 1, type: :offsite },
      { name: "Meeting 4", duration: 0.5, type: :onsite }
    ]
  end

  let(:sorted_meetings) do
    [
      { name: "Meeting 2", duration: 2, type: :offsite },
      { name: "Meeting 3", duration: 1, type: :offsite },
      { name: "Meeting 1", duration: 3, type: :onsite },
      { name: "Meeting 4", duration: 0.5, type: :onsite }
    ]
  end

  let(:subject) do
    SchedulingService.new(meetings:)
  end

  context "#calculate_duration" do
    it "pads by 30 minutes for offsite meetings" do
      current_time = Time.new(2021, 12, 13, 9, 00, 00)
      expected_end_time = Time.new(2021, 12, 13, 12, 30, 00)
      result = current_time + subject.calculate_duration(meeting_type: :offsite, meeting_duration: 3)
      expect(result).to eql(expected_end_time)
    end

    it "does not pad onsite meetings" do
      current_time = Time.new(2021, 12, 13, 9, 00, 00)
      expected_end_time = Time.new(2021, 12, 13, 12, 00, 00)
      result = current_time + subject.calculate_duration(meeting_type: :onsite, meeting_duration: 3)
      expect(result).to eql(expected_end_time)
    end
  end

  context "#can_it_fit" do
    it "returns false if the meeting cannot fit" do
      meeting = { name: "Meeting 2", duration: 2, type: :offsite }
      current_time = Time.new(2021, 12, 13, 15, 00)
      expect(subject.can_it_fit?(meeting:, current_time:)).to be_falsey
    end

    it "returns true if the meeting can fit" do
      meeting = { name: "Meeting 2", duration: 2, type: :offsite }
      current_time = Time.new(2021, 12, 13, 14, 00)
      expect(subject.can_it_fit?(meeting:, current_time:)).to be_truthy
    end
  end

  context "#sort" do
    it "favors offsite meetings to start off the day" do
      # I'm sorting it so offsites start the day. Logically
      # this makes sense as it is easier to drive home from the office
      # then it is from an offsite location that could be an hour-plus from
      # your home.

      expect(subject.sort_meetings).to eq(sorted_meetings)
    end
  end
end