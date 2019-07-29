# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::augeas
#
class system::augeas (
  $config   = undef,
  $sys_schedule = 'always',
){
  $defaults = {
    schedule => $sys_schedule,
  }
  if $config {
    create_resources(augeas, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::augeas', undef)
    if $hiera_config {
      create_resources(augeas, $hiera_config, $defaults)
    }
  }
}
