# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::execs
class system::execs (
  Hash   $config       = undef,
  String $sys_schedule = 'always',
) {
  $defaults = {
    schedule => $sys_schedule,
  }
  if $config {
    create_resources(exec, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::execs', undef)
    if $hiera_config {
      create_resources(exec, $hiera_config, $defaults)
    }
  }
}
