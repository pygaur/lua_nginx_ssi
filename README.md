lua_nginx_ssi
=============

SSI parser to handle server side includes with Openresty Framework

Step 1 :    
Clone Repo:    
git clone https://github.com/pygaur/lua_nginx_ssi.git

Step 2 :    
Create Symbolic link to store ssi/ssi.lua into lualib folder.    
Example :   ln -s /home/pylover/lua_nginx_ssi/  /usr/local/openresty/lualib/    

Step 3 :    
How to use  into code:    
-- if return content is stored into content .    
            local ssi = require "ssi.ssi"       
            local content = ssi:process_ssi(content)   -- content with ssi tags    
            return content   -- return content with response coming from ssi tags.    
  
