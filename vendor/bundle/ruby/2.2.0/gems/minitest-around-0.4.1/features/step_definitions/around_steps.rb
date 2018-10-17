require 'tempfile'

Given(/^a file named "(.*?)" with:$/) do |filename, content|
  write_test_file(filename, content)
end

When(/^I run `rspec.*?(\S+)`$/) do |filename|
  path = path_for(filename)
  @output = `ruby #{path}`
end

Then(/^the output should contain:$/) do |content|
  assert_includes @output, content, @output
end

Then(/^the output should contain "(.*?)"$/) do |content|
  # 1 runs, 0 assertions, 0 failures, 0 errors, 0 skips
  runs = $1 if content =~ /(\d+) examples?/
  errors = $1 if content =~ /(\d+) errors?/
  failures = $1 if content =~ /(\d+) failures?/
  skips = $1 if content =~ /(\d+) pending/
  content = /#{runs} runs, \d+ assertions, #{failures || 0} failures, #{errors || 0} errors, #{skips || 0} skips/
  assert_match content, @output, @output
end
