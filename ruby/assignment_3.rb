class Assignment3
    attr_accessor :hash

    def initialize()
        @hash = {}
    end

    def add_hash(key, value)
        hash.store(key, value)
        return hash
    end
    
    def remove_hash()
        hash.each do |hash_key, hash_value|
            if !hash_key.is_a? Integer or (hash_key.is_a? Integer and hash_key % 2 == 0)
                hash.delete(hash_key)
            end
        end
        return hash
    end
end

# hash = {
#     'abc' => 'def',
#     :jkl => 'yyy',
#     'onp' => 'ddd',
#     89346 => 67
# }

# insert element into hash
# hash.store(543121, 100)
# hash[543121] = 100

# assg3 = Assignment3.new()
# assg3.add_hash(543121, 100)
# assg3.add_hash(78, 657)
# assg3.add_hash(:jkl, 'yyy')
# assg3.add_hash('onp', 'ddd')
# assg3.remove_hash()