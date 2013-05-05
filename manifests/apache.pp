
class biocloudcentral::apache (
  $port     = 80,
  $priority = 10,
  $ssl_cert = undef,
  $ssl_key  = undef,
) {

  # Local variables needed for templates
  $destination = $biocloudcentral::config::destination
  $biocloudcentral_user = $biocloudcentral::config::user
  $log_dir = $biocloudcentral::config::log_dir

  $ssl = ($ssl_cert != undef) and ($ssl_key != undef)

  apache::vhost { 'biocloudcentral':
    port            => $port,
    custom_fragment => template('biocloudcentral/vhost.erb'),
    docroot         => $destination,
    priority        => $priority,
    ssl             => $ssl,
    ssl_cert        => '/etc/ssl/biocloudcentral.cert',
    ssl_key         => '/etc/ssl/biocloudcentral.key',
  }

  if $ssl {
    file { '/etc/ssl/biocloudcentral.cert':
      content => $ssl_cert,
    }
    file { '/etc/ssl/biocloudcentral.key':
      content => $ssl_key,
    }
  }

}