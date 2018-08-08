(*Yuan Yang*)
(*CSE341 Homework 1*)

(* Helper functions *)
fun getYear ( input:int*int*int) = #1 input
				      
fun getMonth ( input:int*int*int) = #2 input
				       
fun getDay ( input:int*int*int) = #3 input
				     
fun is_older ( d1:int*int*int, d2:int*int*int ) =
    if getYear(d1) < getYear(d2) then true
    else if getYear(d1) > getYear(d2) then false
    else if getMonth(d1) < getMonth(d2) then true
    else if getMonth(d1) > getMonth(d2) then false
    else if getDay(d1) < getDay(d2) then true
    else false
	     

	    
fun number_in_month(listOfDates:(int*int*int)list, month:int) =
    let
	fun traverse_list(counter:int, input:(int*int*int)list) =
	    if null input then counter
	    else
		if getMonth(hd input) = month	then traverse_list(counter+1, tl input)
		else traverse_list(counter, tl input)
    in
	traverse_list(0, listOfDates)
    end
	

fun number_in_months(dates:(int*int*int)list, months:int list) =
    let
	fun compare(givenMonth:int, currentMonths:int list) =
	    if null currentMonths then false
	    else
		if givenMonth = (hd currentMonths) then true
		else compare(givenMonth, tl currentMonths)

	fun traverse_list(datesRest:(int*int*int)list, counter:int) =
	    if null datesRest then counter
	    else
		if compare(getMonth(hd datesRest),months) then traverse_list(tl datesRest, counter+1)
		else traverse_list(tl datesRest, counter)

    in
	traverse_list(dates,0)
    end
	
     
fun dates_in_month(dates:(int*int*int)list, month:int) =
    let
	fun traverse_list(datesRest:(int*int*int) list, result:(int*int*int) list) =
	    if null datesRest then result
	    else
		if getMonth(hd datesRest) = month
		then traverse_list(tl datesRest, hd datesRest :: result)
		else traverse_list(tl datesRest, result)
    in
	traverse_list(dates, [])
    end
	
    
fun dates_in_months(dates:(int*int*int) list, months:int list) =
    let
	fun traverse_list(remaining:int list, result:(int*int*int)list) =
	    if null remaining then result
	    else
		traverse_list(tl remaining, dates_in_month(dates, hd remaining) @ result)
    in
	traverse_list(months,[])
    end
	
					    

fun get_nth(inputList:string list, index:int) =
    if index > 1 then get_nth(tl inputList, index - 1)
    else
	hd inputList


	   
fun date_to_string(date:int*int*int) =
    let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in get_nth(months, getMonth(date)) ^ " " ^
       Int.toString(getDay(date)) ^ ", " ^ Int.toString(getYear(date))
    end
	
	   
fun number_before_reaching_sum(sum:int, integerList:int list) =
    let
	fun find_index(remaining:int list, current_sum:int, index:int) =
	    if current_sum > sum then index - 1
	    else
		find_index(tl remaining, (hd remaining) + current_sum, index +1)
    in
	find_index(integerList,0,0)
    end
	
    
fun what_month(day:int) =
    let val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in number_before_reaching_sum(day, days) + 1
    end
	

fun month_range(day1:int, day2:int) =
    if day1 > day2 then []
    else
	[what_month(day1)] @ month_range(day1 + 1, day2)
	       
fun oldest(dates:(int*int*int) list) =
    if null dates then NONE
    else
	let
	    fun traverse_list(target:(int*int*int), remaining:(int*int*int) list) =
		if null remaining then SOME target
		else
		    if is_older(target, hd remaining)
		    then
			traverse_list(target, tl remaining)
		    else
			traverse_list(hd remaining, tl remaining)
	in
	    traverse_list(hd dates, tl dates)
	end
	    
