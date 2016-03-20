# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

school = School.find_or_create_by(name: 'Test School')
state_issue = IssueType.find_or_create_by(title: 'State Issues', state: true)
national_issue = IssueType.find_or_create_by(title: 'National Issues', national: true)

voter = Voter.find_or_create_by(
  registration_number: 'test-number',
  gender: 'f',
  school_year: 'Senior',
)

issue = Issue.find_or_create_by(
  title: 'Supreme Chancellor',
  description: 'Cast your vote for the supreme Chancellor',
  issue_type_id: national_issue.id,
  voting_open_time: DateTime.now.end_of_month - 1,
  voting_closed_time: DateTime.now.end_of_month,
)

palpatine = issue.choices.find_or_create_by(title: 'Palpatine')
valorum = issue.choices.find_or_create_by(title: 'Valorum')

palpatine.votes.find_or_create_by(voter_id: voter.id)
