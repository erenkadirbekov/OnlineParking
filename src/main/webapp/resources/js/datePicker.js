var date = new Date();
date.setDate(date.getDate());

var today = new Date();

var dd = today.getDate();
var mm = today.getMonth()+1;
var yyyy = today.getFullYear();


if (date.getHours() >= 23) dd += 1;
today = formatDate(dd, mm, yyyy);

$('#date').val(today);

$('#date').datepicker({
    startDate: date
});

function formatDate(dd, mm, yyyy) {
    if(dd < 10)
    {
        dd = '0' + dd;
    }

    if(mm < 10)
    {
        mm = '0' + mm;
    }
    return mm + '/' + dd + '/' + yyyy;
}