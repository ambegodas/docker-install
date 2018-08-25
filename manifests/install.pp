class pathmasri-docker::install{

 
exec{"addKey":

path => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
command => 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -',

}

exec{"addRepo":

path => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
command => 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"',
require => Exec['addKey'],

}

exec{"update":

path => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
command => 'sudo apt-get update',
require => Exec['addRepo'],

}

exec{"apt-cache":

path => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
command => 'apt-cache policy docker-ce',
require => Exec['update'],

}
exec{"apt-install":

path => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
command => 'sudo apt-get install -y docker-ce',
require => Exec['apt-cache'],
}

}
