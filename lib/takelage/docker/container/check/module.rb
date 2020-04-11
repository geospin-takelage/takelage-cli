# takelage docker container check module
module DockerContainerCheckModule

  # Backend method for docker container check existing.
  # @return [Boolean] is container existing?
  def docker_container_check_existing(container)
    log.debug "Checking if container \"#{container}\" is existing"

    return false unless docker_check_running

    cmd_docker_existing =
        config.active['docker_existing'] % {container: container}

    stdout_str = run cmd_docker_existing

    if stdout_str.to_s.strip.empty?
      log.debug "Container \"#{container}\" is not existing"
      return false
    end

    log.debug "Container \"#{container}\" is existing"
    true
  end

  # Backend method for docker container check network.
  # @return [Boolean] is network existing?
  def docker_container_check_network(network)
    log.debug "Checking if network \"#{network}\" is existing"

    return false unless docker_check_running

    cmd_docker_network =
        config.active['docker_network'] % {network: network}

    stdout_str = run cmd_docker_network

    if stdout_str.to_s.strip.empty?
      log.debug "Network \"#{network}\" is not existing"
      return false
    end

    log.debug "Network \"#{network}\" is existing"
    true
  end

  # Backend method for docker container check orphaned.
  # @return [Boolean] is container orphaned?
  def docker_container_check_orphaned(container)
    log.debug "Check if container \"#{container}\" is orphaned"

    return false unless docker_check_running

    cmd_docker_orphaned =
        config.active['docker_orphaned'] % {container: container}

    stdout_str = run cmd_docker_orphaned

    if stdout_str.include? '/loginpoint.py'
      log.debug "Container \"#{container}\" isn't orphaned"
      return false
    end

    log.debug "Container \"#{container}\" is orphaned"
    true
  end
end
