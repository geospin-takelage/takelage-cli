# takelage docker image tag list module
module DockerImageTagListModule

  # Backend method for docker image tag list local.
  # @return [Array] local docker image tags
  def docker_image_tag_list_local
    tags = []

    cmd_docker_tags =
        config.active['cmd_docker_image_tag_list_local_docker_images'] % {
            docker_user: @docker_user,
            docker_repo: @docker_repo
        }

    stdout_str = run cmd_docker_tags

    tags = stdout_str.split("\n")

    VersionSorter.sort(tags)
  end

  # Backend method for docker image tag list remote.
  # @return [Array] remote docker image tags
  def docker_image_tag_list_remote
    log.debug "Getting docker remote tags " +
                  "of \"#{@docker_user}/#{@docker_repo}\" " +
                  "from \"#{@docker_registry}\""

    user = File.basename @docker_user
    begin
      registry = DockerRegistry2.connect(@docker_registry)
      tags = registry.tags("#{user}/#{@docker_repo}")
    rescue RestClient::Exceptions::OpenTimeout
      log.error "Timeout while connecting to \"#{@docker_registry}\""
      return false
    end

    VersionSorter.sort(tags['tags'])
  end
end
