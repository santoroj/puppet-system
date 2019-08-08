# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::users
#
class system::users (
  Hash    $config       = undef,
  String  $sys_schedule = 'always',
  Boolean $real         = false,
) {
  $defaults = {
    ensure   => 'present',
    schedule => $sys_schedule,
    shell    => '/bin/bash',
  }
  if $real {
    $type = 'user'
  }
  else {
    $type = '@user'
  }
  if $config {
    create_resources($type, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::users', undef)
    if $hiera_config {
      create_resources($type, $hiera_config, $defaults)
    }
  }
}

