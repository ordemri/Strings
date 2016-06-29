library StringUtils {

    function substr(string text, uint start, uint end) private returns (string){
        bytes memory d = bytes(text);
        bytes memory  b = new bytes(end-start);
        for(uint i = start; i<end;i++){
            b[i - start]=d[i];
        }
        return string(b);
    }
    
    function indexOf(string _haystack, string _needle) returns (int){
        return indexOf(_haystack,_needle,0);
    }
    
	function indexOf(string _haystack, string _needle,uint _start)  returns (int)
	{
		bytes memory h = bytes(_haystack);
		bytes memory n = bytes(_needle);
		if(h.length < 1 || n.length < 1 || (n.length > h.length)) 
			return -1;
		else if(h.length > (2**128 -1)) 
			return -1;                                  
		else
		{
			uint subindex = 0;
			for (uint i = _start; i < h.length; i ++)
			{
				if (h[i] == n[0]) 
				{
					subindex = 1;
					while(subindex < n.length && (i + subindex) < h.length && h[i + subindex] == n[subindex])
					{
						subindex++;
					}   
					if(subindex == n.length)
						return int(i);
				}
			}
			return -1;
		}   

	}

}

