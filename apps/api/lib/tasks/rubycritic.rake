unless ENV['RAILS_ENV'] =~ /(production|staging)/
  require 'rubycritic/rake_task'

  RubyCritic::RakeTask.new do |task|
    task.name    = 'rubycritic'

    task.paths   = FileList['app', 'lib']

    task.options = "--minimum-score #{ENV['RUBYCRITIC_MINIMUM_SCORE']}"

    task.verbose = true
  end

  RubyCritic::RakeTask.new do |task|
    task.name    = 'rubycritic:ci'

    task.paths   = FileList['app', 'lib']

    task.options = "--mode-ci --format json --minimum-score #{ENV['RUBYCRITIC_MINIMUM_SCORE']}"

    task.verbose = true
  end
end
