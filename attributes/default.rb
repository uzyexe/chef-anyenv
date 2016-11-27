default['anyenv']['root_path'] = '/usr/local/anyenv'

default['anyenv'] = {
  "perl"    => {
    versions:   %w{5.22.0},
    global:     "5.22.0"
  },

  "ruby"    => {
    versions:   %w{2.2.3},
    global:     "2.2.3"
  },

  "node"    => {
    versions:  %w{v0.12.7},
    global:    "v0.12.7"
  },

  "python"  => {
    versions:   %w{2.7.10 3.4.3},
    global:     "2.7.10"
  },

  "php"     => {
    versions:   %w{5.6.11},
    global:     "5.6.11"
  }
};

