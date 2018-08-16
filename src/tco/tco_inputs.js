const d3 = require('d3');

const getUrlParameter = require('../common/get_url_param');

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
const setInput = (key, value) => inputElements[key].property('value', value);

const initInputs = () => {
  // d3.selectAll('input[type="range"]').append('button');
  inputNames.forEach(inputID => {
    const value = getUrlParameter(inputID);
    if (value !== void 0) {
      setInput(inputID, value);
    }
  });
};

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
  initInputs,
  getInputs,
  serialiseInputs
};
