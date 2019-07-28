# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::files
class system::files {
  $config   = undef,
  $sys_schedule = 'always',
) {
  $defaults = {
    ensure   => 'present',
    schedule => $sys_schedule,
  }
  if $config {
    create_resources(file, $config, $defaults)
  }
  else {
    $hiera_config = hiera_hash('system::files', undef)
    if $hiera_config {
      create_resources(file, $hiera_config, $defaults)
    }
  }
}
