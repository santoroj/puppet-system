# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::groups
#
class system::groups (
  $config   = undef,
  $sys_schedule = 'always',
  $real     = false,
) {
  $defaults = {
    ensure   => 'present',
    schedule => $sys_schedule,
  }
  if $real {
    $type = 'group'
  }
  else {
    $type = '@group'
  }
  if $config {
    system_create_resources($type, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::groups', undef)
    if $hiera_config {
      system_create_resources($type, $hiera_config, $defaults)
    }
  }
}
