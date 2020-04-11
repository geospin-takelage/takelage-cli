@docker
@docker.check
@docker.check.running

Feature: I can check if the docker daemon is running

  Scenario: Check that the docker daemon is running
    Given a file named "~/.takelage.yml" with:
      """
      ---
      cmd_docker_check_running_docker_info: $(exit 0)
      """
    And I get the active takelage config
    When I run `tau-cli docker check running`
    Then the exit status should be 0

  Scenario: Check that the docker daemon is not running
    Given a file named "~/.takelage.yml" with:
      """
      ---
      cmd_docker_check_running_docker_info: $(exit 1)
      """
    And I get the active takelage config
    When I run `tau-cli docker check running`
    Then the exit status should be 1
