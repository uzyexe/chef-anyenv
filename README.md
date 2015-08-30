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
      "versions":   ["5.22.0"],
      "global":     "5.22.0"
    },
    "ruby": {
      "versions":   ["2.2.3","2.2.2"],
      "global":     "2.2.3"
    },
    "node": {
      "versions":  ["v0.12.7"],
      "global":    "v0.12.7"
    },
    "python": {
      "versions":   ["2.7.10","3.4.3"],
      "global":     "2.7.10"
    },
    "php": {
      "versions":   ["5.6.11"],
      "global":     "5.6.11"
    }
  }
}
```

# Authors and Contributors

* Shuji Yamada (<uzy.exe@gmail.com>)
