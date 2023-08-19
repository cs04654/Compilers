def loadvr(variable, register):

	'''
		register = variable
		Reading from MEM
	'''

	if (isinstance(variable, str) and variable.isdigit()):
		asm_instructions.append(gen_mips_instr('li', [register, variable]))
	else:
		entity = variable
		if (is_global_var(entity)):
			asm_instructions.append(gen_mips_instr('lw', [register, str(-entity.offset), '$s0']))
		elif (is_local(entity)):
			if (is_variable(entity) or (is_parameter(entity) and (is_cv_par(entity) or is_cp_par(entity)))):
				asm_instructions.append(gen_mips_instr('lw', [register, str(-entity.offset), '$sp']))
			elif (is_parameter(entity) and is_ref_par(entity)):
				asm_instructions.append(gen_mips_instr('lw', ['$t0', str(-entity.offset), '$sp']))
				asm_instructions.append(gen_mips_instr('lw', [register, '0', '$t0']))
		else:
			if (is_variable(entity) or (is_parameter(entity) and (is_cv_par(entity) or is_cp_par(entity)))):
				gnvlcode(entity)
				asm_instructions.append(gen_mips_instr('lw', [register, '0', '$t0']))
			elif (is_parameter(entity) and is_ref_par(entity)):
				gnvlcode(entity)
				asm_instructions.append(gen_mips_instr('lw', ['$t0', '0', '$t0']))
				asm_instructions.append(gen_mips_instr('lw', [register, '0', '$t0']))
