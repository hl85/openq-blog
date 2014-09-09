PureSam
=============

Overview
--------------

This is a theme on [catsup](https://github.com/whtsky/catsup).
It's designed by [sam wang](https://github.com/hl85) .

Online demo: [openq](http://openq.cn/)

Installation
--------------

Requires catsup 0.0.6+

The easy way using `catsup install` :
```bash
cd /path/to/your/blog
catsup install git://github.com/hl85/catsup-theme-puresam.git
```

The hard way using git manually:
```bash
cd /path/to/your/blog
mkdir themes
cd themes
git clone git://github.com/hl85/catsup-theme-puresam.git
mv catsup-theme-puresam puresam
```

Configuration
--------------
Edit your configuration file, change `theme.name` to `puresam`

Customize
--------------
You can customize your theme by change `theme.vars`

+ Change blog description
```json
{
    "theme": {
        "name": "puresam",
        "vars": {
            "description": "description here",
        }
    }
}
```

+ Add your GitHub link
```json
{
    "theme": {
        "name": "puresam",
        "vars": {
            "github": "your github username",
        }
    }
}
```

+ Add links in footer
```json
{
    "theme": {
        "name": "puresam",
        "vars": {
            "links": [
                {
                    "name": "openq",
                    "url": "http://openq.cn",
                    "description": "Awesome!"
                }
            ]
        }
    }
}
```
