#用perl进行base64转码，非常好用的代码

- time: 2012-03-27 11:17
- tags: perl

---

前一个帖子提到使用base64转码图片直接在浏览器里展示，文中也提供了一段使用php进行转码的代码很简练，但本人没有试用过（总是对php环境配置存在压力感）。我喜欢用perl代码段完成这类小事，下面分享两段好用的base64的encoding、decoding的代码。

encodeFile.pl : （转码： perl encodeFile.pl test.png test.txt）

```perl
#!/usr/bin/perl -w

use 5.012;
use MIME::Base64;
use Carp;

croak “usage: $0 file save_as” if @ARGV != 2;
open my $fh, ‘<’, $ARGV[0] or die $!;
binmode $fh;
open my $output, ‘>’, $ARGV[1] or die $!;
local $/;
print $output encode_base64 <$fh>, ”;
```

decodeFile.pl（反转：perl decodeFile.pl test.txt new.png）

```perl
#!/usr/bin/perl -w

use 5.012;
use MIME::Base64;
use Carp;
croak “usage: $0 file decode_to” if @ARGV != 2;
open my $fh, ‘<’, $ARGV[0] or die $!;
open my $output, ‘>’, $ARGV[1] or die $!;
binmode $output;
local $/;
print $output decode_base64 <$fh>;
```
