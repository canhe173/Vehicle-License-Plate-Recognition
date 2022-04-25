function result = identityLetter(model, word)
[height,width, num] = size(model);
for n=1:num    
    sums = 0;    
    for h=1:height        
        for w=1:width            
            if word(h,w) == model(h,w,n)                
                sums = sums + 1;            
            end
        end
    end
    ratio(n) = sums/(height*width);
end
result_index = find(ratio>=max(ratio));
base = 64;
result = char(base + result_index);
end
