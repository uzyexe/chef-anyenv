default['anyenv']['root_path'] = '/usr/local/anyenv'

default['anyenv'] = {
  "perl"    => {
    versions:   %w{5.24.0},
    global:     "5.24.0"
  },

  "ruby"    => {
    versions:   %w{2.3.3},
    global:     "2.3.3"
  },

  "node"    => {
    versions:  %w{v6.9.1},
    global:    "v6.9.1"
  },

  "python"  => {
    versions:   %w{2.7.12 3.4.5},
    global:     "2.7.12"
  },

  "php"     => {
    versions:   %w{5.6.28 7.0.13},
    global:     "5.6.28"
  }
};

