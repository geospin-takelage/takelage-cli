# frozen_string_literal: true

# takelage docker check running
module DockerCheckRunning
  # Backend method for docker check running.
  # @return [Boolean] is the docker daemon running?
  def docker_check_running
    return true if @docker_daemon_running

    log.debug 'Check if the docker daemon is running'

    status = try config.active['cmd_docker_check_running_docker_info']

    unless status.exitstatus.zero?
      log.error 'The docker daemon is not running'
      return false
    end

    log.debug 'The docker daemon is running'
    @docker_daemon_running = true
    true
  end
end