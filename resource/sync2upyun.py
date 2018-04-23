import upyun
up = upyun.UpYun('store-openq','hl13571','xxxxxxxx',timeout=30,endpoint=upyun.ED_CNC)

#upload https://github.com/upyun/python-sdk
headers = { 'x-gmkerl-rotate':'180' }
with open('xxx.png','rb') as f:
    res = up.put('/upyun/filepath/xxx.png', f, checksum=Ture, headers = headers)

