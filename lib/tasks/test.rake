require "rake"

task "test:prepare" do
  Rake::Task["db:migrate"].invoke
end
