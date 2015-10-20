require 'calabash-cucumber/ibase'

class NavTabBarPage < Calabash::IBase
 
    @@tabbar = "toolbarNavigationButton"

    @@reply = "navigationButton index:0"
    @@upvote = "navigationButton index:1"
    @@flag = "navigationButton index:2"
    @@downvote = "navigationButton index:3"
    @@action = "navigationButton index:4"
    @@share = "navigationButton index:5"
    @@back = "label {text LIKE '*Hacker News*'}"
    @@homeimg = "tabBarSwappableImageView index:0"
    @@newimg = "tabBarSwappableImageView index:1"
    @@personimg = "tabBarSwappableImageView index:2"
    @@searchimg = "tabBarSwappableImageView index:3"
    @@moreimg = "tabBarSwappableImageView index:4"
    @@progress = "label {text LIKE '*Continue*'}"
    @@noprogress = "label {text LIKE '*Cancel*'}" 
    @@doflag = "label {text LIKE '*Flag*'}" 
    @@submitter = "label {text LIKE '*Submitter*'}" 


    #-----------------------------------------------
#these two functions take the place of the sleep function
#to inc/dec time, adjust the amount of microseconds when you call the "sleeper" function

 def sleeper(clock)
   n = 0
   tm = clock
   every(0.1) do
     #puts Time.now.usec / 1000
     n += 1
     break if n == tm
   end
 end

 def every(period)
    base = last = Time.now.to_f
    count = 0

    loop do
      now = Time.now.to_f
      actual_secs = now - base
      expected_secs = period * count
      correction = expected_secs - actual_secs
      correction = -period if correction < -period
      select(nil, nil, nil, period + correction)
      now = Time.now
      last = now.to_f
      count += 1
      yield(now)
    end
  end
#--------------------------------------------

    def select_storytab(index)
        case index
            when "Reply" then
               touch(@@reply)
               sleeper(30)
            when "Upvote" then
               vote_handler
               sleeper(30)
            when "Flag" then
               touch(@@flag)
               sleeper(30)
            when "Downvote" then
               touch(@@downvote)
               sleeper(30)
            when "Action" then
               touch(@@action)
               sleeper(30)
        end
 end

 	def vote_handler
 		sleeper(16)
 		touch(@@upvote)
 		if element_exists([@@progress]) then
 			sleeper(16)
 			touch(@@progress)
 			touch(@@back)
 		else
 			sleeper(16)
 			touch(@@back)
  		end
  	end

  	def flag_handler(action)
  		case action
			when "Flag" then 
  		  	  touch(@@doflag)
  		  	  sleeper(16)
 			  touch(@@progress)
 			  touch(@@back)
  		    when "Cancel" then
  		  	 touch(@@noprogress)
  		  	 touch(@@back)
         	end
	end

	def sub_handler
			touch(@@submitter)
  	end

	





end