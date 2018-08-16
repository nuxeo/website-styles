const calcTco = (inputs, number_removed) => {
  // const inputs = Object.assign({}, inputs_source);
  const { software, server, storage, staff, infrastructure } = inputs;
  const totals = [];

  // Software
  const software_num_systems = Math.max(
    1,
    software.num_systems - number_removed
  );
  totals.push(software_num_systems * software.avg_cost);

  // server
  const server_num = Math.max(1, server.num - number_removed);
  const reduction_multiplier = (100 - (server.num - server_num)) / 100;
  totals.push(server_num * server.avg_cost + server.avg_software_cost);

  // storage
  const storage_cloud_cost = number_removed
    ? ((software.num_systems - server_num / 16) / software.num_systems) *
      storage.cloud_cost
    : storage.cloud_cost;
  totals.push(
    storage.internal_cost * reduction_multiplier + storage_cloud_cost
  );

  // staff
  const staff_num = Math.max(1, staff.num - number_removed);
  totals.push(staff_num * staff.avg_salary);

  // infrastructure
  totals.push(
    infrastructure.network_cost * reduction_multiplier +
      infrastructure.security_cost * reduction_multiplier +
      infrastructure.datacentre_cost * reduction_multiplier +
      infrastructure.power_cost * reduction_multiplier
  );

  const total = totals.reduce((sum, sub_total) => sum + sub_total, 0);

  return {
    id: number_removed,
    total
  };
};

const calcSaving = (calc, hasSaving, calcs) => {
  if (hasSaving) {
    calc.saving = calcs[0].total - calc.total;
    calc.saving_percentage = 1 - calc.total / calcs[0].total;
  } else {
    calc.saving = 0;
    calc.saving_percentage = 0;
  }
  return calc;
};

module.exports = {
  calcTco,
  calcSaving
};
