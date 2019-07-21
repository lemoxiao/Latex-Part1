std::vector<int> values_of_x(number_of_values_of_x,
	min_value_of_x);
for (unsigned int i = 1; i < number_of_values_of_x; i++) {
	values_of_x[i] = values_of_x[i - 1] + 1;
}
prob_x = 1.0 / number_of_values_of_x;
std::vector<std::vector<double> > p_z;
for (unsigned int idx = 0; idx < p_z.size(); idx++) {
	p_z[idx] = std::vector<double>(
		(max_value_of_x * (idx + 1) - min_value_of_x
			* (idx + 1)) + 1, INIT_VALUE);
}

double prob(int Z, int value_of_z) {
	if (value_of_z < min_value_of_x * Z ||
		value_of_z > max_value_of_x * Z) {
			return 0.0;
	}
	if (value_of_z < min_value_of_z ||
		value_of_z > max_value_of_z) {
			return 0.0;
	}
	int idx_value_of_z = -(min_value_of_z - value_of_z);
	int idx_N = Z - 1;
	if (p_z[idx_N][idx_value_of_z] == -2.0) {
		if (Z > 1) {
			double pp = 0.0;
			for (unsigned int i = 0; i < number_of_values_of_x; i++) {
				pp += prob(Z - 1, value_of_z - values_of_x[i], p);
			}
			p_z[idx_N][idx_value_of_z] = prob_x * pp;
		} else {
			if (Z == 1) {
				for (unsigned int j = 0; j < number_of_values_of_x; j++) {
					if (value_of_z == values_of_x[j]) {
						p_z[idx_N][idx_value_of_z] = prob_x;
						break;
					}
				}
			}
			if (p_z[idx_N][idx_value_of_z] == INIT_VALUE) {
				p_z[idx_N][idx_value_of_z] = 0.0;
			}
		}
	}
	return p_z[idx_N][idx_value_of_z];
}
