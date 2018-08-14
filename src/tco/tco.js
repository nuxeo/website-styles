/* eslint-env browser */
/* global Chart */
'use strict';

const d3 = require('d3');

const human_number = value => value.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ',');

const getUrlParameter = require('../common/get_url_param');

const software_num_systems = d3.select('#software_num_systems');
const software_avg_cost = d3.select('#software_avg_cost');
const server_num = d3.select('#server_num');
const server_avg_cost = d3.select('#server_avg_cost');
const server_avg_software_cost = d3.select('#server_avg_software_cost');
const storage_internal_cost = d3.select('#storage_internal_cost');
const storage_cloud_cost = d3.select('#storage_cloud_cost');
const staff_num = d3.select('#staff_num');
const staff_avg_salary = d3.select('#staff_avg_salary');
const infrastructure_network_cost = d3.select('#infrastructure_network_cost');
const infrastructure_security_cost = d3.select('#infrastructure_security_cost');
const infrastructure_datacentre_cost = d3.select('#infrastructure_datacentre_cost');
const infrastructure_power_cost = d3.select('#infrastructure_power_cost');

const getColour = (colour, opacity) => `rgba(${colour}, ${opacity})`;

const colours = {
  blue: '0, 103, 255', // rgb(0, 103, 255)
  purple: '133, 0, 255', // rgb(133, 0, 255)
  red: '255, 0, 68', // rgb(255, 0, 68)
  orange: '241, 88, 24' // rgb(241, 88, 24)
};

const svg = d3.select('#tco-graph');

// const raw_param_data = {};
// const param_data = {};
// let param_value;
// let all_required = true;
// for (let i = 0; i < param_names.length; i++) {
//   const param = param_names[i];
//   param_value = getUrlParameter(param);
//   // console.log('param', param, param_value);
//   if (!param_value) {
//     all_required = false;
//   }
//   raw_param_data[param] = param_value;
//   param_data[param] =
//     typeof param_transformations[param] === 'function' ? param_transformations[param](param_value) : param_value;
//   // document.getElementById(param).innerHTML = param_value + ' (' + param_data[param] + ')';
// }

const getInputs = () => {
  const software = {
    num_systems: +software_num_systems.property('value'),
    avg_cost: +software_avg_cost.property('value')
  };

  const server = {
    num: +server_num.property('value'),
    avg_cost: +server_avg_cost.property('value'),
    avg_software_cost: +server_avg_software_cost.property('value')
  };

  const storage = {
    internal_cost: +storage_internal_cost.property('value'),
    cloud_cost: +storage_cloud_cost.property('value')
  };

  const staff = {
    num: +staff_num.property('value'),
    avg_salary: +staff_avg_salary.property('value')
  };

  const infrastructure = {
    network_cost: +infrastructure_network_cost.property('value'),
    security_cost: +infrastructure_security_cost.property('value'),
    datacentre_cost: +infrastructure_datacentre_cost.property('value'),
    power_cost: +infrastructure_power_cost.property('value')
  };

  return {
    software,
    server,
    storage,
    staff,
    infrastructure
  };
};

const tco_calcs = (inputs, number_removed) => {
  const { software, server, storage, staff, infrastructure } = inputs;
  const reduction_multiplier = (100 - number_removed) / 100;

  // Software
  software.num_systems = Math.max(1, software.num_systems - number_removed);
  software.sub_total = software.num_systems * software.avg_cost;

  // server
  server.num = Math.max(1, server.num - number_removed);
  server.sub_total = server.num * server.avg_cost + server.avg_software_cost;

  // storage
  if (number_removed) {
    storage.internal_cost = storage.internal_cost * reduction_multiplier;
    storage.cloud_cost = storage.cloud_cost * reduction_multiplier;
  }
  storage.sub_total = storage.internal_cost + storage.cloud_cost;

  // staff
  staff.num = Math.max(1, staff.num - number_removed);
  staff.sub_total = staff.num * staff.avg_salary;

  // infrastructure
  if (number_removed) {
    infrastructure.network_cost = infrastructure.network_cost * reduction_multiplier;
    infrastructure.security_cost = infrastructure.security_cost * reduction_multiplier;
    infrastructure.datacentre_cost = infrastructure.datacentre_cost * reduction_multiplier;
    infrastructure.power_cost = infrastructure.power_cost * reduction_multiplier;
  }
  infrastructure.sub_total =
    infrastructure.network_cost +
    infrastructure.security_cost +
    infrastructure.datacentre_cost +
    infrastructure.power_cost;

  const calculations = {
    software,
    server,
    storage,
    staff,
    infrastructure
  };
  calculations.total = Object.keys(calculations).reduce((sum, key) => sum + calculations[key].sub_total, 0);
  calculations.id = number_removed;
  return calculations;
};

