shared_context 'api_data' do
  let!(:school) do
    School.create!(name: SecureRandom.uuid)
  end

  let!(:issue_type) do
    IssueType.create!(title: 'Test Issues')
  end

  let!(:issue) do
    Issue.create!(
      ordinal: 1,
      title: 'Test Issue',
      description: 'Lorem ipsum...',
      issue_type: issue_type,
      voting_open_time: 5.days.from_now,
      voting_closed_time: 6.days.from_now,
    )
  end

  let!(:choice_yes) do
    issue.choices.create!(title: 'Yes')
  end

  let!(:choice_no) do
    issue.choices.create!(title: 'No')
  end

  let!(:vote_yes) do
    choice_yes.votes.create!(
      voter: voter,
      choice: choice_yes,
    )
  end

  let!(:voter) do
    Voter.create!(
      school: school,
      gender: 'f',
      school_year: 'Sophmore',
      registration_number: SecureRandom.uuid,
      will_be_eighteen: false,
      authenticated: true,
    )
  end
end
