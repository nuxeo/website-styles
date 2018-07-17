/* eslint-env browser */
/* global Chart */
'use strict';

const human_number = value => value.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ',');

const getUrlParameter = function getUrlParameter(sParam) {
  const sPageURL = decodeURIComponent(window.location.search.substring(1));
  const sURLVariables = sPageURL.split('&');
  let sParameterName;
  let i;

  for (i = 0; i < sURLVariables.length; i++) {
    sParameterName = sURLVariables[i].split('=');

    if (sParameterName[0] === sParam) {
      return sParameterName[1] === void 0 ? true : sParameterName[1];
    }
  }
  return void 0;
};

const param_names = ['numberofsystems', 'easytofind', 'timetofind', 'frequencytofind', 'avgsalary', 'numberofstaff'];

const param_transformations = {
  easytofind: function(value) {
    // console.log('value', value);
    // console.log('is_true', value === 'Yes');
    return value === 'Yes' ? 1 : 0;
  },
  timetofind: function(value) {
    const options = {
      'Less than 30 seconds': 30,
      'Less than a minute': 60,
      '1–3 minutes': 3 * 60,
      '4 minutes or more': 5 * 60,
      "I can't find the information": 8 * 60
    };
    return options[value];
  },
  frequencytofind: function(value) {
    const options = {
      'Once an hour': 1,
      '3 times an hour': 3,
      '10 times an hour': 10,
      'More than 10 times an hour': 15
    };
    return options[value];
  },
  avgsalary: function(value) {
    const options = {
      '< $30k': 30000,
      '$30k–$50k': 50000,
      '$50k–$75k': 75000,
      '$75k–$100k': 100000,
      '> $100k': 150000
    };
    return options[value];
  }
};

const raw_param_data = {};
const param_data = {};
let param_value;
let all_required = true;
for (let i = 0; i < param_names.length; i++) {
  const param = param_names[i];
  param_value = getUrlParameter(param);
  // console.log('param', param, param_value);
  if (!param_value) {
    all_required = false;
  }
  raw_param_data[param] = param_value;
  param_data[param] =
    typeof param_transformations[param] === 'function' ? param_transformations[param](param_value) : param_value;
  // document.getElementById(param).innerHTML = param_value + ' (' + param_data[param] + ')';
}

const nuxeo_speed_to_find = 30;
const hours_per_day = 8;
const working_days_per_year = 260;

const seconds_per_day_to_days_per_year = seconds_per_day => {
  const seconds_per_year = seconds_per_day * working_days_per_year;
  const days_per_year = seconds_per_year / 60 / 60 / hours_per_day;
  return days_per_year;
};

