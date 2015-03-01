lua_nginx_ssi
=============

SSI parser to handle server side includes with Openresty Framework

* Clone Repo:    
git clone https://github.com/pygaur/lua_nginx_ssi.git ssi

* copy ssi into lualib folder

```
cp ssi/ /usr/local/openresty/lualib/
```

* How can i use it 
```
local ssi = require "ssi.ssi"   -- call library
local content = ssi:process_ssi(content)   -- pass content to check for available ssi tags 
return content   -- in new content ssi tags will be replaced with desired content.
```
