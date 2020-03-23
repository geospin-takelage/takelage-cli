Aruba.configure do |config|
  config.home_directory = '/tmp/fake_home'
  config.working_directory = '../tmp/cucumber'
  config.activate_announcer_on_command_failure = [:stderr, :stdout, :command]
  config.exit_timeout = 60
end
