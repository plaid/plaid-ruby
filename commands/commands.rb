require 'ruble'

command 'Swap Case' do |cmd|
  #cmd.key_binding = 'SHIFT+CTRL+A' # uncomment for a key binding
  cmd.scope = 'source'
  cmd.output = :replace_selection
  cmd.input = :selection, :word
  cmd.invoke do |context|
    word = $stdin.gets
    context.exit_discard if word.nil? # exit if the selection is null
    print word.swapcase
  end
end

# Use Commands > Bundle Development > Insert Bundle Section > Command
# to easily add new commands