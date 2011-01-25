module ERBGrammar
  BasePath = File.expand_path(File.dirname(__FILE__))
  require File.join(BasePath, 'shared_atomic_section_methods.rb')
  require File.join(BasePath, 'shared_methods.rb')
  require File.join(BasePath, 'shared_erb_methods.rb')
  require File.join(BasePath, 'shared_html_tag_methods.rb')
  require File.join(BasePath, 'shared_open_tag_methods.rb')
  require File.join(BasePath, 'shared_sexp_parsing.rb')
  require File.join(BasePath, 'erb_document.rb')
  require File.join(BasePath, 'erb_output_tag.rb')
  require File.join(BasePath, 'fake_erb_output.rb')
  require File.join(BasePath, 'erb_tag.rb')
  require File.join(BasePath, 'html_open_tag.rb')
  require File.join(BasePath, 'html_close_tag.rb')
  require File.join(BasePath, 'html_self_closing_tag.rb')
  require File.join(BasePath, 'html_tag_attributes.rb')
  require File.join(BasePath, 'html_tag_attribute.rb')
  require File.join(BasePath, 'html_quoted_value.rb')
  require File.join(BasePath, 'ruby_code.rb')
  require File.join(BasePath, 'text.rb')
  require File.join(BasePath, 'whitespace.rb')
  require File.join(BasePath, 'html_directive.rb')
  require File.join(BasePath, 'html_doctype.rb')
  require File.join(BasePath, 'erb_yield.rb')
  require File.join(BasePath, 'syntax_node.rb')
end
