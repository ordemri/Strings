contract LazyStringBuilder {
    
    bytes[] a;  
    uint index = 0;
    bytes  cache;
    uint cacheIndex = 0;


    
    function append(string str){
       bytes memory n = bytes(str);
        if(n.length > 0){
            a.push(n);
            index += n.length;
            delete n;
        } else {
            throw;
        }
    }
    
    function toString() returns (string){
        if (index > 0){
            if (cacheIndex != a.length){
            uint c = 0;
            bytes memory b = new bytes(index);
            if(cacheIndex > 0){
                for(uint i1 =0;i1<cache.length;i1++){
                  b[c] = cache[c];   
                  c++;
                }
            }
            for(uint i = cacheIndex; i < a.length ; i ++){
                for(uint j =0; j < a[i].length; j ++){
                    b[c++] = a[i][j];
                }    
            }
            cache = b;
            cacheIndex = a.length;
            delete b;
            }
        return string (cache);
        }
        else {
            return "";
        }
    }
}
