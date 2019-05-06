$(document).ready(function () {
    var $modelSelect = $('#model');
    var $regionSelect = $('#regionIndex');
    var $numberInput = $('#number');
    var $btnSubmit = $('#btnSubmit');

    $('#brand').change(function () {
        var $selectedOptionValue = $(this).children("option:selected").val();
        if ($selectedOptionValue === "-1") {
            $modelSelect.prop('disabled', 'disabled');
            $regionSelect.prop('disabled', 'disabled');
            $numberInput.prop('disabled', 'disabled');
            $btnSubmit.prop('disabled', 'disabled');
        }
        else {
            $modelSelect.prop('disabled', false);
            $regionSelect.prop('disabled', false);
            $.ajax({
                type: 'GET',
                url: 'http://localhost:8080/Driver/getModels/' + $(this).children("option:selected").val(),
                dataType: 'json',
                success: function (data) {
                    $modelSelect.empty();
                    $.each(data, function(index, model) {
                        $modelSelect.append('<option value=' + model.id + '>' + model.name + '</option>');
                    });
                }
            });
        }

    });

    $regionSelect.change(function () {
        var $regionSelectValue = $(this).children("option:selected").val();
        if ($regionSelectValue === "-1") {
            $numberInput.prop('disabled', 'disabled');
        }
        else {
            $numberInput.prop('disabled', false);
        }
    });

    $numberInput.change(function () {
        var $numberValue = $(this).val();
        if (!$.isNumeric($numberValue.substring(0, 3))) {
            $btnSubmit.prop('disabled', 'disabled');
            $('#message').text("This is not correct number, try again");
            return;
        }
        $('#message').text("");
        $btnSubmit.prop('disabled', false);
    });

    $("select.time").change(function(){
        var selectedDate = $("#date").val();
        var hour = $(this).children("option:selected").val();
        var date = new Date();
        var currentHour = date.getHours();
        var currentDate = formatDate(date.getDate(), date.getMonth() + 1, date.getFullYear());
        if (selectedDate === currentDate && currentHour >= hour) {
            alert("Please, select right time");
            if (currentHour === 23) {
                currentHour = 0;
                currentDate = formatDate(date.getDate(), date.getMonth() + 1, date.getFullYear())
                selectedDate.text(currentDate);
            }
            else currentHour = currentHour+1;
            $(this).val(currentHour);
        }
    });
});


