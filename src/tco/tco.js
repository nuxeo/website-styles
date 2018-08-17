/* eslint-env browser */
'use strict';

const d3 = require('d3');
const debugLib = require('debug');
const debug = debugLib('tco');

const { calcTco, calcSaving } = require('./tco_calc');
const { initInputs, getInputs, serialiseInputs } = require('./tco_inputs');

const clone = obj => JSON.parse(JSON.stringify(obj));
const humanNumber = value => value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
const toPercentage = value => `${humanNumber((value * 100).toFixed(2))}%`;
const toMoney = value => `$${humanNumber(value.toFixed(0))}`;

const getUrlParameter = require('../common/get_url_param');

initInputs();

const getColour = (colour, opacity) => `rgba(${colour}, ${opacity})`;

const colours = {
  blue: '0, 103, 255', // rgb(0, 103, 255)
  purple: '133, 0, 255', // rgb(133, 0, 255)
  red: '255, 0, 68', // rgb(255, 0, 68)
  orange: '241, 88, 24' // rgb(241, 88, 24)
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

const customYAxis = g => {
  g.call(
    d3
      .axisRight(y)
      .tickSize(width)
      .tickFormat('')
  );
  g.select('.domain').remove();
  g.selectAll('.tick:not(:first-of-type) line')
    .attr('stroke', '#777')
    .attr('stroke-dasharray', '2,2');
};

// get graph div
const tco_graph = d3.select('#tco-graph');

const svg = tco_graph
  .append('svg')
  .attr('viewBox', `0 0 ${config.width} ${config.height}`);

tco_graph
  .append('p')
  .attr('class', 'is-blue text-center unpad')
  .text('Systems Removed');

// Define the div for the tooltip
const tooltip = tco_graph
  .append('div')
  .attr('class', 'd3-tooltip')
  .style('opacity', 0);

const g = svg
  .append('g')
  .attr('transform', `translate(${margin.left},${margin.top})`)
  .style('font-family', 'Helvetica Neue",Helvetica,Roboto,Arial,sans-serif')
  .style('font-size', '14px');
g.append('g')
  .attr('class', 'axis axis--x')
  .style('font-size', '14px')
  .attr('transform', `translate(0,${height})`);
g.append('g')
  .attr('class', 'axis axis--y')
  .style('font-size', '14px');
g.append('g').attr('class', 'axis axis--y-right');

const setBars = bar => {
  bar
    .attr('stroke-dashoffset', d => height - y(d.total))
    .attr(
      'stroke-dasharray',
      d => `${(height - y(d.total)) * 2 + x.bandwidth()}, ${x.bandwidth()}`
    )
    .attr('x', d => x(d.id))
    .attr('y', d => y(d.total))
    .attr('width', x.bandwidth())
    .attr('height', d => height - y(d.total));
};
const setSaving = bar => {
  bar
    .select('rect')
    .attr('x', d => x(d.id))
    .attr('y', d => height - y(d.saving) - 3)
    .attr('width', x.bandwidth())
    .attr('height', 0);
  bar
    .select('.text-percentage')
    .attr('x', d => x(d.id) + x.bandwidth() / 2)
    // Don't move until 10% and 1 px per % up to 20%
    .attr('y', d => Math.min(10, Math.max(d.saving_percentage - 0.1, 0) * 100) + 10)
    .attr('text-anchor', 'middle')
    // Only show > 4.5% Saving
    .text(d => (d.saving_percentage > 0.045 ? toPercentage(d.saving_percentage) : ''));
  bar
    .select('.text-saving')
    .attr('x', d => x(d.id) + x.bandwidth() / 2)
    // Don't move until 10% and 1 px per % up to 20%
    .attr('y', d => Math.min(10, Math.max(d.saving_percentage - 0.1, 0) * 100) + 23)
    .attr('text-anchor', 'middle')
    // Only show > 10% Saving
    .text(d => (d.saving_percentage > 0.1 ? 'saving' : ''));
};

const render = () => {
  const inputs = getInputs();
  debug('inputs', inputs);

  const calcs = Array(Math.min(5, inputs.software.num_systems))
    .fill(clone(inputs))
    .map(calcTco)
    .map(calcSaving);

  debug('calcs', calcs);

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
    .call(d3.axisLeft(y).tickFormat(d => toMoney(d)));

  // Horizontal axis lines
  g.select('.axis--y-right').call(customYAxis);

  // Add/remove/amend bars
  const update = g.selectAll('.bar').data(calcs, d => d.id);
  const enter = update
    .enter()
    .append('rect')
    .attr('class', 'bar')
    .on('mouseover', function(d) {
      const barCoords = this.getBoundingClientRect();
      const bar = {
        left: barCoords.left + window.scrollX,
        top: barCoords.top + window.scrollY,
        width: barCoords.width,
        height: barCoords.height
      };

      const text = [];
      if (d.saving) {
        text.push(`TCO: ${toMoney(d.total)}`);
        text.push(`Saving: <strong>${toMoney(d.saving)}</strong>`);

        const saving = d3
          .select(svg.selectAll('.bar--saving').nodes()[d.id])
          .select('rect');
        const saving_y = saving.attr('y');
        const saving_height = saving.attr('height');

        saving
          .classed('swapped', true)
          .attr('y', saving_height)
          .attr('height', saving_y);
      } else {
        text.push(`TCO: ${toMoney(d.total)}`);
      }

      tooltip
        .transition()
        .duration(200)
        .style('opacity', 0.9);

      // Add Tooltip text
      tooltip.html(text.join('<br>'));

      // Tooltip Centred
      const tooltip_width = tooltip.node().getBoundingClientRect().width;
      const tooltip_left = bar.left + (bar.width - tooltip_width) / 2;

      // Tooltip top of the rect
      const tooltip_top = bar.top + 10;

      tooltip.style('left', `${tooltip_left}px`).style('top', `${tooltip_top}px`);
    })
    .on('mouseout', () => {
      svg.selectAll('.bar--saving .swapped').each(function() {
        const saving = d3.select(this);
        const saving_y = saving.attr('y');
        const saving_height = saving.attr('height');

        saving
          .classed('swapped', false)
          .attr('y', saving_height)
          .attr('height', saving_y);
      });

      tooltip
        .transition()
        .duration(500)
        .style('opacity', 0);
    })
    .call(setBars);

  update.exit().remove();

  update.transition().call(setBars);

  update.merge(enter);

  // Add/remove/amend bars
  const update_saving_g = g.selectAll('.bar--saving').data(calcs, d => d.id);
  const enter_saving_g = update_saving_g
    .enter()
    .append('g')
    .attr('class', 'bar--saving');

  enter_saving_g.append('rect');
  enter_saving_g.append('text').attr('class', 'text-percentage');
  enter_saving_g.append('text').attr('class', 'text-saving');
  enter_saving_g.call(setSaving);

  update_saving_g.transition().call(setSaving);

  update_saving_g.merge(enter_saving_g);

  update_saving_g.exit().remove();
};

const updateSliderValue = function() {
  // const { id, value } = this;
  const id = this.id;
  const value = +this.value;
  const display = d3.select(`#${id}_value`);

  const prefix = display.classed('money') ? '$' : '';

  display.text(prefix + humanNumber(value));
};

const sliders = d3.select('#sliders');
sliders
  .selectAll('input[type=range]')
  .on('input', function() {
    updateSliderValue.call(this);

    render();
  })
  .each(updateSliderValue);

// Init the graph
render();

if (!getUrlParameter('return')) {
  const goNext = function(e) {
    if (e.type === 'click' || e.key === 'Enter') {
      const typeform_url =
        'https://nuxeosurveys.typeform.com/to/wO46m7?' + serialiseInputs();
      document.getElementById('typeform').setAttribute('data-url', typeform_url);
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

  document.querySelectorAll('.no-return').forEach(function(e) {
    e.classList.remove('hide');
  });
}
