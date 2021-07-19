def my_reject(arr, &prc)

    arr.select { |ele| !prc.call(ele) }

end

def my_one?(arr, &prc)

    arr.select! { |ele| prc.call(ele) }
    arr.length == 1

end

def hash_select(hash, &prc)

    hash.delete_if { |k,v| !prc.call(k,v) }

end

def xor_select(arr, prc1, prc2)

    arr.select { |ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele)) }

end

def proc_count(value, arr)

    count = 0
    
    arr.each { |prc| count += 1 if prc.call(value) }
    
    count
        
end