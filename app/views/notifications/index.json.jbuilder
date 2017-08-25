json.array! @notifications do |notification|
	json.id notification.id
	# json.recipient notification.recipient.name
	json.actor notification.actor
	json.action notification.action
	json.notifiable do
		json.type  "#{notification.notifiable.class.to_s.underscore.humanize.downcase}"
	end
	json.url store_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end