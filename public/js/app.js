document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.datepicker');
  var instances = M.Datepicker.init(elems, {});

  for (var i = 0; i < instances.length; ++i) {
    var date = elems[i].value.split(/[^0-9]/);
    var newDate = new Date(date[0], date[1] - 1, date[2]);
    instances[i].setDate(newDate);
    elems[i].value = instances[i].toString();
  }
});

document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.timepicker');
  var instances = M.Timepicker.init(elems, {twelveHour: true});

  for (var i = 0; i < instances.length; ++i) {
    var instance = instances[i];

    if (elems[i].value === '') {
      continue;
    }

    instance._updateTimeFromInput();

    var minutes = M.Timepicker._addLeadingZero(instance.minutes);

    if (instances[i].hours > 12) {
      elems[i].value = [M.Timepicker._addLeadingZero(instance.hours - 12), minutes].join(':') + ' PM';
    } else {
      elems[i].value = [M.Timepicker._addLeadingZero(instance.hours), minutes].join(':') + ' AM';
    }
  }
});

document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.sidenav');
  var instances = M.Sidenav.init(elems, {});
});