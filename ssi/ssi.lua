local ngx = ngx
local ok, new_tab = pcall(require, "table.new")

if not ok then
    new_tab = function (narr, nrec) return {} end
end

local _M = new_tab(0, 151)
_M._VERSION = '1.0'

local mt = { __index = _M }

--  main logic 
-- current logic handles two directives only
-- 1 : file
-- 2 : virtual

function _M.process_ssi(self, content)
    -- See if content is having ssi tag with virtual , file directive

    for tag in ngx.re.gmatch(content, "<!--# include (\\bvirtual\\b|\\bfile\\b)=(\"|')(.+)(\"|').* -->") do
        if tag[1] == 'virtual' then            
            if tag[3]:sub(-1) ~= "/" then                                   -- see if url is having slash(/) in end 
	              url = tag[3]..'/'                                           -- append slash(/) in end
	          else
   	            url = tag[3]
   	    end
	      elseif tag[1] == 'file' then
            url = tag[3] 
        end
    response_ssi = ngx.location.capture(url)                               -- hit django server to get response           			
    response_ssi = _M.process_ssi(self, response_ssi.body)                                -- recursive call to see ssi tags
    if response_ssi.body == nil then                                             -- final recursion call
        response_ssi = {['body'] = response_ssi}                                          -- if res == content means no ssi tags 
    end            
    if tag[1] == 'virtual' then         
        content = ngx.re.gsub(content, "<!--# include virtual=".."(\"|')"..tag[3].."(\"|')".."* -->", response_ssi.body)    -- replace include tag with response
    end
    if tag[1] == 'file' then  
        content = ngx.re.gsub(content, "<!--# include file=".."(\"|')"..tag[3].."(\"|')".."* -->", response_ssi.body)    -- replace include tag with response 
	  end
    end
return content
end
return _M
