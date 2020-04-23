# frozen_string_literal: true

# takelage docker container daemon
module DockerContainerDaemon
  # Backend method for docker container daemon.
  def docker_container_daemon
    log.debug 'Starting docker container as daemon'

    return false unless docker_check_running

    _docker_container_lib_create_net_and_ctr @hostname
  end
end
