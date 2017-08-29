#Bubble Sort Project

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


test_array = [2,7,8,3,9,11,243,56,3,8,56]

print bubble_sort(test_array)