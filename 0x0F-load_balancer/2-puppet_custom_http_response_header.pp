
Terminal #1
Terminal #fest to configure Nginx with a custom header
class nginx_custom_header {
  package { 'nginx':
    ensure => installed,
  }

  file_line { 'nginx_custom_header':
    path => '/etc/nginx/sites-available/default',
    line => '\tadd_header X-Served-By $hostname;',
    match => '^\\tserver_name _;',
    append_on_no_match => true,
    notify => Service['nginx'],
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}

include nginx_custom_header
