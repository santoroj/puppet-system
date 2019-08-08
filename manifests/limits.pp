# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::limits
#
class system::limits (
  Hash   $config       = undef,
  String $sys_schedule = 'always',
) {
  if $config {
    include limits
    class { 'limits':
      config    => $config,
      use_hiera => false,
      #schedule => $sys_schedule,
    }
  }
  else {
    $hiera_config = hiera_hash('system::limits', undef)
    if $hiera_config {
      include limits
      class { 'limits':
        config    => $hiera_config,
        use_hiera => false,
        #schedule => $sys_schedule,
      }
    }
  }
}
