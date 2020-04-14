@docker
@docker.socket
@docker.socket.scheme

Feature: I can print the socket scheme

  Scenario: Print the socket scheme
    Given I run `ip link show dev docker0`
    And the exit status should be 1
    And a file named "~/.takelage.yml" with:
      """
      ---
      docker_socket_agent_socket_port: 11111
      docker_socket_agent_ssh_socket_port: 22222
      """
    And I get the active takelage config
    When I successfully run `tau-cli docker socket scheme`
    Then the output should contain:
    """
    ---
    agent-socket:
      path: "/tmp/fake_home/.gnupg/S.gpg-agent"
      host: 127.0.0.1
      port: 11111
    agent-ssh-socket:
      path: "/tmp/fake_home/.gnupg/S.gpg-agent.ssh"
      host: 127.0.0.1
      port: 22222
    """
