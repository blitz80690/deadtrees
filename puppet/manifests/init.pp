$packages = [
	"postgresql",
	"libpq-dev",
]

$services = ["postgresql"]

exec { "apt-get update":
	command => "/usr/bin/apt-get update",
}

package { $packages:
	ensure  => installed,
	require => Exec["apt-get update"],
	notify  => Service[$services],
}

service { $services:
	ensure => running,
}

file { "/etc/postgresql/9.1/main/pg_hba.conf":
	source  => "/vagrant/puppet/files/etc/postgresql/9.1/main/pg_hba.conf",
	notify  => Service["postgresql"],
	require => Package["postgresql"],
	owner   => 'postgres',
	group   => 'postgres',
}
