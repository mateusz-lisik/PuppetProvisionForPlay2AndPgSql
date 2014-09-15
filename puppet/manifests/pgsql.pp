class { 'postgresql::server':
  ip_mask_allow_all_users    => '0.0.0.0/0',
  listen_addresses           => '*',
  postgres_password          => 'root',
} 

postgresql::server::db { 'ebook-project':
  user     => 'root',
  password => postgresql_password('root', 'root'),
}
