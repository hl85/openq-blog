<<<<<<< HEAD
SealScript
=======
PureSam
>>>>>>> 4530684490b62efeacbfc80dd113c331a4fe65fa
=============

Overview
--------------

<<<<<<< HEAD
This is the default theme on [catsup](https://github.com/whtsky/catsup).
It's designed by [Lyric Wai](https://github.com/lyricat) and ported by [whtsky](http://whouz.com).

Online demo: [messence](http://messense.me/)
=======
This is a theme on [catsup](https://github.com/whtsky/catsup).
It's designed by [sam wang](https://github.com/hl85) .

Online demo: [openq](http://openq.cn/)
>>>>>>> 4530684490b62efeacbfc80dd113c331a4fe65fa

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
<<<<<<< HEAD
You can customize your theme by changin `theme.vars`
=======
You can customize your theme by change `theme.vars`
>>>>>>> 4530684490b62efeacbfc80dd113c331a4fe65fa

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
<<<<<<< HEAD
                    "name": "catsup",
                    "url": "https://github.com/whtsky/catsup",
=======
                    "name": "openq",
                    "url": "http://openq.cn",
>>>>>>> 4530684490b62efeacbfc80dd113c331a4fe65fa
                    "description": "Awesome!"
                }
            ]
        }
    }
}
<<<<<<< HEAD
```
=======
```
>>>>>>> 4530684490b62efeacbfc80dd113c331a4fe65fa
