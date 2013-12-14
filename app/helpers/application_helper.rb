module ApplicationHelper
  def order_total(line_items)
    total = 0
    line_items.each do |line_item|
      total += (line_item.product_price * line_item.quantity)
    end
    total
  end

  def stripe_checkout_data_description
    descriptions = @line_items.map do |line_item|
      "(#{line_item.quantity})#{line_item.product_name} @ $#{line_item.product_price/100}.00"
    end
    descriptions.join("; ")
  end

  module BootstrapExtension
     FORM_CONTROL_CLASS = "form-control"

     # Override the 'text_field_tag' method defined in FormTagHelper[1]
     #
     # [1] https://github.com/rails/rails/blob/master/actionview/lib/action_view/helpers/form_tag_helper.rb
     def text_field_tag(name, value = nil, options = {})
       class_name = options[:class]
       if class_name.nil?
         # Add 'form-control' as the only class if no class was provided
         options[:class] = FORM_CONTROL_CLASS
       else
         # Add ' form-control' to the class if it doesn't already exist
         options[:class] << " #{FORM_CONTROL_CLASS}" if
           " #{class_name} ".index(" #{FORM_CONTROL_CLASS} ").nil?
       end

       # Call the original 'text_field_tag' method to do the real work
       super
     end
   end

   # Add the modified method to ApplicationHelper
   include BootstrapExtension
end
