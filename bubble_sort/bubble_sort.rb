#Bubble Sort Project

bubble_proc = Proc.new do |left,right|
	left.length - right.length
end

def bubble_sort(array)
	sort_check = false
		while sort_check == false
			array.each_with_index do |item,index|
				if (array[index+1])      #makes sure you're not looking past the size of array
					swap1 = array[index]
					swap2 = array[index+1]
					if swap1>swap2             # swap values
						array[index+1]=swap1
						array[index]=swap2
				    end
			    end
		    end
			
			sort_check = sorted?(array)    #test to see if the array is totally sorted, otherwise we need to keep sorting
			
		end
		return array
end

def bubble_sort_by(array,&block)
	
	sort_check = false
	while sort_check == false
		array.each_with_index do |item,index|
			if (array[index+1])      #makes sure you're not looking past the size of array
				swap1 = array[index]
				swap2 = array[index+1]
				compare = yield(swap1,swap2)
				if compare > 0            # swap values
					array[index+1]=swap1
					array[index]=swap2
				end
			end
		end
			
		sort_check = sorted_by?(array,&block)    #test to see if the array is totally sorted, otherwise we need to keep sorting
			
	end
	return array
end


def sorted?(array)
	check_list = []
	array.each_with_index do |item,index|
		if array[index+1]
			compare_val = array[index]<=>array[index+1]
			check_list << compare_val
		end
    end
    if check_list.any? {|item| item==1}  #if any value is greater than the value after it, return false
    	return false
    else
    	return true
    end
end

def sorted_by?(array,&block)
	check_list = []
	array.each_with_index do |item,index|
		if array[index+1]
			compare_val = yield(array[index],array[index+1])
			check_list << compare_val
		end
    end
    if check_list.any? {|item| item>1}  #if any value is greater than the value after it, return false
    	return false
    else
    	return true
    end
end



test_array = [2,7,8,3,9,11,243,56,3,8,56]
test_array_abc = ["hey","hi","abcdefghij","helloio"]

#print bubble_sort(test_array)
#print bubble_sort(test_array_abc)

puts bubble_sort_by(test_array_abc,&bubble_proc)
