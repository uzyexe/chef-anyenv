# anyenv Cookbook

Installs and configures anyenv and \*env

# Requirements

* Chef 12
* Centos / Redhat / Fedora / Ubuntu / Debian / OSX
* Ruby >= 1.9

# Usage

## Attributes

anyenv.(perl|ruby|node|python|php)
  .versions: install versions
  .global: set to global version

## anyenv::default
```json
{
  "anyenv": {
    "perl": {
      "versions":   ["5.24.0"],
      "global":     "5.24.0"
    },
    "ruby": {
      "versions":   ["2.3.3","2.2.5"],
      "global":     "2.3.3"
    },
    "node": {
      "versions":  ["v6.9.1"],
      "global":    "v6.9.1"
    },
    "python": {
      "versions":   [ "2.7.12", "3.4.5" ],
      "global":     "2.7.12"
    },
    "php": {
      "versions":   [ "5.6.28", "7.0.13" ],
      "global":     "5.6.28"
    }
  }
}
```

# Authors and Contributors

* Shuji Yamada (<uzy.exe@gmail.com>)


## License

This project is licensed under the terms of the MIT license.
