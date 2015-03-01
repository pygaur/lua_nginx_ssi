lua_nginx_ssi
=============

SSI parser to handle server side includes with Openresty Framework

Step 1 :    
Clone Repo:    
git clone https://github.com/pygaur/lua_nginx_ssi.git ssi

Step 2 :    
cp ssi/ /usr/local/openresty/lualib/

Step 3 :    
How can i use it 

local ssi = require "ssi.ssi"
local content = ssi:process_ssi(content)   -- content with ssi tags
return content   -- return content with response coming from ssi tags.
