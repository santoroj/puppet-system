# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::sysctl
#
class system::sysctl (
  $config   = undef,
  $sys_schedule = 'always',
) {
  $defaults = {
    schedule => $sys_schedule,
  }
  if $config {
    include augeasproviders
    create_resources(sysctl, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::sysctl', undef)
    if $hiera_config {
      include augeasproviders
      create_resources(sysctl, $hiera_config, $defaults)
    }
  }
}
