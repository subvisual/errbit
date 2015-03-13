package { 'mongodb':
  ensure => installed,
}

package { 'zlib1g-dev':
  ensure => installed,
}

gb::ruby { 'ruby-2.2.0': }

gb::capistrano { 'gb-log': }
