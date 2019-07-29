# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::selbooleans
#
class system::selbooleans (
  $config   = undef,
  $sys_schedule = 'always',
) {
  if $::selinux == true {
    $defaults = {
      schedule => $sys_schedule,
    }
    if $config {
      create_resources(selboolean, $config, $defaults)
    }
    else {
      $hiera_config = hiera_hash('system::selbooleans', undef)
      if $hiera_config {
        create_resources(selboolean, $hiera_config, $defaults)
      }
    }
  }
}
