task :upgrade_submodules do
  puts "---- Upgradeing submodules! ----"
  sh "git submodule foreach git pull origin master"
end

task :init_submodules do
  puts "---- Initing submodules! ----"
  sh "git submodule init"
  sh "git submodule update"
end

task :upgrade_emacs_packages do
  puts "---- Pulling lastest emacs packages ----"
  sh "./script/upgrade-emacs-package.el"
end

def rename_dotemacs(options = {})
  askp = options[:ask]
  needed_askp = false
  needed_rename = File.dirname(__FILE__) != File.expand_path("~/.emacs.d")
  if needed_rename && askp
    ["~/.emacs.d", "~/.emacs"].each do |dotemacs|
      if File.exists?(File.expand_path(dotemacs))
        puts "Detect your aleardy have dotemacs: " + dotemacs
        print "Rename to " + dotemacs + ".old" + " ?(y/n) "
        if gets.chomp == "y"
          File.rename(dotemacs, dotemacs + ".old")
        else
          return false
        end
      end
    end
  end
  if needed_rename
    File.rename(File.dirname(__FILE__),
                File.expand_path("~/.emacs.d"))
    return File.dirname(__FILE__)
  else
    return false
  end
end

task :default do
  renamed = rename_dotemacs(ask: true)
  if renamed
    Dir.chdir File.expand_path("~/.emacs.d")
  end
  puts "---- Pulling lastest Version ----"
  sh "git pull"
  sh "rake init_submodules"
  sh "rake upgrade_submodules"
  sh "rake upgrade_emacs_packages"
end
