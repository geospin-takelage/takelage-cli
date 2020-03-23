Given 'I ask docker about the latest local docker image' do
  docker_repo = @config['docker_repo']
  docker_image = @config['docker_image']
  cmd_docker_images = 'docker images ' +
      " | grep #{docker_repo}/#{docker_image} " +
      " | awk '{print $2}' " +
      " | awk '{print $NF}' " +
      ' | head -1'
  @tag_latest_local = `#{cmd_docker_images}`
end

Then 'the local images match' do
  expect(last_command_started.output).to eq @tag_latest_local
end
