class Notifications
	constructor: ->
		@notifications = $("[data-behavior='notifications']")
		@setup() if @notifications.length > 0

	setup: ->
		$("[data-behavior='read-notifications']").on "click", @handleRead
		$.ajax(
				url: '/notifications.json'
				dataType: 'JSON'
				method: 'GET'
				success: @handleSuccess
			)

	handleRead: (e) =>
		$.ajax(
				url: '/notifications/mark_as_read'
				dataType: 'JSON'
				method: 'POST'
				success: ->
					$("[data-behavior='unread-count']").text(0)

			)
			
	handleSuccess: (data) =>
		console.log(data)
		items = $.map data, (notification) ->
			"<a class='menuNav-item'>#{notification.actor.username} #{notification.action} #{notification.notifiable.type} </a>"
		
		none = "<p class='menuNav-item'>No new notifications"
		$("[data-behavior='unread-count']").text(items.length)
		if items.length > 0
			$("[data-behavior='notification-items']").html(items)
		else 
			$("[data-behavior='notification-items']").html(none)

jQuery ->
	new Notifications