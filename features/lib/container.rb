def stop_mock_container
  cmd_stop_mock_container_cucumber = 'tau-cli docker container check existing takelage-mock_cucumber && ' +
      'docker stop takelage-mock_cucumber ' +
      '&> /dev/null'
  cmd_stop_mock_container_finite = 'tau-cli docker container check existing takelage-mock_finite && ' +
      'docker stop takelage-mock_cucumber ' +
      '&> /dev/null'
  cmd_stop_mock_container_infinite = 'tau-cli docker container check existing takelage-mock_infinite && ' +
      'docker stop takelage-mock_cucumber ' +
      '&> /dev/null'
  system cmd_stop_mock_container_cucumber
  system cmd_stop_mock_container_finite
  system cmd_stop_mock_container_infinite
end

def container_after_all
  stop_mock_container
end
