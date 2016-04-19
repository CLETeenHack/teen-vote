# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

School.find_or_create_by(name: 'Test School')

voter = Voter.find_or_create_by(
  registration_number: 'ABC1234',
  gender: 'f',
  school_year: 'Senior',
)

voter = Voter.find_or_create_by(
  registration_number: 'ZYX9876',
  gender: 'm',
  school_year: 'Junior',
)

Dir[File.join(Rails.root, 'db', 'data', 'issues','*')].each do |file_name|
  issues = YAML.load_file file_name
  issues.each do |type_of_issue|
    type_of_issue.deep_symbolize_keys!

    issue_type = IssueType.find_or_create_by(
      title: type_of_issue[:title],
      national: type_of_issue[:national],
      state: type_of_issue[:state])

    type_of_issue[:issues].each do |issue_to_load|
      issue = Issue.find_or_create_by(
        title: issue_to_load[:title],
        description: issue_to_load[:description],
        issue_type_id: issue_type.id,
        voting_open_time: DateTime.now.end_of_month - 1,
        voting_closed_time: DateTime.now.end_of_month,
      )

      issue_to_load[:choices].each do |choice_to_load|
        issue.choices.find_or_create_by(title: choice_to_load[:title], image_url: choice_to_load[:image_url])
      end
    end
  end
end
