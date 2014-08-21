module CkHelpers

	def fill_in_ckeditor(locator, params = {})
	  # Find out ckeditor id at runtime using its label
	  locator = find('label', text: locator)[:for] if page.has_css?('label', text: locator)
	  # Fill the editor content
	  page.execute_script <<-SCRIPT
	      var ckeditor = CKEDITOR.instances.#{locator}
	      ckeditor.setData('#{params[:with]}')
	      ckeditor.focus()
	      ckeditor.updateElement()
	  SCRIPT
	end
end

RSpec.configure do |c|
	c.include CkHelpers, type: :feature
end