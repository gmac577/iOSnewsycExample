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

    def select_storytab(index)
        case index
            when "Reply" then touch(@@reply)
            when "Upvote" then vote_handler
            when "Flag" then touch(@@flag)
            when "Downvote" then touch(@@downvote)
            when "Action" then touch(@@action)
        end
 end

 	def vote_handler
 		sleep 3
 		touch(@@upvote)
 		if element_exists([@@progress]) then
 			sleep 3
 			touch(@@progress)
 			touch(@@back)
 		else
 			sleep 3
 			touch(@@back)
  		end
  	end

  	def flag_handler(action)
  		case action
			when "Flag" then 
  		  	  touch(@@doflag)
  		  	  sleep 3
 			  touch(@@progress)
 			  touch(@@back)
  		    when "Cancel" then
  		  	 touch(@@noprogress)
  		  	 touch(@@back)
          end
	end







end