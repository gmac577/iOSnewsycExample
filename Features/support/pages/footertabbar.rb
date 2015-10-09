require 'calabash-cucumber/ibase'

class FooterTabBarPage < Calabash::IBase
 
    @@tabbar = "tabBarButton"

    @@homebtn = "label marked 'Home'"
    @@newbtn = "label marked:'New'"
    @@profilebtn = "label marked:'Profile'"
    @@searchbtn = "label marked:'Search'"
    @@morebtn = "label marked: 'More'"
    @@homeing = "tabBarSwappableImageView index:0"
    @@newimg = "tabBarSwappableImageView index:1"
    @@personimg = "tabBarSwappableImageView index:2"
    @@searchimg = "tabBarSwappableImageView index:3"
    @@moreimg = "tabBarSwappableImageView index:4"

    def select_tab(index)
        case index
            when "Home" then index = 0
            when "New" then index = 1
            when "Profile" then index = 2
            when "Search" then index = 3
            when "More" then index = 4
        end
        sleep 4
        wait_for_elements_exist([@@tabbar], :timeout => 10)
    	touch(@@tabbar + " index: #{index}")
    end
 end