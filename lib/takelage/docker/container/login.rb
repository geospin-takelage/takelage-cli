# frozen_string_literal: true

# takelage docker container login
module DockerContainerLogin
  # Backend method for docker container login.
  def docker_container_login
    log.debug 'Logging in to docker container'

    return false unless docker_check_running

    _docker_container_login_check_outdated
    docker_socket_start
    return false unless _docker_container_lib_create_net_and_ctr @hostname

    run_and_exit _docker_container_login_enter_container @hostname
  end

  private

  # Check if newer docker container is available.
  def _docker_container_login_check_outdated
    return if @docker_tag == 'latest'

    outdated = docker_image_check_outdated @docker_tag
    return unless outdated

    tag_latest = docker_image_tag_latest_remote
    log.warn "#{@docker_user}/#{@docker_repo}:#{@docker_tag} is outdated"
    log.warn "#{@docker_user}/#{@docker_repo}:#{tag_latest} is available"
  end

  # Prepare enter existing container command.
  def _docker_container_login_enter_container(container)
    log.debug "Entering container \"#{container}\""

    loginpoint = '/loginpoint.py'
    loginpoint += ' --debug ' if options[:development]

    format(
      config.active['cmd_docker_container_enter_container'],
      container: container,
      loginpoint: loginpoint,
      username: @username
    )
  end
end