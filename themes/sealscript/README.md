SealScript
=============

Overview
--------------

This is the default theme on [catsup](https://github.com/whtsky/catsup).
It's designed by [Lyric Wai](https://github.com/lyricat) and ported by [whtsky](http://whouz.com).

Online demo: [messence](http://messense.me/)

Installation
--------------

Requires catsup 0.0.6+

The easy way using `catsup install` :
```bash
cd /path/to/your/blog
catsup install git://github.com/whtsky/catsup-theme-sealscript.git
```

The hard way using git manually:
```bash
cd /path/to/your/blog
mkdir themes
cd themes
git clone git://github.com/whtsky/catsup-theme-sealscript.git
mv catsup-theme-sealscript sealscript
```

Configuration
--------------
Edit your configuration file, change `theme.name` to `sealscript`

Customize
--------------
You can customize your theme by changin `theme.vars`

+ Change blog description
```json
{
    "theme": {
        "name": "sealscript",
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
        "name": "sealscript",
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
        "name": "sealscript",
        "vars": {
            "links": [
                {
                    "name": "catsup",
                    "url": "https://github.com/whtsky/catsup",
                    "description": "Awesome!"
                }
            ]
        }
    }
}
```