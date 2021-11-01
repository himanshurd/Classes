# Exercise 6

class LaunchDiscussionWorkflow

  def initialize(discussion, host, participants_email_string)
    @discussion = discussion
    @host = host
    @participants_email_string = participants_email_string
    @participants = []
  end

  # Expects @participants array to be filled with User objects
  def run
    return unless valid?
    run_callbacks(:create) do
      ActiveRecord::Base.transaction do
        discussion.save!
        create_discussion_roles!
        @successful = true
      end
    end
  end

  # ...

end

class ParticipantUsersGenerator

  def self.generate_participant_users_from_email_string(participants_email_string)
    return if participants_email_string.blank?
    participants_email_string.split.uniq.map do |email_address|
      User.create(email: email_address.downcase, password: Devise.friendly_tken)
    end
  end

end

discussion = Discussion.new(title: "fake", ...)
host = User.find(42)
participants = "fake1@example.com\nfake2@example.com\nfake3@example.com"

workflow = LaunchDiscussionWorkflow.new(discussion, host, participants)
ParticipantUsersGenerator.generate_participant_users_from_email_string
workflow.run

require "test/unit"

class TestLaunchDiscussionWorkflow < Test::Unit::TestCase

  def test_valid
  end

  def test_run
  end

  def test_run_callbacks
  end

  def test_create_discussion_roles!
  end

  def test_generate_participant_users_from_email_string
  end

end

class TestDiscussion < Test::Unit::TestCase

  def test_save!
  end

end

class TestUser < Test::Unit::TestCase

  def test_create
  end

  def test_find
  end

end

class TestParticipantUsersFromEmailStringGenerator < Test::Unit::TestCase

  def test_generate_participant_users_from_email_string
  end
  
end
