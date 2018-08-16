const d3 = require('d3');

const inputNames = [
  'software_num_systems',
  'software_avg_cost',
  'server_num',
  'server_avg_cost',
  'server_avg_software_cost',
  'storage_internal_cost',
  'storage_cloud_cost',
  'staff_num',
  'staff_avg_salary',
  'infrastructure_network_cost',
  'infrastructure_security_cost',
  'infrastructure_datacentre_cost',
  'infrastructure_power_cost'
];

// cache input selectors
const inputElements = inputNames.reduce((elements, inputID) => {
  elements[inputID] = d3.select(`#${inputID}`);

  return elements;
}, {});

const getInput = key => +inputElements[key].property('value');
//
// const software_num_systems = d3.select('#software_num_systems');
// const software_avg_cost = d3.select('#software_avg_cost');
// const server_num = d3.select('#server_num');
// const server_avg_cost = d3.select('#server_avg_cost');
// const server_avg_software_cost = d3.select('#server_avg_software_cost');
// const storage_internal_cost = d3.select('#storage_internal_cost');
// const storage_cloud_cost = d3.select('#storage_cloud_cost');
// const staff_num = d3.select('#staff_num');
// const staff_avg_salary = d3.select('#staff_avg_salary');
// const infrastructure_network_cost = d3.select('#infrastructure_network_cost');
// const infrastructure_security_cost = d3.select('#infrastructure_security_cost');
// const infrastructure_datacentre_cost = d3.select('#infrastructure_datacentre_cost');
// const infrastructure_power_cost = d3.select('#infrastructure_power_cost');

// const initInput = () => {
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
// };

const getInputs = () => {
  const software = {
    num_systems: getInput('software_num_systems'),
    avg_cost: getInput('software_avg_cost')
  };

  const server = {
    num: getInput('server_num'),
    avg_cost: getInput('server_avg_cost'),
    avg_software_cost: getInput('server_avg_software_cost')
  };

  const storage = {
    internal_cost: getInput('storage_internal_cost'),
    cloud_cost: getInput('storage_cloud_cost')
  };

  const staff = {
    num: getInput('staff_num'),
    avg_salary: getInput('staff_avg_salary')
  };

  const infrastructure = {
    network_cost: getInput('infrastructure_network_cost'),
    security_cost: getInput('infrastructure_security_cost'),
    datacentre_cost: getInput('infrastructure_datacentre_cost'),
    power_cost: getInput('infrastructure_power_cost')
  };

  return {
    software,
    server,
    storage,
    staff,
    infrastructure
  };
};

const serialiseInputs = () =>
  inputNames.map(inputID => `${inputID}=${getInput(inputID)}`).join('&');

module.exports = {
  getInputs,
  serialiseInputs
};
