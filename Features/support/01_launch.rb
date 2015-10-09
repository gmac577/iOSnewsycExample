

require 'calabash-cucumber/launcher'


#APP_BUNDLE_PATH = "~/Library/Developer/Xcode/DerivedData/newsyc-hffmfirwfnwtebfqxieaxdiqmjko/Build/Products/Debug-iphonesimulator/newsyc.app"
# You may uncomment the above to overwrite the APP_BUNDLE_PATH
# However the recommended approach is to let Calabash find the app itself
# or set the environment variable APP_BUNDLE_PATH

Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new
 # @calabash_launcher.reset_simulator_content_and_settings
  unless @calabash_launcher.calabash_no_launch?
    launch_options = {:uia_strategy => :shared_element}
    @calabash_launcher.relaunch(launch_options)
    @calabash_launcher.calabash_notify(self)
  end
end

After do |scenario|
  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end

at_exit do
  launcher = Calabash::Cucumber::Launcher.new
  if launcher.simulator_target?
    launcher.simulator_launcher.stop unless launcher.calabash_no_stop?
  end
end
