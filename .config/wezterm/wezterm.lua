config.ssh_domains = {
  {
    -- This name identifies the domain
    name = 'raspi',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    remote_address = '192.168.1.1',
    -- The username to use on the remote host
    username = 'tjex',
  },
}
