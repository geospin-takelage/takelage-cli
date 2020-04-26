@docker
@docker.container
@docker.container.login

@before_build_mock_images

Feature: I can log in to a docker container

  Scenario: Log in to a docker container
    Given a file named "~/.takelage.yml" with:
      """
      ---
      docker_user: host.docker.internal:5005/takelage-mock
      docker_repo: takelage-mock
      """
    And I get the active takelage config
    When I successfully run `unbuffer tau-cli docker container login`
    Then the output should contain exactly "Running /loginpoint.py"