if (all_required) {
  const switch_multiplier = (param_data.numberofsystems - 1) * (param_data.easytofind ? 10 : 20) || 1;
  const frequency_per_day = param_data.frequencytofind * hours_per_day;

  const seconds_per_day_new = nuxeo_speed_to_find * param_data.numberofstaff * frequency_per_day;
  const days_per_year_new = seconds_per_day_to_days_per_year(seconds_per_day_new);

  const seconds_per_day_existing =
    (param_data.timetofind + switch_multiplier) * param_data.numberofstaff * frequency_per_day;
  const days_per_year_existing = seconds_per_day_to_days_per_year(seconds_per_day_existing);

  const daily_salary = param_data.avgsalary / working_days_per_year;

  // console.log('raw_param_data', param_data);
  // console.log('param_data', param_data);
  // console.log('switch_multiplier', switch_multiplier);
  // console.log('days_per_year_new', days_per_year_new);
  // console.log('days_per_year_existing', days_per_year_existing);
  // console.log('daily_salary', daily_salary);

  const cost_existing = days_per_year_existing * daily_salary;
  const cost_new = days_per_year_new * daily_salary;

  const days_per_year_saved = days_per_year_existing - days_per_year_new;
  const saving = days_per_year_saved * daily_salary;

  // console.log('cost_existing', cost_existing);
  // console.log('cost_new', cost_new);
  // console.log('saving', saving);

  let productivity = days_per_year_saved / (working_days_per_year * param_data.numberofstaff);
  productivity = (productivity * 100).toFixed(1);

  document.getElementById('saving').innerHTML = '$' + human_number(saving);
  document.getElementById('productivity').innerHTML = productivity + '%';

  const getColour = function(colour, opacity) {
    return 'rgba(' + colour + ', ' + opacity + ')';
  };
  const colours = {
    blue: '0, 103, 255',
    purple: '133, 0, 255',
    red: '255, 0, 68',
    orange: '241, 88, 24'
  };

  const ctx = document.getElementById('myChart').getContext('2d');
  Chart.defaults.global.defaultColor = '#fff';
  Chart.defaults.global.defaultFontColor = 'rgba(255, 255, 255, 1)';
  Chart.defaults.global.defaultFontFamily = 'Arial, sans-serif';
  Chart.defaults.global.defaultFontSize = 16;

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Existing Cost', 'New Cost', 'Potential Saving'],
      datasets: [
        {
          label: '$',
          data: [cost_existing, cost_new, saving],
          // yAxisID: '$ Per Year',
          backgroundColor: [
            getColour(colours.red, 0.9),
            getColour(colours.blue, 0.9),
            getColour(colours.purple, 0.9)

            // 'rgba(255, 99, 132, 0.9)',
            // 'rgba(54, 162, 235, 0.9)',
            // 'rgba(153, 102, 255, 0.9)'
            // 'rgba(75, 192, 192, 0.9)'
            // 'rgba(255, 206, 86, 0.9)',
            // 'rgba(255, 159, 64, 0.9)'
            // 'rgba(241, 88, 24, 1)'
            // 'rgba(133, 0, 255, 1)'
            // 'rgba(255, 0, 68, 1)'
            // 'rgba(0, 103, 255, 1)'
          ],
          borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)',
            'rgba(153, 102, 255, 1)'
            // 'rgba(75, 192, 192, 1)'
            // 'rgba(255, 206, 86, 1)',
            // 'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 3
        }
      ]
    },
    options: {
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
              callback: function(value) {
                return '$' + human_number(value);
              }
            }
          }
        ]
      },
      legend: {
        display: false
      },
      title: {
        display: true,
        fontSize: 20,
        text: 'Cost of Finding Information'
      },
      tooltips: {
        callbacks: {
          label: function(tooltipItem, data) {
            let label = data.datasets[tooltipItem.datasetIndex].label || '';

            label += human_number(tooltipItem.yLabel);
            return label;
          }
        }
      },
      gridlines: {
        color: 'rgba(255, 255, 255, 1)'
      }
    }
  });
} else {
  // Show Warning about data not having been added correctly
  document.getElementById('info').classList.add('hide');
  document.getElementById('info_missing').classList.remove('hide');
}

if (!getUrlParameter('return')) {
  const goNext = function(e) {
    if (e.type === 'click' || e.key === 'Enter') {
      document.getElementById('results').classList.add('hide');
      document.getElementById('typeform').classList.remove('hide');

      // Remove handlers
      document.getElementById('next').removeEventListener('click', goNext);
      document.removeEventListener('keyup', goNext);
    }
  };

  // Add handlers
  document.getElementById('next').addEventListener('click', goNext);
  document.addEventListener('keyup', goNext);

  const typeform_url = 'https://nuxeosurveys.typeform.com/to/g5A71P' + window.location.search;
  document.getElementById('typeform').setAttribute('data-url', typeform_url);

  document.querySelectorAll('.no-return').forEach(function(e) {
    e.classList.remove('hide');
  });

  // typeform
  (function() {
    /* eslint no-unused-vars: 0 */
    var qs,
      js,
      q,
      s,
      d = document,
      gi = d.getElementById,
      ce = d.createElement,
      gt = d.getElementsByTagName,
      id = 'typef_orm',
      b = 'https://embed.typeform.com/';
    if (!gi.call(d, id)) {
      js = ce.call(d, 'script');
      js.id = id;
      js.src = b + 'embed.js';
      q = gt.call(d, 'script')[0];
      q.parentNode.insertBefore(js, q);
    }
  })();
}
