# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::packages
#
class system::packages (
  Hash   $config       = undef,
  String $sys_schedule = 'always',
) {
  $defaults = {
    ensure   => 'installed',
    schedule => $sys_schedule,
  }
  if $config {
    create_resources(package, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::packages', undef)
    if $hiera_config {
      create_resources(package, $hiera_config, $defaults)
    }
  }
}
