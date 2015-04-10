var March_to_may, amount_billable, months, sub_grid;

amount_billable = function(hours, rate, tax_rate) {
  if (tax_rate == null) {
    tax_rate = 1.05;
  }
  return hours * rate * tax_rate;
};

sub_grid = [5, 3, 0, 6, 0, 0, 0, 9, 8];

months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

March_to_may = [2, 3, 4];
