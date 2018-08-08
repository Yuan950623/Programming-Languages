val a = (4,8,2009)
val b = (5,8,2009)
val r1 = is_older(a,b) (* should be true *)
val r2 = is_older(b,a)

val d = [(1,4,2008),(6,4,2009),(18,5,2003),(2,4,2000)]
val n = number_in_month(d,4)

val nr = number_in_months(d,[4,5])

val dates = dates_in_month(d,4)

val dr = dates_in_months(d,[4,5])

val strs = ["ricky","zhang","kevin","garnett","allen","iverson"]
val str = get_nth(strs,4)

val nums = [1,2,3,4,5,6,7]
val nbr = number_before_reaching_sum(10,nums)

val dates = [(12,3,2007),(24,2,2008),(23,8,2009),(10,3,2007)]
val or = oldest(dates)

			   