const config = {
  width: 600,
  height: 300,
  xPadding: 0.2
};

const margin = {
  top: 0,
  right: 10,
  bottom: 20,
  left: 80
};

const width = config.width - margin.left - margin.right;
const height = config.height - margin.top - margin.bottom;

const x = d3
  .scaleBand()
  .rangeRound([0, width])
  .padding(config.xPadding);
const y = d3.scaleLinear().rangeRound([height, 0]);

const g = svg
  .append('g')
  .attr('transform', `translate(${margin.left},${margin.top})`)
  .style('font-family', 'Helvetica Neue",Helvetica,Roboto,Arial,sans-serif');
g.append('g')
  .attr('class', 'axis axis--x')
  .style('font-size', '14px')
  .attr('transform', `translate(0,${height})`);
g.append('g')
  .attr('class', 'axis axis--y')
  .style('font-size', '14px');

const render = () => {
  const inputs = getInputs();
  const calcs = [];

  // console.log(tco_calcs(inputs, 0));
  for (let systems_removed = 0; systems_removed < Math.min(6, inputs.software.num_systems); systems_removed++) {
    // console.log(systems_removed);
    calcs.push(tco_calcs(inputs, systems_removed));
  }
  console.log('calcs', calcs);

  // Update the x axis
  x.domain(calcs.map(d => d.id));
  g.select('.axis--x')
    .transition()
    .call(
      d3.axisBottom(x).tickFormat(d => {
        return d ? `${d} removed` : 'Current Situation';
      })
    );

  // Update the y axis
  y.domain([0, calcs[0].total]);
  g.select('.axis--y')
    .transition()
    .call(d3.axisLeft(y).tickFormat(d => `$${human_number(d)}`));

  const update = g.selectAll('.bar').data(calcs, d => d.id);
  const enter = update
    .enter()
    .append('rect')
    .attr('class', 'bar')
    .attr('fill', getColour(colours.blue, 0.3))
    .attr('stroke', getColour(colours.blue, 1))
    .attr('stroke-width', 3)
    .attr('stroke-dashoffset', d => height - y(d.total))
    .attr('stroke-dasharray', d => `${(height - y(d.total)) * 2 + x.bandwidth()}, ${x.bandwidth()}`)
    .attr('x', d => x(d.id))
    .attr('y', d => y(d.total))
    .attr('width', x.bandwidth())
    .attr('height', d => height - y(d.total));

  update
    .transition()
    .attr('stroke-dashoffset', d => height - y(d.total))
    .attr('stroke-dasharray', d => `${(height - y(d.total)) * 2 + x.bandwidth()}, ${x.bandwidth()}`)
    .attr('x', d => x(d.id))
    .attr('y', d => y(d.total))
    .attr('width', x.bandwidth())
    .attr('height', d => height - y(d.total));
  update.merge(enter);
  update.exit().remove();
};

const sliders = d3.select('#sliders');
sliders
  .selectAll('input[type=range]')
  .on('input', function() {
    // const { id, value } = this;
    const id = this.id;
    const value = +this.value;
    const display = d3.select(`#${id}_value`);

    const prefix = display.classed('money') ? '$' : '';

    display.text(prefix + human_number(value));

    render();
  })
  .dispatch('input');

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
