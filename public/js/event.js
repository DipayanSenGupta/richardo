    $(document).ready(function() {

       $('#booking_time').datetimepicker({
        format: moment_date_format + ' ' + moment_time_format,
        ignoreReadonly: true,
        });
    
        $('#event_time').datetimepicker({
        format: moment_date_format + ' ' + moment_time_format,
        ignoreReadonly: true,
        });        
        
        function showItem(menu_id = "1") {
            $.ajax({
                type: 'POST',
                url:  '/sells/action',
                data: {
                    menu_id: menu_id
                },
                success: function(data) {
                    $('#items-list').html(data.items);
                    if (data.addedItems) {
                        $('#added-items-list').html(data.addedItems);
                    }
                }
            });
        }

        $("#menu_id").change(function() {
            var menu_id = $(this).val();
            showItem(menu_id)
        });
        showItem();

        function addEvent(event_name, menu_id) {
            $.ajax({
                type: 'POST',
                url: '/sells/action',
                data: {
                    event_name: event_name,
                    menu_id: menu_id
                },
                success: function(data) {}
            });
        }

        $("#event_name").on('keypress', function(e) {
            var event_name = $(this).val();
            var menu_id = $("#menu_id").val();
            if (e.which == 13) {
                e.preventDefault();
                addEvent(event_name, menu_id);
            }
        });

        function addItem(item_id, menu_id) {
            $.ajax({
                type: 'POST',
                url: '/sells/action',
                data: {
                    add: item_id,
                    menu_id: menu_id
                },
                success: function(data) {
                    $('#items-list').html(data.items);
                    if (data.addedItems) {
                        $('#added-items-list').html(data.addedItems);
                    }
                }
            });
        }

        $(document).on('click', "#addItem", function(e) {
            try {
                var item_id = $(this).val();;
                var menu_id = $("#menu_id").val();
                addItem(item_id, menu_id);
            } catch (ex) {
                alert('An error occurred and I need to write some code to handle this!');
            }
            e.preventDefault();
        });

        function addExtraItem(add_extra_item, menu_id) {
            $.ajax({
                type: 'POST',
                url: '/sells/action',
                data: {
                    add_extra_item: add_extra_item,
                    menu_id: menu_id
                },
                success: function(data) {
                    $('#items-list').html(data.items);
                    console.log(data);
                    if (data.addedItems) {
                        $('#added-items-list').html(data.addedItems);
                    }
                }
            });
        }

        $("#add_extra_item").on('keypress', function(e) {
            if (e.which == 13) {
                var add_extra_item = $(this).val();
                var menu_id = $("#menu_id").val();
                e.preventDefault();
                addExtraItem(add_extra_item, menu_id);
            }
        });


        function deleteItem(item_id, menu_id) {
            $.ajax({
                type: 'POST',
                url: '/sells/action',
                data: {
                    delete: item_id,
                    menu_id: menu_id
                },
                success: function(data) {
                    $('#items-list').html(data.items);
                    if (data.addedItems) {
                        $('#added-items-list').html(data.addedItems);
                    }
                }
            });
        }

        $(document).on('click', "#deleteItem", function(e) {
            try {
                var item_id = $(this).val();
                var menu_id = $("#menu_id").val();
                deleteItem(item_id, menu_id);
            } catch (ex) {
                alert('An error occurred and I need to write some code to handle this!');
            }
            e.preventDefault();
        });
    });