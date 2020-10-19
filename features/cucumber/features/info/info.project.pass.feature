@info
@info.project
@info.project.pass

Feature: I can resolve a pass call in the main project file

  Scenario: Print main project info
    Given a file named "project.yml" with:
      """
      ---
      my_secret_var: <%= `gopass show --password my_project/my_secret_key` %>
      """
    And an empty file named "Rakefile"
    And I run `gopass ls`
    When I successfully run `tau-cli info project main`
    Then the output should contain "my_secret_var: my_secret_value"
