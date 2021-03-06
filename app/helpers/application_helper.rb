module ApplicationHelper

	def link_to_add_fields(name, f, association)
    	new_object = f.object.send(association).klass.new
    	id = new_object.object_id
    	fields = f.fields_for(association, new_object, child_index: id) do |builder|
      	render(association.to_s.singularize + "_fields", f: builder)
    	end
    	link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  	end

	def message_person(mailbox_name, message)
		mailbox_name == 'inbox' ? message.sender : message.recipient_list.join(', ')
	end

def lat_lng
  @lat_lng ||= session[:lat_lng] ||= get_geolocation_data_the_hard_way
end


end
