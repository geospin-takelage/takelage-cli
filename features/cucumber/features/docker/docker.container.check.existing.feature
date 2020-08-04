@docker
@docker.container
@docker.container.check
@docker.container.check.existing

@before_build_mock_images

Feature: I can check if a docker container is existing

  Background:
    Given a file named "~/.takelage.yml" with:
      """
      ---
      docker_user: host.docker.internal:5005/takelage-mock
      docker_repo: takelage-mock
      """
    And I get the active takelage config

  Scenario: Check that an existing docker container is existing
    Given I successfully run `env -u TAKELAGE_PROJECT_BASE_DIR unbuffer tau-cli docker container login`
    When I run `tau-cli docker container check existing takelage-mock_cucumber`
    Then the exit status should be 0

  Scenario: Check that a non-existing docker container is not existing
    Given the docker container "takelage-mock_nonexisting-name" doesn't exist
    When I run `tau-cli docker container check existing takelage-mock_nonexisting-name`
    Then the exit status should be 1
