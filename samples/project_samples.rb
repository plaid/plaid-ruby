require 'ruble'

project_sample "Project Sample Example" do |s|
    s.id = "sample.local"
    s.category = "com.aptana.projects.samples.web.category"
    s.location = "samples/local_sample.zip"
    s.description = "A basic project sample"
    s.natures = ["com.aptana.projects.webnature"]
end