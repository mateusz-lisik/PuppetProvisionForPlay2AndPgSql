include wget

wget::fetch { "Get play-framework":
  source      => "http://downloads.typesafe.com/typesafe-activator/$activatorversion/typesafe-activator-$activatorversion-minimal.zip",
  destination => '/tmp/pf.zip',
  timeout     => 0,
  verbose     => false,
}

exec { 'Unpack play-framework':
  command     => '/usr/bin/unzip -o pf.zip -d /opt/',
  cwd         => '/tmp',
  user        => 'root',
}

pathmunge { "/opt/activator-$activatorversion-minimal": }