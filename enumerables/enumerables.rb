#recreating enumerable methods

module Enumerable
	def my_each
		for i in 0...self.size
			yield(self[i])
	     end
	end

	def my_each_with_index
		for i in 0...self.size
			yield(self[i],i)
	     end
	end

	def my_select
		selected=[]
		self.my_each do |i|
			if yield(i)
				selected << i
			end
		
		end
		return selected
	end

	def my_all?
        all=true
		self.my_each do |i|
			unless yield(i)
				all = false
			end
		end
        return all
	end

	def my_any?
		any = false
		self.my_each do |i|
			if yield(i)
				any = true
			end
		end
	    return all
	end

	def my_none?
		none = true
		self.my_each do |i|
			if yield(i)
				none = false
			end
		end
		return none
	end

    def my_count
    	count = 0
    	self.my_each do |i|
    			if yield(i)
    				count+=1
    			end
    		end
    	return count
    end

    def my_map(&p)
    	collection=[]
    	self.my_each do |i|
    			collection << p.call(i)
   
    	end
    	return collection
    end

    def my_inject(result=0)
    	self.my_each do |i|	
    		result = yield(result,i)	
    	end
      return result
    end

    def multiply_els
    	self.my_inject(1){|res,element| res*element}
    end
end

test_array = [1,2,3,4]
test_proc = Proc.new {|i| i * 2}
#test_array.my_each {|x| print x}
puts " "
#test_array.my_each_with_index {|x,y| puts x,y}
#puts " "
#puts test_array.my_select {|x| x>2}
#puts test_array.my_all? {|x| x>2}
print test_array.my_map(&test_proc){|i| i * 2}
#puts test_array.my_inject{|res,element| res+element}
#puts " "
#puts test_array.multiply_els