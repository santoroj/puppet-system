# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::mounts
#
class system::mounts (
  Hash   $config       = undef,
  String $sys_schedule = 'always',
) {
  $defaults = {
    atboot   => true,
    ensure   => 'mounted',
    schedule => $sys_schedule,
  }
  if $config {
    create_resources(mount, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::mounts', undef)
    if $hiera_config {
      create_resources(mount, $hiera_config, $defaults)
    }
  }
}
